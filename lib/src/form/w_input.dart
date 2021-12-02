import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WInput extends StatelessWidget
    implements BaseWidget<WInputOn, WInputProp, WInputSlot> {
  @override
  late final WInputOn $on;

  @override
  late final WInputProp $props;

  @override
  late final WInputSlot $slots;

  WInput({
    Key? key,
    WInputOn? on,
    WInputProp? props,
    WInputSlot? slots,
  }) : super(key: key) {
    $on = on ?? WInputOn();
    $props = props ?? WInputProp();
    $slots = slots ?? WInputSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WInputOn extends BaseOn {}

class WInputProp extends BaseProp {}

class WInputSlot extends BaseSlot {}
