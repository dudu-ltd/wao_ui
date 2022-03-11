import 'package:flutter/material.dart';
import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';
import 'package:simple_observable/simple_observable.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:wao_ui/src/data/w_empty.dart';

class WTable extends StatefulWidget
    with BaseMixins<WTableOn, WTableProp, WTableSlot, WTableStyle> {
  WTable({
    Key? key,
    WTableOn? on,
    WTableProp? props,
    WTableSlot? slots,
    WTableStyle? style,
  }) : super(key: key) {
    $on = on ?? WTableOn();
    $props = props ?? WTableProp();
    $slots = slots ?? WTableSlot(null);
    $style = style ?? WTableStyle();
    init();
  }

  late Observable<List> _dataListener;

  final List _selectedRow = [];

  List get data {
    return _dataListener.value;
  }

  set data(v) {
    _dataListener.value = v;
  }

  @override
  _WTableState createState() => _WTableState();

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

  @override
  List<SlotTranslator> get slotTranslatorsCustom {
    return <SlotTranslator>[
      SlotTranslator(
        WTableColumnProp,
        (prop, i, component, len) {
          return WTableColumn(props: prop);
        },
      )
    ];
  }
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

  List<DataColumn> get columns2 {
    return List.generate(
        widget.defaultSlot.length,
        (i) => DataColumn(
            label: getHeader(widget.defaultSlot as List<WTableColumn>)));
  }

  List<DataRow> get rows2 {
    return List.generate(
        widget.$props.data.length,
        (index) => DataRow(
            cells:
                List.generate(rows.length, (index) => DataCell(rows[index]))));
  }

  @override
  Widget build(BuildContext context) {
    return borderWrapper(
      constWrapper(
        Column(
          children: [
            if (widget.$props.showHeader!) getHeader(widget.defaultSlot),
            if (widget.$props.data.isEmpty && whenEmpty != null)
              whenEmpty!
            else if (widget.$props.height != null)
              sizedScrollWrapper(rows, widget.$props.height, null, true)
            else if (widget.$props.maxHeight != null)
              expandedScrollWrapper(rows, true)
            else
              ...rows
          ],
        ),
        BoxConstraints(maxHeight: widget.$props.maxHeight ?? 0),
        widget.$props.maxHeight != null,
      ),
      Border.fromBorderSide(cfgGlobal.table.rowBorder),
      widget.$props.border,
    );
  }

  Widget? get whenEmpty {
    return WEmpty(slots: WEmptySlot(const Text('暂无数据')));
  }

  addActualFields(List<Widget> _columns, List<WTableColumn> actualFields) {
    for (var column in _columns) {
      column as WTableColumn;
      if (column.defaultSlot is List<WTableColumn>) {
        addActualFields(column.defaultSlot as List<WTableColumn>, actualFields);
      } else {
        actualFields.add(column);
      }
    }
  }

  List<WTableColumn> get actualFields {
    List<Widget> columns = widget.defaultSlot;
    var actualFields = <WTableColumn>[];
    addActualFields(columns, actualFields);
    return actualFields;
  }

  List<MouseStateBuilder> get rows {
    var rowLen = widget.$props.data.length;
    List<MouseStateBuilder> rows = List.generate(rowLen, (r) {
      dynamic rowData = widget.$props.data[r];
      return MouseStateBuilder(builder: (context, state) {
        var columnLen = actualFields.length;
        var row = Row(
          children: List.generate(
            columnLen,
            (c) {
              var column = actualFields[c];
              return _cellBorderWrapper(
                cellWidget(column, rowData),
                columnLen,
                c,
              );
            },
          ),
        );
        return _rowWrapper(
          row,
          state,
          rowLen,
          r,
        );
      });
    });
    return rows;
  }

  _rowWrapper(row, MouseState state, rowLen, r) {
    row = _backgroundWrapper(row, state, r);
    row = _divideWrapper(row, rowLen, r);
    return row;
  }

  _cellBorderWrapper(Widget cell, columnLen, c) {
    return borderWrapper(
      cell,
      widget.$props.border
          ? Border(
              right: cfgGlobal.table.rowBorder,
            )
          : null,
      c != columnLen - 1,
      margin: cfgGlobal.table.cellMargin,
    );
  }

  Widget _divideWrapper(Widget row, rowLen, r) {
    return borderWrapper(
      row,
      r == 0
          ? Border(
              bottom: cfgGlobal.table.rowBorder,
              top: cfgGlobal.table.rowBorder,
            )
          : Border(bottom: cfgGlobal.table.rowBorder),
      true,
    );
  }

  Widget _backgroundWrapper(Widget row, MouseState state, r) {
    if (needBackground(state, r)) {
      return ColoredBox(
        color: state.isMouseOver
            ? cfgGlobal.table.rowHoverColor
            : cfgGlobal.table.stripeColor,
        child: row,
      );
    }
    return row;
  }

  bool needBackground(MouseState state, int r) {
    return state.isMouseOver || (widget.$props.stripe && r % 2 == 1);
  }

  Widget cellWidget(WTableColumn column, dynamic row) {
    Widget child = value(column, row);
    return widthWrapper(child, column);
  }

  Widget value(WTableColumn column, dynamic row) {
    var child;
    if (column.$slots.defaultSlotBefore is Function) {
      child = (column.$slots.defaultSlotBefore as Function).call(row);
    } else if (column.$slots.defaultSlotBefore is List<Widget>) {
      child = column.defaultSlot;
    } else {
      var val = column.$props.prop == null ? '' : column.$props.prop?.call(row);
      child = Text(
        '$val',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    }
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

  Widget getHeader(List<Widget> columns) {
    var columnLen = columns.length;
    return Row(
      children: List.generate(
        columnLen,
        (index) {
          WTableColumn column = columns[index] as WTableColumn;
          Widget th = getHeaderCell(column);
          var header = column.$props.width == null
              ? Expanded(
                  child: th,
                )
              : SizedBox(
                  child: th,
                  width: double.parse(column.$props.width!),
                );
          return _cellBorderWrapper(header, columnLen, index);
        },
      ),
    );
  }

  Widget getHeaderCell(WTableColumn column) {
    if (column.$slots.header != null) {
      return column.$slots.header!.call(column);
    } else if (column.defaultSlot.isNotEmpty) {
      return Column(
        children: [
          Text(column.$props.label ?? ''),
          getHeader(column.defaultSlot)
        ],
      );
    }
    return Text(column.$props.label ?? '');
  }
}

class WTableOn extends BaseOn {
  Function? select;
  Function? selectAll;
  Function? selectionChange;
  Function? cellMouseEnter;
  Function? cellMouseLeave;
  Function? cellClick;
  Function? cellDblclick;
  Function? rowClick;
  Function? rowContextmenu;
  Function? rowDblclick;
  Function? headerClick;
  Function? headerContextmenu;
  Function? sortChange;
  Function? filterChange;
  Function? currentChange;
  Function? headerDragend;
  Function? expandChange;
  WTableOn({
    this.select,
    this.selectAll,
    this.selectionChange,
    this.cellMouseEnter,
    this.cellMouseLeave,
    this.cellClick,
    this.cellDblclick,
    this.rowClick,
    this.rowContextmenu,
    this.rowDblclick,
    this.headerClick,
    this.headerContextmenu,
    this.sortChange,
    this.filterChange,
    this.currentChange,
    this.headerDragend,
    this.expandChange,
  });
}

class WTableProp extends BaseProp {
  late List data;
  double? height;
  double? maxHeight;
  late bool stripe;
  late bool border;
  String? size;
  bool? fit;
  bool? showHeader;
  bool? highlightCurrentRow;
  String? currentRowKey;
  Function(dynamic row)? rowKey;
  String? emptyText;
  bool defaultExpandAll = false;
  List? expandRowKeys;
  dynamic defaultSort;
  String? tooltipEffect;
  bool? showSummary;
  String? sumText;
  Function(List columns, List data)? summaryMethod;
  Function(dynamic row, String column, int rowIndex, int columnIndex)?
      spanMethod;
  bool? selectOnIndeterminate;
  double? indent;
  bool? lazy;
  Function(dynamic row, dynamic treeNode, Function resolve)? load;
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
    Function(dynamic row)? rowKey,
    String? emptyText,
    bool defaultExpandAll = false,
    List? expandRowKeys,
    dynamic defaultSort,
    String? tooltipEffect,
    bool? showSummary,
    String? sumText,
    Function(List columns, List data)? summaryMethod,
    Function(dynamic row, String column, int rowIndex, int columnIndex)?
        spanMethod,
    bool? selectOnIndeterminate,
    double? indent,
    bool? lazy,
    Function(dynamic row, dynamic treeNode, Function resolve)? load,
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

  WTableSlot(columns) : super(columns);
  @override
  setDefaultSlot() {
    var columns = defaultSlotBefore;
    if (columns == null && defaultSlot == null) defaultSlot = [];
    if (columns is List<WTableColumn>) {
      defaultSlot = columns;
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
      defaultSlot = _columns;
    }
  }
}

class WTableColumn extends StatelessWidget
    with
        BaseMixins<WTableColumnOn, WTableColumnProp, WTableColumnSlot,
            WTableColumnStyle> {
  @override
  late final WTableColumnOn $on;
  @override
  late final WTableColumnProp $props;
  @override
  late final WTableColumnSlot $slots;
  @override
  late WTableColumnStyle $style;

  WTableColumn({
    Key? key,
    WTableColumnOn? on,
    WTableColumnProp? props,
    WTableColumnSlot? slots,
    WTableColumnStyle? style,
  }) : super(key: key) {
    $on = on ?? WTableColumnOn();
    $props = props ?? WTableColumnProp();
    $slots = slots ?? WTableColumnSlot(null);
    $style = style ?? WTableColumnStyle();
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
  dynamic Function(dynamic row)? columnKey;
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
    dynamic Function(dynamic row)? columnKey,
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
  Widget Function(dynamic column)? header;
  // Function([dynamic value, dynamic row, WTableColumn column])? cellBuilder;
  WTableColumnSlot(defaultSlotBefore, {this.header}) : super(defaultSlotBefore);

  @override
  setDefaultSlot() {
    if (defaultSlot != null && defaultSlot!.isNotEmpty) return;
    var columns = defaultSlotBefore;
    if (columns == null && defaultSlot != null) {
      defaultSlot = [];
    } else if (columns is List<WTableColumn>) {
      defaultSlot = columns;
    } else if (columns is List<dynamic>) {
      var _columns = <WTableColumn>[];
      columns.forEach((column) {
        if (column is WTableColumn) {
          _columns.add(column);
        } else if (column is WTableColumnProp) {
          _columns.add(WTableColumn(props: column));
        } else {
          throw Exception('目前仅支持 List<WTableColumnProp> 与 List<WTableColumn> ');
        }
      });
      defaultSlot = _columns;
    }
  }

  // @override
  // setDefaultSlot() {
  //   super.setDefaultSlot();
  //   if (defaultSlotBefore is Function) {
  //     cellBuilder = defaultSlotBefore;
  //   }
  // }
}
