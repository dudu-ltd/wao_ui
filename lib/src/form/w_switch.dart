import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

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
    $slots = slots ?? WSwitchSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WSwitchOn extends BaseOn {}

class WSwitchProp extends BaseProp {}

class WSwitchSlot extends BaseSlot {}
