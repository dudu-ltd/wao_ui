import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simple_observable/simple_observable.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/src/data/w_empty.dart';

class WTable extends StatefulWidget
    implements BaseWidget<WTableOn, WTableProp, WTableSlot> {
  @override
  late final WTableOn $on;

  @override
  late final WTableProp $props;

  @override
  late final WTableSlot $slots;

  late Observable<List> _dataListener;

  late List<WTableColumn> columns;

  @override
  _WTableState createState() => _WTableState();
  WTable(
    List<dynamic>? columns, {
    Key? key,
    WTableOn? on,
    WTableProp? props,
    WTableSlot? slots,
  }) : super(key: key) {
    $on = on ?? WTableOn();
    $props = props ?? WTableProp();
    $slots = slots ?? WTableSlot();
    setColumns(columns);
  }

  setColumns(List<dynamic>? columns) {
    if (columns == null) this.columns = [];
    if (columns is List<WTableColumn>) {
      this.columns = columns;
    } else {
      var _columns = <WTableColumn>[];
      columns?.forEach((column) {
        if (column is WTableColumn) {
          _columns.add(column);
        } else if (column is WTableColumnProp) {
          _columns.add(WTableColumn(props: column));
        } else {
          throw Exception('目前仅支持 List<WTableColumnProp> 与 List<WTableColumn> ');
        }
      });
      this.columns = _columns;
    }
  }

  List get data {
    return _dataListener.value;
  }

  set data(v) {
    _dataListener.value = v;
  }

  /**
      clearSelection	用于多选表格，清空用户的选择	—
      toggleRowSelection	用于多选表格，切换某一行的选中状态，如果使用了第二个参数，则是设置这一行选中与否（selected 为 true 则选中）	row, selected
      toggleAllSelection	用于多选表格，切换所有行的选中状态	-
      toggleRowExpansion	用于可展开表格与树形表格，切换某一行的展开状态，如果使用了第二个参数，则是设置这一行展开与否（expanded 为 true 则展开）	row, expanded
      setCurrentRow	用于单选表格，设定某一行为选中行，如果调用时不加参数，则会取消目前高亮行的选中状态。	row
      clearSort	用于清空排序条件，数据会恢复成未排序的状态	—
      clearFilter	不传入参数时用于清空所有过滤条件，数据会恢复成未过滤的状态，也可传入由columnKey组成的数组以清除指定列的过滤条件	columnKey
      doLayout	对 Table 进行重新布局。当 Table 或其祖先元素由隐藏切换为显示时，可能需要调用此方法	—
      sort	手动对 Table 进行排序。参数prop属性指定排序列，order指定排序顺序。
   */
}

class _WTableState extends State<WTable> {
  @override
  void initState() {
    super.initState();
    widget._dataListener = Observable<List>(
      initialValue: widget.$props.data,
      onChanged: (d) => setState(() {
        widget.$props.data = d;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.$props.showHeader!) header,
        if (widget.$props.data.isEmpty && whenEmpty != null)
          whenEmpty!
        else
          ...columns,
      ],
    );
  }

  Widget? get whenEmpty {
    return WEmpty(null);
  }

  List<Row> get columns {
    List<Row> rows = List.generate(widget.$props.data.length, (r) {
      return Row(
        children: List.generate(widget.columns.length, (c) {
          var column = widget.columns[c];
          dynamic row = widget.$props.data[r];
          return cellWidget(column, row);
        }),
      );
    });
    return rows;
  }

  Widget cellWidget(WTableColumn column, dynamic row) {
    Widget child = value(column, row);
    return widthWrapper(child, column);
  }

  Widget value(WTableColumn column, dynamic row) {
    var child;
    if (column.$slots.defaultSlotBefore is Function) {
      child = (column.$slots.defaultSlotBefore as Function).call(row);
    } else if (column.$slots.defaultSlot is List<Widget>) {
      child = column.$slots.defaultSlot;
    } else {
      var val = column.$props.prop == null ? '' : column.$props.prop?.call(row);
      child = Text('$val');
    }
    print(child);
    if (child is List<Widget>) {
      return Row(children: child);
    } else {
      if (child is Widget) {
        return child;
      }
    }
    throw ArgumentError.value(child, 'slots ', ' 默认插槽需要是部件或者是函数返回部件。');
  }

  Widget widthWrapper(Widget cell, WTableColumn column) {
    return column.$props.width == null
        ? Expanded(child: cell)
        : SizedBox(
            child: cell,
            width: double.parse(column.$props.width!),
          );
  }

  Widget get header {
    return Row(
      children: List.generate(
        widget.columns.length,
        (index) {
          WTableColumn column = widget.columns[index];
          Widget th = getHeaderCell(column);
          return column.$props.width == null
              ? Expanded(
                  child: th,
                )
              : SizedBox(
                  child: th,
                  width: double.parse(column.$props.width!),
                );
        },
      ),
    );
  }

  Widget getHeaderCell(WTableColumn column) {
    return Text(column.$props.label ?? '');
  }
}

class WTableOn extends BaseOn {
  /**
      select	当用户手动勾选数据行的 Checkbox 时触发的事件	selection, row
      select-all	当用户手动勾选全选 Checkbox 时触发的事件	selection
      selection-change	当选择项发生变化时会触发该事件	selection
      cell-mouse-enter	当单元格 hover 进入时会触发该事件	row, column, cell, event
      cell-mouse-leave	当单元格 hover 退出时会触发该事件	row, column, cell, event
      cell-click	当某个单元格被点击时会触发该事件	row, column, cell, event
      cell-dblclick	当某个单元格被双击击时会触发该事件	row, column, cell, event
      row-click	当某一行被点击时会触发该事件	row, column, event
      row-contextmenu	当某一行被鼠标右键点击时会触发该事件	row, column, event
      row-dblclick	当某一行被双击时会触发该事件	row, column, event
      header-click	当某一列的表头被点击时会触发该事件	column, event
      header-contextmenu	当某一列的表头被鼠标右键点击时触发该事件	column, event
      sort-change	当表格的排序条件发生变化的时候会触发该事件	{ column, prop, order }
      filter-change	当表格的筛选条件发生变化的时候会触发该事件，参数的值是一个对象，对象的 key 是 column 的 columnKey，对应的 value 为用户选择的筛选条件的数组。	filters
      current-change	当表格的当前行发生变化的时候会触发该事件，如果要高亮当前行，请打开表格的 highlight-current-row 属性	currentRow, oldCurrentRow
      header-dragend	当拖动表头改变了列的宽度的时候会触发该事件	newWidth, oldWidth, column, event
      expand-change	当用户对某一行展开或者关闭的时候会触发该事件（展开行时，回调的第二个参数为 expandedRows；树形表格时第二参数为 expanded）	row, (expandedRows | expanded)
   */
}

class WTableProp extends BaseProp {
  late List data;
  double? height;
  double? maxHeight;
  bool? stripe;
  bool? border;
  String? size;
  bool? fit;
  bool? showHeader;
  bool? highlightCurrentRow;
  String? currentRowKey;
  Function({dynamic row})? rowKey;
  String? emptyText;
  bool defaultExpandAll = false;
  List? expandRowKeys;
  dynamic defaultSort;
  String? tooltipEffect;
  bool? showSummary;
  String? sumText;
  Function({List columns, List data})? summaryMethod;
  Function({dynamic row, String column, int rowIndex, int columnIndex})?
      spanMethod;
  bool? selectOnIndeterminate;
  double? indent;
  bool? lazy;
  Function({dynamic row, dynamic treeNode, Function resolve})? load;
  Map<String, dynamic>? treeProps;

  WTableProp({
    List? data,
    double? height,
    double? maxHeight,
    bool? stripe,
    bool? border,
    String? size,
    bool? fit,
    bool? showHeader,
    bool? highlightCurrentRow,
    String? currentRowKey,
    Function({dynamic row})? rowKey,
    String? emptyText,
    bool defaultExpandAll = false,
    List? expandRowKeys,
    dynamic defaultSort,
    String? tooltipEffect,
    bool? showSummary,
    String? sumText,
    Function({List columns, List data})? summaryMethod,
    Function({dynamic row, String column, int rowIndex, int columnIndex})?
        spanMethod,
    bool? selectOnIndeterminate,
    double? indent,
    bool? lazy,
    Function({dynamic row, dynamic treeNode, Function resolve})? load,
    Map<String, dynamic>? treeProps,
  }) {
    this.data = data ?? [];
    this.height = height;
    this.maxHeight = maxHeight;
    this.stripe = stripe ?? false;
    this.border = border ?? false;
    this.size = size;
    this.fit = fit ?? true;
    this.showHeader = showHeader ?? true;
    this.highlightCurrentRow = highlightCurrentRow ?? false;
    this.currentRowKey = currentRowKey;
    this.rowKey = rowKey;
    this.emptyText = emptyText ?? '暂无数据';
    this.defaultExpandAll = defaultExpandAll;
    this.expandRowKeys = expandRowKeys ?? [];
    this.defaultSort = defaultSort ?? '';
    this.tooltipEffect = tooltipEffect ?? '';
    this.showSummary = showSummary ?? false;
    this.sumText = sumText ?? '';
    this.summaryMethod = summaryMethod;
    this.spanMethod = spanMethod;
    this.selectOnIndeterminate = selectOnIndeterminate ?? true;
    this.indent = indent ?? 18;
    this.lazy = lazy ?? false;
    this.load = load;
    this.treeProps =
        treeProps ?? {'hasChildren': 'hasChildren', 'children': 'children'};
  }
}

class WTableSlot extends BaseSlot {
  /**
      append	插入至表格最后一行之后的内容，如果需要对表格的内容进行无限滚动操作，可能需要用到这个 slot。若表格有合计行，该 slot 会位于合计行之上。
   */

  WTableSlot() : super(null);
}

class WTableColumn extends StatelessWidget
    implements BaseWidget<WTableColumnOn, WTableColumnProp, WTableColumnSlot> {
  @override
  late final WTableColumnOn $on;

  @override
  late final WTableColumnProp $props;

  @override
  late final WTableColumnSlot $slots;

  WTableColumn({
    Key? key,
    WTableColumnOn? on,
    required WTableColumnProp props,
    WTableColumnSlot? slots,
  }) : super(key: key) {
    $on = on ?? WTableColumnOn();
    $props = props;
    $slots = slots ?? WTableColumnSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTableColumnOn extends BaseOn {}

class WTableColumnProp extends BaseProp {
  String? type;
  late dynamic index;
  String? columnKey;
  String? label;
  dynamic Function(dynamic row)? prop;
  String? width;
  String? minWidth;
  late dynamic fixed;
  Function(dynamic h, {WTableColumn column, int $index})? renderHeader;
  late dynamic sortable;
  late int Function(dynamic a, dynamic b)? sortMethod;
  late dynamic sortBy;
  List? sortOrders;
  late bool resizable;
  late Function(
    dynamic row,
    WTableColumn column,
    dynamic cellValue,
    int index,
  )? formatter;
  late bool showOverflowTooltip;
  late String align;
  String? headerAlign;
  // late String? className;
  // late String? labelClassName;
  Function(dynamic row, int index)? selectable;
  late bool reserveSelection;
  List<Map>? filters;
  String? filterPlacement;
  late bool filterMultiple;
  Function(dynamic value, dynamic row, WTableColumn column)? filterMethod;
  List? filteredValue;

  WTableColumnProp({
    String? type,
    dynamic index,
    String? columnKey,
    String? label,
    dynamic Function(dynamic row)? prop,
    String? width,
    String? minWidth,
    dynamic fixed,
    Function(dynamic h, {WTableColumn column, int $index})? renderHeader,
    dynamic sortable,
    int Function(dynamic a, dynamic b)? sortMethod,
    dynamic sortBy,
    List? sortOrders,
    bool? resizable,
    Function(dynamic row, WTableColumn column, dynamic cellValue, int index)?
        formatter,
    bool? showOverflowTooltip,
    String? align,
    String? headerAlign,
    // className,
    // labelClassName,
    Function(dynamic row, int index)? selectable,
    bool? reserveSelection,
    List<Map>? filters,
    String? filterPlacement,
    bool? filterMultiple,
    Function(dynamic value, dynamic row, WTableColumn column)? filterMethod,
    List? filteredValue,
  }) {
    this.type = type;
    this.index = index;
    this.columnKey = columnKey;
    this.label = label;
    this.prop = prop;
    this.width = width;
    this.minWidth = minWidth;
    this.fixed = fixed;
    this.renderHeader = renderHeader;
    this.sortable = sortable;
    this.sortMethod = sortMethod;
    this.sortBy = sortBy;
    this.sortOrders = sortOrders = ['ascending', 'descending', null];
    this.resizable = resizable ?? true;
    this.formatter = formatter;
    this.showOverflowTooltip = showOverflowTooltip ?? false;
    this.align = align ?? 'left';
    this.headerAlign = headerAlign;
    // this.className = className;
    // this.labelClassName = labelClassName;
    this.selectable = selectable;
    this.reserveSelection = reserveSelection ?? false;
    this.filters = filters;
    this.filterPlacement = filterPlacement;
    this.filterMultiple = filterMultiple ?? true;
    this.filterMethod = filterMethod;
    this.filteredValue = filteredValue;
  }
}

class WTableColumnSlot extends BaseSlot {
  WTableColumnSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
