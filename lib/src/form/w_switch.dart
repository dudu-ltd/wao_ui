// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

// TODO 补充组件焦点切换事件的调用
class WSwitch
    extends WStatefulWidget<WSwitchOn, WSwitchProp, WSwitchSlot, WSwitchStyle> {
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
    init();
  }
  @override
  _WSwitchState createState() => _WSwitchState();

  /**
      focus	使 Switch 获取焦点	-
   */
}

class _WSwitchState extends WState<WSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController switchAnimation;
  late Animation<double> animationX;
  late Animation<Color?> animationColor;

  @override
  void dispose() {
    switchAnimation.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.$props.$addModelListener(() {
      !widget.flutterStyle && isActive
          ? switchAnimation.forward()
          : switchAnimation.reverse();
      if (widget.flutterStyle) setState(() {});
      widget.$on.change?.call(widget.$props.model);
    });

    switchAnimation = AnimationController(
        duration: Duration(milliseconds: switchTime), vsync: this);
    animationColor = ColorTween(begin: inactiveColor, end: activeColor)
        .animate(switchAnimation);
    animationX = Tween(begin: 0.0, end: 1.0).animate(switchAnimation)
      ..addListener(() {
        setState(() {});
      });
    Timer(CfgGlobal.duration, () {
      if (!widget.flutterStyle && isActive) switchAnimation.forward();
    });
  }

  @override
  Widget wbuild(BuildContext context) {
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
    return MouseRegion(
      cursor: widget.$props.disabled
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => changeAction(null),
        child: Stack(
          children: [
            background,
            circle,
          ],
        ),
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
        borderRadius: widget.style.borderRadius,
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
          borderRadius: widget.style.borderRadius,
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
      value: widget.$props.model == widget.$props.valueArr[1],
      activeColor: activeColor,
      inactiveTrackColor: inactiveColor,
      inactiveThumbColor: Colors.white,
      onChanged: changeAction,
    );
  }

  void changeAction(e) {
    if (widget.$props.disabled) return;
    var index = widget.$props.valueArr.indexOf(widget.$props.model);
    widget.$props.model = widget.$props.valueArr[(index + 1) % 2];
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

  List<Widget> iconOrText(icon, text, useActive, valueForSet) {
    var color = useActive ? CfgGlobal.primaryColor : null;
    if (icon != null) {
      return [select(Icon(icon, color: color), valueForSet)];
    }
    if (text != null) {
      return [select(Text(text, style: TextStyle(color: color)), valueForSet)];
    }
    return [];
  }

  Widget select(Widget child, dynamic value) {
    return InkWell(
      child: child,
      onTap: () {
        widget.$props.model = value;
      },
    );
  }

  List<Widget> get activeContent {
    return iconOrText(
      widget.$props.activeIconClass,
      widget.$props.activeText,
      isActive,
      widget.$props.valueArr[1],
    );
  }

  List<Widget> get inactiveContent {
    return iconOrText(
      widget.$props.inactiveIconClass,
      widget.$props.inactiveText,
      !isActive,
      widget.$props.valueArr[0],
    );
  }

  get isActive {
    return (widget.$props.model is bool && widget.$props.model) ||
        widget.$props.model == widget.$props.activeValue;
  }

  double get btnWidth {
    return widget.$props.width.toDouble();
  }

  double get btnHeight {
    return widget.$style.btnHeight ?? cfgGlobal.wSwitch.btnHeight ?? 20.0;
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
  /// change switch 状态发生变化时的回调函数
  ///
  /// params 新状态的值
  Function(dynamic)? change;
  WSwitchOn({this.change});
}

class WSwitchProp extends FormFieldProp {
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
    dynamic model,
    bool? disabled,
    num? width,
    this.activeIconClass,
    this.inactiveIconClass,
    this.activeText,
    this.inactiveText,
    dynamic activeValue,
    dynamic inactiveValue,
    String? activeColor,
    String? inactiveColor,
    this.name,
    bool? validateEvent,
    ValueNotifier? $model,
  }) {
    this.$model = $model ?? ValueNotifier(this.model ?? false);
    this.model = model ?? this.model;
    this.disabled = disabled ?? false;
    this.width = width ?? 40;
    this.activeValue = activeValue ?? true;
    this.inactiveValue = inactiveValue ?? false;
    this.activeColor = activeColor != null
        ? ColorUtil.hexToColor(activeColor)
        : CfgGlobal.primaryColor;
    this.inactiveColor = inactiveColor != null
        ? ColorUtil.hexToColor(inactiveColor)
        : CfgGlobal.disabledColor.shade300;
    this.validateEvent = validateEvent ?? true;
  }

  List get valueArr {
    return [inactiveValue ?? false, activeValue ?? true];
  }
}

class WSwitchSlot extends BaseSlot {
  WSwitchSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
