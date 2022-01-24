import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/wao_ui.dart';

class WSwitch extends StatelessWidget
    implements BaseWidget<WSwitchOn, WSwitchProp, WSwitchSlot, WSwitchStyle> {
  @override
  late final WSwitchOn $on;
  @override
  late final WSwitchProp $props;
  @override
  late final WSwitchSlot $slots;
  @override
  late WSwitchStyle $style;

  WSwitch({
    Key? key,
    WSwitchOn? on,
    WSwitchProp? props,
    WSwitchSlot? slots,
    WSwitchStyle? style,
  }) : super(key: key) {
    $on = on ?? WSwitchOn();
    $props = props ?? WSwitchProp();
    $slots = slots ?? WSwitchSlot(null);
    $style = style ?? WSwitchStyle();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.horizontal,
        children: [
          if ($props.inactiveText != null)
            Text(
              $props.inactiveText!,
              style: TextStyle(
                color: !isActive ? CfgGlobal.primaryColor : null,
              ),
            ),
          Switch(
            value: $props.valueNotifier.value == $props.valueArr[1],
            activeColor: $props.activeColor,
            inactiveTrackColor: $props.inactiveColor,
            inactiveThumbColor: Colors.white,
            onChanged: (e) {
              if ($props.disabled) return;
              var index = $props.valueArr.indexOf($props.valueNotifier.value);
              $props.value = $props.valueArr[index == 0 ? 1 : 0];
              setState((() => {}));
            },
          ),
          if ($props.activeText != null)
            Text(
              $props.activeText!,
              style: TextStyle(
                color: isActive ? CfgGlobal.primaryColor : null,
              ),
            ),
        ],
      );
    });
  }

  get isActive {
    return ($props.valueNotifier.value is bool && $props.valueNotifier.value) ||
        $props.valueNotifier.value == $props.activeValue;
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
  late ValueNotifier<dynamic> valueNotifier;
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
    dynamic value,
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
    ValueNotifier? valueNotifier,
  }) {
    this.valueNotifier = valueNotifier ?? ValueNotifier(value ?? false);
    this.value = value;
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
    this.name = name;
    this.validateEvent = validateEvent ?? true;
  }

  set value(v) {
    valueNotifier.value = v;
  }

  get value {
    return valueNotifier.value;
  }

  List get valueArr {
    return [inactiveValue ?? false, activeValue ?? true];
  }
}

class WSwitchSlot extends BaseSlot {
  WSwitchSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
