import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WTable extends StatelessWidget
    implements BaseWidget<WTableOn, WTableProp, WTableSlot> {
  @override
  late final WTableOn $on;

  @override
  late final WTableProp $props;

  @override
  late final WTableSlot $slots;

  WTable({
    Key? key,
    WTableOn? on,
    WTableProp? props,
    WTableSlot? slots,
  }) : super(key: key) {
    $on = on ?? WTableOn();
    $props = props ?? WTableProp();
    $slots = slots ?? WTableSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
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
  /**
      data	显示的数据	array	—	—
      height	Table 的高度，默认为自动高度。如果 height 为 number 类型，单位 px；如果 height 为 string 类型，则这个高度会设置为 Table 的 style.height 的值，Table 的高度会受控于外部样式。	string/number	—	—
      max-height	Table 的最大高度。合法的值为数字或者单位为 px 的高度。	string/number	—	—
      stripe	是否为斑马纹 table	boolean	—	false
      border	是否带有纵向边框	boolean	—	false
      size	Table 的尺寸	string	medium / small / mini	—
      fit	列的宽度是否自撑开	boolean	—	true
      show-header	是否显示表头	boolean	—	true
      highlight-current-row	是否要高亮当前行	boolean	—	false
      current-row-key	当前行的 key，只写属性	String,Number	—	—
      row-class-name	行的 className 的回调方法，也可以使用字符串为所有行设置一个固定的 className。	Function({row, rowIndex})/String	—	—
      row-style	行的 style 的回调方法，也可以使用一个固定的 Object 为所有行设置一样的 Style。	Function({row, rowIndex})/Object	—	—
      cell-class-name	单元格的 className 的回调方法，也可以使用字符串为所有单元格设置一个固定的 className。	Function({row, column, rowIndex, columnIndex})/String	—	—
      cell-style	单元格的 style 的回调方法，也可以使用一个固定的 Object 为所有单元格设置一样的 Style。	Function({row, column, rowIndex, columnIndex})/Object	—	—
      header-row-class-name	表头行的 className 的回调方法，也可以使用字符串为所有表头行设置一个固定的 className。	Function({row, rowIndex})/String	—	—
      header-row-style	表头行的 style 的回调方法，也可以使用一个固定的 Object 为所有表头行设置一样的 Style。	Function({row, rowIndex})/Object	—	—
      header-cell-class-name	表头单元格的 className 的回调方法，也可以使用字符串为所有表头单元格设置一个固定的 className。	Function({row, column, rowIndex, columnIndex})/String	—	—
      header-cell-style	表头单元格的 style 的回调方法，也可以使用一个固定的 Object 为所有表头单元格设置一样的 Style。	Function({row, column, rowIndex, columnIndex})/Object	—	—
      row-key	行数据的 Key，用来优化 Table 的渲染；在使用 reserve-selection 功能与显示树形数据时，该属性是必填的。类型为 String 时，支持多层访问：user.info.id，但不支持 user.info[0].id，此种情况请使用 Function。	Function(row)/String	—	—
      empty-text	空数据时显示的文本内容，也可以通过 slot="empty" 设置	String	—	暂无数据
      default-expand-all	是否默认展开所有行，当 Table 包含展开行存在或者为树形表格时有效	Boolean	—	false
      expand-row-keys	可以通过该属性设置 Table 目前的展开行，需要设置 row-key 属性才能使用，该属性为展开行的 keys 数组。	Array	—	
      default-sort	默认的排序列的 prop 和顺序。它的prop属性指定默认的排序的列，order指定默认排序的顺序	Object	order: ascending, descending	如果只指定了prop, 没有指定order, 则默认顺序是ascending
      tooltip-effect	tooltip effect 属性	String	dark/light	
      show-summary	是否在表尾显示合计行	Boolean	—	false
      sum-text	合计行第一列的文本	String	—	合计
      summary-method	自定义的合计计算方法	Function({ columns, data })	—	—
      span-method	合并行或列的计算方法	Function({ row, column, rowIndex, columnIndex })	—	—
      select-on-indeterminate	在多选表格中，当仅有部分行被选中时，点击表头的多选框时的行为。若为 true，则选中所有行；若为 false，则取消选择所有行	Boolean	—	true
      indent	展示树形数据时，树节点的缩进	Number	—	16
      lazy	是否懒加载子节点数据	Boolean	—	—
      load	加载子节点数据的函数，lazy 为 true 时生效，函数第二个参数包含了节点的层级信息	Function(row, treeNode, resolve)	—	—
      tree-props	渲染嵌套数据的配置选项	Object	—	{ hasChildren: 'hasChildren', children: 'children' }
   */
}

class WTableSlot extends BaseSlot {
  /**
      append	插入至表格最后一行之后的内容，如果需要对表格的内容进行无限滚动操作，可能需要用到这个 slot。若表格有合计行，该 slot 会位于合计行之上。
   */
}
