import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WTransfer extends StatelessWidget
    implements BaseWidget<WTransferOn, WTransferProp, WTransferSlot> {
  @override
  late final WTransferOn $on;

  @override
  late final WTransferProp $props;

  @override
  late final WTransferSlot $slots;

  WTransfer({
    Key? key,
    WTransferOn? on,
    WTransferProp? props,
    WTransferSlot? slots,
  }) : super(key: key) {
    $on = on ?? WTransferOn();
    $props = props ?? WTransferProp();
    $slots = slots ?? WTransferSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTransferOn extends BaseOn {
  /**
      change	右侧列表元素变化时触发	当前值、数据移动的方向（'left' / 'right'）、发生移动的数据 key 数组
      left-check-change	左侧列表元素被用户选中 / 取消选中时触发	当前被选中的元素的 key 数组、选中状态发生变化的元素的 key 数组
      right-check-change	右侧列表元素被用户选中 / 取消选中时触发	当前被选中的元素的 key 数组、选中状态发生变化的元素的 key 数组
   */
  Function? change;
  Function? leftCheckChange;
  Function? rightCheckChange;
  WTransferOn({this.change, this.leftCheckChange, this.rightCheckChange});
}

class WTransferProp extends BaseProp {
  /**
      value / v-model	绑定值	array	—	—
      data	Transfer 的数据源	array[{ key, label, disabled }]	—	[ ]
      filterable	是否可搜索	boolean	—	false
      filter-placeholder	搜索框占位符	string	—	请输入搜索内容
      filter-method	自定义搜索方法	function	—	—
      target-order	右侧列表元素的排序策略：若为 original，则保持与数据源相同的顺序；若为 push，则新加入的元素排在最后；若为 unshift，则新加入的元素排在最前	string	original / push / unshift	original
      titles	自定义列表标题	array	—	['列表 1', '列表 2']
      button-texts	自定义按钮文案	array	—	[ ]
      render-content	自定义数据项渲染函数	function(h, option)	—	—
      format	列表顶部勾选状态文案	object{noChecked, hasChecked}	—	{ noChecked: '${checked}/${total}', hasChecked: '${checked}/${total}' }
      props	数据源的字段别名	object{key, label, disabled}	—	—
      left-default-checked	初始状态下左侧列表的已勾选项的 key 数组	array	—	[ ]
      right-default-checked	初始状态下右侧列表的已勾选项的 key 数组	array	—	[ ]
   */
}

class WTransferSlot extends BaseSlot {
  Widget? leftFooter;
  Widget? rightFooter;
  WTransferSlot(defaultSlotBefore, {this.leftFooter, this.rightFooter})
      : super(defaultSlotBefore);
}
