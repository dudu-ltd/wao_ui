import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

class WSwitch extends StatefulWidget
    implements BaseWidget<WSwitchOn, WSwitchProp, WSwitchSlot, WSwitchStyle> {
  @override
  late final WSwitchOn $on;
  @override
  late final WSwitchProp $props;
  @override
  late final WSwitchSlot $slots;
  @override
  late WSwitchStyle $style;

  bool flutterStyle;

  WSwitch({
    Key? key,
    WSwitchOn? on,
    WSwitchProp? props,
    WSwitchSlot? slots,
    WSwitchStyle? style,
    this.flutterStyle = false,
  }) : super(key: key) {
    $on = on ?? WSwitchOn();
    $props = props ?? WSwitchProp();
    $slots = slots ?? WSwitchSlot(null);
    $style = style ?? WSwitchStyle();
  }
  @override
  _WSwitchState createState() => _WSwitchState();

  /**
      focus	使 Switch 获取焦点	-
   */
}

class _WSwitchState extends State<WSwitch> with SingleTickerProviderStateMixin {
  late AnimationController switchAnimation;
  late Animation<double> animationX;
  late Animation<Color?> animationColor;

  @override
  void initState() {
    super.initState();
    widget.$props.valueNotifier.addListener(() {
      !widget.flutterStyle && isActive
          ? switchAnimation.forward()
          : switchAnimation.reverse();
      if (widget.flutterStyle) setState(() {});
    });

    switchAnimation = AnimationController(
        duration: Duration(milliseconds: switchTime), vsync: this);
    animationColor = ColorTween(begin: inactiveColor, end: activeColor)
        .animate(switchAnimation);
    animationX = Tween(begin: 0.0, end: 1.0).animate(switchAnimation)
      ..addListener(() {
        setState(() {});
      });
    Timer(const Duration(milliseconds: 300), () {
      if (!widget.flutterStyle && isActive) switchAnimation.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    var _activeContent = activeContent;
    var _inactiveContent = inactiveContent;
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: widget.flutterStyle ? 0 : 10,
      direction: Axis.horizontal,
      children: [
        ..._inactiveContent,
        switchBtn,
        ..._activeContent,
      ],
    );
  }

  Widget get switchBtn {
    return widget.flutterStyle ? flutterSwitch : waoSwitch;
  }

  Widget get waoSwitch {
    return InkWell(
      onTap: () => changeAction(null),
      child: Stack(
        children: [
          background,
          circle,
        ],
      ),
    );
  }

  Widget get background {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: btnInnerBorder,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(cfgGlobal.borderRadius.circle),
        ),
        color: color,
      ),
      child: SizedBox(
        width: btnWidth,
        height: btnInnerHeight,
      ),
    );
  }

  Widget get circle {
    return Positioned(
      left: btnInnerRight,
      child: Container(
        height: btnHeight,
        width: btnHeight,
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: btnInnerBorder,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(cfgGlobal.borderRadius.circle),
          ),
        ),
        child: const ClipOval(
          child: ColoredBox(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget get flutterSwitch {
    return Switch(
      value: widget.$props.valueNotifier.value == widget.$props.valueArr[1],
      activeColor: activeColor,
      inactiveTrackColor: inactiveColor,
      inactiveThumbColor: Colors.white,
      onChanged: changeAction,
    );
  }

  void changeAction(e) {
    if (widget.$props.disabled) return;
    var index =
        widget.$props.valueArr.indexOf(widget.$props.valueNotifier.value);
    widget.$props.value = widget.$props.valueArr[(index + 1) % 2];
  }

  Color disableColor(Color color) {
    return Color.fromARGB(
        255, grey(color.red), grey(color.green), grey(color.blue));
  }

  int grey(int origin) {
    var minus = 255 - origin;
    return origin + minus ~/ 2.5;
  }

  Color get color {
    return animationColor.value != null
        ? animationColor.value!
        : isActive
            ? activeColor
            : inactiveColor;
  }

  Color get activeColor {
    if (widget.$props.disabled) {
      return disableColor(widget.$props.activeColor);
    }
    return widget.$props.activeColor;
  }

  Color get inactiveColor {
    if (widget.$props.disabled) {
      return disableColor(widget.$props.inactiveColor);
    }
    return widget.$props.inactiveColor;
  }

  List<Widget> iconOrText(icon, text, useActive) {
    var color = useActive ? CfgGlobal.primaryColor : null;
    if (icon != null) {
      return [Icon(icon, color: color)];
    }
    if (text != null) {
      return [Text(text, style: TextStyle(color: color))];
    }
    return [];
  }

  List<Widget> get activeContent {
    return iconOrText(
        widget.$props.activeIconClass, widget.$props.activeText, isActive);
  }

  List<Widget> get inactiveContent {
    return iconOrText(
        widget.$props.inactiveIconClass, widget.$props.inactiveText, !isActive);
  }

  get isActive {
    return (widget.$props.valueNotifier.value is bool &&
            widget.$props.valueNotifier.value) ||
        widget.$props.valueNotifier.value == widget.$props.activeValue;
  }

  double get btnWidth {
    return widget.$props.width.toDouble();
  }

  double get btnHeight {
    return widget.$style.btnHeight ?? cfgGlobal.wSwitch.btnHeight ?? 18.0;
  }

  double get btnInnerBorder {
    return widget.$style.btnInnerBorder ??
        cfgGlobal.wSwitch.btnInnerBorder ??
        2.0;
  }

  double get btnInnerHeight {
    return btnHeight - 2 * btnInnerBorder;
  }

  double get btnInnerRight {
    return (btnWidth - btnInnerHeight) * animationX.value;
  }

  int get switchTime {
    return widget.$style.switchTime ?? cfgGlobal.wSwitch.switchTime ?? 200;
  }
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
  IconData? activeIconClass;
  IconData? inactiveIconClass;
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
    IconData? activeIconClass,
    IconData? inactiveIconClass,
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
        : CfgGlobal.primaryColor;
    this.inactiveColor = inactiveColor != null
        ? ColorUtil.hexToColor(inactiveColor)
        : CfgGlobal.disabledColor.shade300;
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
