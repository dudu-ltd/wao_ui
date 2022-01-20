import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WAlert extends StatelessWidget
    implements BaseWidget<WAlertOn, WAlertProp, WAlertSlot, WAlertStyle> {
  @override
  late final WAlertOn $on;
  @override
  late final WAlertProp $props;
  @override
  late final WAlertSlot $slots;
  @override
  late WAlertStyle $style;

  WAlert({
    Key? key,
    WAlertOn? on,
    WAlertProp? props,
    WAlertSlot? slots,
    WAlertStyle? style,
  }) : super(key: key) {
    $on = on ?? WAlertOn();
    $props = props ?? WAlertProp();
    $slots = slots ?? WAlertSlot(null);
    $style = style ?? WAlertStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WAlertOn extends BaseOn {}

class WAlertProp extends BaseProp {}

class WAlertSlot extends BaseSlot {
  WAlertSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
