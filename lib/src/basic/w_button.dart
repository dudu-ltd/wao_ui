import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WButton extends StatelessWidget
    implements BaseWidget<WButtonOn, WButtonProp, WButtonSlot> {
  @override
  late WButtonOn $on;

  @override
  late WButtonProp $props;

  @override
  late WButtonSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WButtonOn extends BaseOn {}

enum WButtonSize {
  mini,
  small,
  medium,
  large,
}

enum WButtonType {
  primary,
  success,
  warning,
  darger,
  info,
  text,
}

class WButtonProp extends BaseProp {
  late WButtonSize size;
  late WButtonType type;
  late bool plain;
  late bool round;
  late bool circle;
  late bool loading;
  late bool disabled;
  Icon? icon;
  late bool autofocus;
  ButtonProp({
    size,
    type,
    plain,
    round,
    circle,
    loading,
    disabled,
    icon,
    autofocus,
  }) {
    this.size = size ?? WButtonSize.mini;
    this.type = type ?? WButtonType.text;
    this.plain = plain ?? false;
    this.round = round ?? false;
    this.circle = circle ?? false;
    this.loading = loading ?? false;
    this.disabled = disabled ?? false;
    this.icon = icon;
    this.autofocus = autofocus ?? false;
  }
}

class WButtonSlot extends BaseSlot {}
