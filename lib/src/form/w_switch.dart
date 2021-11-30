import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WSwitch extends StatelessWidget
    implements BaseWidget<WSwitchOn, WSwitchProp, WSwitchSlot> {
  @override
  late WSwitchOn $on;

  @override
  late WSwitchProp $props;

  @override
  late WSwitchSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WSwitchOn extends BaseOn {}

class WSwitchProp extends BaseProp {}

class WSwitchSlot extends BaseSlot {}
