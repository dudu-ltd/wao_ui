// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';
import 'package:simple_observable/simple_observable.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

import '../../core/utils/layout_util.dart';

class WTable
    extends WStatefulWidget<WTableOn, WTableProp, WTableSlot, WTableStyle> {
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

  ///
  /// clearSelection	用于多选表格，清空用户的选择	—
  /// toggleRowSelection	用于多选表格，切换某一行的选中状态，如果使用了第二个参数，则是设置这一行选中与否（selected 为 true 则选中）	row, selected
  /// toggleAllSelection	用于多选表格，切换所有行的选中状态	-
  /// toggleRowExpansion	用于可展开表格与树形表格，切换某一行的展开状态，如果使用了第二个参数，则是设置这一行展开与否（expanded 为 true 则展开）	row, expanded
  /// setCurrentRow	用于单选表格，设定某一行为选中行，如果调用时不加参数，则会取消目前高亮行的选中状态。	row
  /// clearSort	用于清空排序条件，数据会恢复成未排序的状态	—
  /// clearFilter	不传入参数时用于清空所有过滤条件，数据会恢复成未过滤的状态，也可传入由columnKey组成的数组以清除指定列的过滤条件	columnKey
  /// doLayout	对 Table 进行重新布局。当 Table 或其祖先元素由隐藏切换为显示时，可能需要调用此方法	—
  /// sort	手动对 Table 进行排序。参数prop属性指定排序列，order指定排序顺序。
  ///

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

class _WTableState extends WState<WTable> {
  List<dynamic>? dataViewPort;

  ScrollController bodyVerticalScrollCtrl = ScrollController();
  ScrollController bodyHorizontalScrollCtrl = ScrollController();

  List<ScrollController> rowsHorizontalScrollCtrls = <ScrollController>[];
  double? maxWidth;

  int _columns = 0;

  @override
  void initState() {
    super.initState();
    widget._dataListener = Observable<List>(
      initialValue: widget.$props.data,
      onChanged: (d) => setState(() {
        widget.$props.data = d;
      }),
    );

    bodyHorizontalScrollCtrl.addListener(() {
      if (bodyHorizontalScrollCtrl.hasClients) {
        var mainOffset = bodyHorizontalScrollCtrl.offset;
        rowsHorizontalScrollCtrls.forEach((sc) {
          if (sc.hasClients) {
            sc.jumpTo(mainOffset);
          }
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (rowsHorizontalScrollCtrls.length > 1) {
        setState(() {
          var tableWidth = getPosition(context).width;
          var mw = rowsHorizontalScrollCtrls[1].position.maxScrollExtent;
          maxWidth = mw + tableWidth * (tableWidth / mw) * 8;
        });
      }
    });
  }

  void setDataViewPort(dynamic current) {
    if (widget.$props.enablePagination) {
      WPaginationProp pagination = WPaginationProp()
        ..pageSize = 30
        ..layout = 'prev, pager, next';
      var wppp = widget.$props.paginationProp =
          widget.$props.paginationProp ?? pagination;
      widget.$props.paginationProp!.total = widget.$props.data.length;
      var pageSize = wppp.pageSize;
      var currentPage = wppp.currentPage;
      var startRow = (currentPage - 1) * pageSize;
      var endRow = (currentPage) * pageSize;
      dataViewPort = widget.$props.data
          .sublist(startRow, min(endRow, widget.$props.data.length));
      setState(updateView);
    }
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
  Widget wbuild(BuildContext context) {
    setDataViewPort(null);
    _columns = 0;
    return Column(
      children: [
        borderWrapper(
          constWrapper(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.$props.showHeader)
                  _rowHorizontalScrollWrapper(getHeader(widget.defaultSlot)),
                if (widget.$props.data.isEmpty && whenEmpty != null)
                  whenEmpty!
                else if (widget.$props.height != null)
                  sizedScrollWrapper(
                    rows,
                    widget.$props.height,
                    null,
                    true,
                    bodyVerticalScrollCtrl,
                  )
                else if (widget.$props.maxHeight != null)
                  expandedScrollWrapper(rows, true)
                else
                  ...rows
              ],
            ),
            BoxConstraints(maxHeight: (widget.$props.maxHeight ?? 0)),
            widget.$props.maxHeight != null,
          ),
          Border.fromBorderSide(cfgGlobal.table.rowBorder),
          widget.$props.border,
        ),
        if (maxWidth != null &&
            widget.$props.data.isNotEmpty &&
            widget.$props.scrollable)
          Scrollbar(
            controller: bodyHorizontalScrollCtrl,
            trackVisibility: true,
            thumbVisibility: true,
            thickness: 10,
            child: SingleChildScrollView(
              controller: bodyHorizontalScrollCtrl,
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 10.0,
                width: maxWidth,
              ),
            ),
          ),
        if (widget.$props.enablePagination)
          WPagination(
            props: widget.$props.paginationProp!,
          )
            ..$on.currentChange = setDataViewPort
            ..$style.textAlign = Alignment.centerRight,
      ],
    );
  }

  Widget? get whenEmpty {
    return WEmpty(slots: WEmptySlot(const Text('暂无数据')));
  }

  addActualFields(List<Widget> columns, List<WTableColumn> actualFields) {
    for (var column in columns) {
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
    var data =
        (dataViewPort?.length ?? 0) > 0 ? dataViewPort : widget.$props.data;
    var rowLen = data!.length;
    List<MouseStateBuilder> rows = List.generate(rowLen, (r) {
      dynamic rowData = data[r];
      return MouseStateBuilder(builder: (context, state) {
        var columnLen = actualFields.length;
        var row = Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            columnLen,
            (c) {
              var column = actualFields[c];
              var needBorder = c != columnLen - 1;
              return _cellBorderWrapper(
                cellWidget(column, rowData, r),
                needBorder,
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

  Widget _rowHorizontalScrollWrapper(Widget child) {
    if (!widget.$props.scrollable) return child;
    ScrollController scrollCtrl = ScrollController();
    rowsHorizontalScrollCtrls.add(scrollCtrl);
    return Scrollbar(
      controller: scrollCtrl,
      trackVisibility: false,
      thickness: 0,
      child: SingleChildScrollView(
        controller: scrollCtrl,
        scrollDirection: Axis.horizontal,
        child: child,
      ),
    );
  }

  _rowWrapper(row, MouseState state, rowLen, r) {
    row = _backgroundWrapper(row, state, r);
    row = _divideWrapper(row, rowLen, r);
    return _rowHorizontalScrollWrapper(row);
  }

  _cellBorderWrapper(Widget cell, [bool need = true]) {
    return borderWrapper(
      cell,
      widget.$props.border
          ? Border(
              right: cfgGlobal.table.rowBorder,
            )
          : null,
      false,
      padding: cfgGlobal.table.cellMargin,
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

  Widget cellWidget(WTableColumn column, dynamic row, int r) {
    Widget child = value(column, row, r);
    return widthWrapper(child, column);
  }

  Widget value(WTableColumn column, dynamic row, int r) {
    dynamic child;
    var val = column.$props.prop == null
        ? getValueFrom(column, row, r)
        : column.$props.prop?.call(row);
    if (column.$props.formatter is Function) {
      child = column.$props.formatter!.call(row, column, val, r);
    } else {
      child = val is Widget
          ? val
          : Tooltip(
              message: '$val',
              triggerMode: TooltipTriggerMode.manual,
              onTriggered: () {},
              waitDuration: const Duration(milliseconds: 300),
              showDuration: const Duration(milliseconds: 300),
              child: SelectableText(
                '$val',
                maxLines: 1,
                textWidthBasis: TextWidthBasis.parent,
                style: TextStyle(overflow: TextOverflow.fade),
              ),
            );
    }
    if (child is List<Widget>) {
      return Row(mainAxisSize: MainAxisSize.min, children: child);
    } else {
      if (child is Widget) {
        return child;
      }
    }
    throw ArgumentError.value(child, 'slots ', ' 默认插槽需要是部件或者是函数返回部件。');
  }

  Widget getValueFrom(WTableColumn column, row, int r) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(column.defaultSlot.length, (index) {
        var innerColumn = column.defaultSlot[index] as WTableColumn;
        return cellWidget(innerColumn, row, r);
      }),
    );
  }

  Widget widthWrapper(Widget cell, WTableColumn column) {
    return column.$props.width == null
        ? Expanded(child: cell)
        : SizedBox(
            width: double.parse(column.$props.width!),
            child: cell,
          );
  }

  Widget getHeader(List<Widget> columns) {
    var columnLen = columns.length;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        columnLen,
        (index) {
          WTableColumn column = columns[index] as WTableColumn;
          Widget th = colorWrapper(
            _cellBorderWrapper(
              getHeaderCell(column),
              index != columnLen - 1,
            ),
            column.$style.backgroundColor,
          );
          var header = column.$props.width == null
              ? Expanded(
                  child: th,
                )
              : SizedBox(
                  width: double.parse(column.$props.width!),
                  child: th,
                );
          return header;
        },
      ),
    );
  }

  Widget getHeaderCell(WTableColumn column) {
    if (column.$slots.header != null) {
      return column.$slots.header!.call(column);
    } else if (column.defaultSlot.isNotEmpty) {
      if (column.defaultSlot.isEmpty) {
        _columns++;
      }
      return Column(
        children: [
          Text(
            column.$props.label ?? '',
            textAlign: TextAlign.left,
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          colorWrapper(
            getHeader(column.defaultSlot),
            column.$style.backgroundColor,
          )
        ],
      );
    }
    return Text(
      column.$props.label ?? '',
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
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
  bool fit;
  bool showHeader;
  bool highlightCurrentRow;
  String? currentRowKey;
  Function(dynamic row)? rowKey;
  String? emptyText;
  bool defaultExpandAll = false;
  List? expandRowKeys;
  dynamic defaultSort;
  String? tooltipEffect;
  bool showSummary;
  String? sumText;
  Function(List columns, List data)? summaryMethod;
  Function(dynamic row, String column, int rowIndex, int columnIndex)?
      spanMethod;
  bool selectOnIndeterminate;
  double? indent;
  bool lazy;
  Function(dynamic row, dynamic treeNode, Function resolve)? load;
  Map<String, dynamic>? treeProps;
  bool enablePagination;
  WPaginationProp? paginationProp;

  /// requirement: All the columns have width.
  bool scrollable = false;

  WTableProp({
    this.data = const [],
    this.height,
    this.maxHeight,
    this.stripe = false,
    this.border = false,
    this.size,
    this.fit = true,
    this.showHeader = true,
    this.highlightCurrentRow = false,
    this.currentRowKey,
    this.rowKey,
    this.emptyText = '暂无数据',
    this.defaultExpandAll = false,
    this.expandRowKeys = const [],
    this.defaultSort = '',
    this.tooltipEffect = '',
    this.showSummary = false,
    this.sumText = '',
    this.summaryMethod,
    this.spanMethod,
    this.selectOnIndeterminate = true,
    this.indent = 18,
    this.lazy = false,
    this.load,
    this.treeProps = const {
      'hasChildren': 'hasChildren',
      'children': 'children'
    },
    this.enablePagination = false,
  });
}

class WTableSlot extends BaseSlot {
  WTableSlot(super.$);
}

class WTableColumn extends WStatelessWidget<WTableColumnOn, WTableColumnProp,
    WTableColumnSlot, WTableColumnStyle> {
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
  Widget wbuild(BuildContext context) {
    return Container();
  }

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
  late String? className;
  late String? labelClassName;
  Function(dynamic row, int index)? selectable;
  late bool reserveSelection;
  List<Map>? filters;
  String? filterPlacement;
  late bool filterMultiple;
  Function(dynamic value, dynamic row, WTableColumn column)? filterMethod;
  List? filteredValue;

  WTableColumnProp({
    this.type,
    this.index,
    this.columnKey,
    this.label,
    this.prop,
    this.width,
    this.minWidth,
    this.fixed,
    this.renderHeader,
    this.sortable,
    this.sortMethod,
    this.sortBy,
    this.sortOrders = const ['ascending', 'descending', null],
    this.resizable = true,
    this.formatter,
    this.showOverflowTooltip = false,
    this.align = 'left',
    this.headerAlign,
    this.className,
    this.labelClassName,
    this.selectable,
    this.reserveSelection = false,
    this.filters,
    this.filterPlacement,
    this.filterMultiple = true,
    this.filterMethod,
    this.filteredValue,
  });
}

class WTableColumnSlot extends BaseSlot {
  Widget Function(dynamic column)? header;
  WTableColumnSlot(super.$, {this.header});
}
