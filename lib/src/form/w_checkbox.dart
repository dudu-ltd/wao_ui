import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WCheckbox extends StatelessWidget
    implements BaseWidget<WCheckboxOn, WCheckboxProp, WCheckboxSlot> {
  @override
  late final WCheckboxOn $on;

  @override
  late final WCheckboxProp $props;

  @override
  late final WCheckboxSlot $slots;

  WCheckbox({
    Key? key,
    WCheckboxOn? on,
    WCheckboxProp? props,
    WCheckboxSlot? slots,
  }) : super(key: key) {
    $on = on ?? WCheckboxOn();
    $props = props ?? WCheckboxProp();
    $slots = slots ?? WCheckboxSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCheckboxOn extends BaseOn {
  Function? change;
}

class WCheckboxProp extends BaseProp {
  /**
      value / v-model	绑定值	string / number / boolean	—	—
      label	选中状态的值（只有在checkbox-group或者绑定对象类型为array时有效）	string / number / boolean	—	—
      true-label	选中时的值	string / number	—	—
      false-label	没有选中时的值	string / number	—	—
      disabled	是否禁用	boolean	—	false
      border	是否显示边框	boolean	—	false
      size	Checkbox 的尺寸，仅在 border 为真时有效	string	medium / small / mini	—
      name	原生 name 属性	string	—	—
      checked	当前是否勾选	boolean	—	false
      indeterminate	设置 indeterminate 状态，只负责样式控制	boolean	—	false
   */
}

class WCheckboxSlot extends BaseSlot {
  WCheckboxSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
