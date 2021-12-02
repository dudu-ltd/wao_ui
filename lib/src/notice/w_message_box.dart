import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WMessageBox extends StatelessWidget
    implements BaseWidget<WMessageBoxOn, WMessageBoxProp, WMessageBoxSlot> {
  @override
  late final WMessageBoxOn $on;

  @override
  late final WMessageBoxProp $props;

  @override
  late final WMessageBoxSlot $slots;

  WMessageBox({
    Key? key,
    WMessageBoxOn? on,
    WMessageBoxProp? props,
    WMessageBoxSlot? slots,
  }) : super(key: key) {
    $on = on ?? WMessageBoxOn();
    $props = props ?? WMessageBoxProp();
    $slots = slots ?? WMessageBoxSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WMessageBoxOn extends BaseOn {}

class WMessageBoxProp extends BaseProp {}

class WMessageBoxSlot extends BaseSlot {}
