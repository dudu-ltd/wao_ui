import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WColorPicker extends StatelessWidget
    implements BaseWidget<WColorPickerOn, WColorPickerProp, WColorPickerSlot> {
  @override
  late final WColorPickerOn $on;

  @override
  late final WColorPickerProp $props;

  @override
  late final WColorPickerSlot $slots;

  WColorPicker({
    Key? key,
    WColorPickerOn? on,
    WColorPickerProp? props,
    WColorPickerSlot? slots,
  }) : super(key: key) {
    $on = on ?? WColorPickerOn();
    $props = props ?? WColorPickerProp();
    $slots = slots ?? WColorPickerSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WColorPickerOn extends BaseOn {
  /**
      change	当绑定值变化时触发	当前值
      active-change	面板中当前显示的颜色发生改变时触发	当前显示的颜色值
   */
  Function? change;
  Function? activeChange;
  WColorPickerOn({this.change, this.activeChange});
}

class WColorPickerProp extends BaseProp {
  /**
      value / v-model	绑定值	string	—	—
      disabled	是否禁用	boolean	—	false
      size	尺寸	string	medium / small / mini	—
      show-alpha	是否支持透明度选择	boolean	—	false
      color-format	写入 v-model 的颜色的格式	string	hsl / hsv / hex / rgb	hex（show-alpha 为 false）/ rgb（show-alpha 为 true）
      popper-class	ColorPicker 下拉框的类名	string	—	—
      predefine	预定义颜色	array	—	—
   */
}

class WColorPickerSlot extends BaseSlot {
  WColorPickerSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
