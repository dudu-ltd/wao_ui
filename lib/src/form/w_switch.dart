import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/core/utils/color_util.dart';

class WSwitch extends StatelessWidget
    implements BaseWidget<WSwitchOn, WSwitchProp, WSwitchSlot> {
  @override
  late final WSwitchOn $on;

  @override
  late final WSwitchProp $props;

  @override
  late final WSwitchSlot $slots;

  WSwitch({
    Key? key,
    WSwitchOn? on,
    WSwitchProp? props,
    WSwitchSlot? slots,
  }) : super(key: key) {
    $on = on ?? WSwitchOn();
    $props = props ?? WSwitchProp();
    $slots = slots ?? WSwitchSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  /**
      focus	使 Switch 获取焦点	-
   */
}

class WSwitchOn extends BaseOn {
  /**
      change	switch 状态发生变化时的回调函数	新状态的值
   */
}

class WSwitchProp extends BaseProp {
  late ValueNotifier<dynamic> value;
  late bool disabled;
  late num width;
  String? activeIconClass;
  String? inactiveIconClass;
  String? activeText;
  String? inactiveText;
  late dynamic activeValue;
  late dynamic inactiveValue;
  late Color activeColor;
  late Color inactiveColor;
  String? name;
  late bool validateEvent;

  WSwitchProp({
    ValueNotifier<dynamic>? value,
    bool? disabled,
    num? width,
    String? activeIconClass,
    String? inactiveIconClass,
    String? activeText,
    String? inactiveText,
    dynamic activeValue,
    dynamic inactiveValue,
    String? activeColor,
    String? inactiveColor,
    String? name,
    bool? validateEvent,
  }) {
    this.value = value ?? ValueNotifier<dynamic>('');
    this.disabled = disabled ?? false;
    this.width = width ?? 40;
    this.activeIconClass = activeIconClass;
    this.inactiveIconClass = inactiveIconClass;
    this.activeText = activeText;
    this.inactiveText = inactiveText;
    this.activeValue = activeValue ?? true;
    this.inactiveValue = inactiveValue ?? false;
    this.activeColor = activeColor != null
        ? ColorUtil.hexToColor(activeColor)
        : ColorUtil.hexToColor('#409EFF');
    this.inactiveColor = inactiveColor != null
        ? ColorUtil.hexToColor(inactiveColor)
        : ColorUtil.hexToColor('#C0CCDA');
    ;
    this.name = name;
    this.validateEvent = validateEvent ?? true;
  }
}

class WSwitchSlot extends BaseSlot {
  WSwitchSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
