import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WAlert extends StatelessWidget
    implements BaseWidget<WAlertOn, WAlertProp, WAlertSlot> {
  @override
  late WAlertOn $on;

  @override
  late WAlertProp $props;

  @override
  late WAlertSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WAlertOn extends BaseOn {}

class WAlertProp extends BaseProp {}

class WAlertSlot extends BaseSlot {}
