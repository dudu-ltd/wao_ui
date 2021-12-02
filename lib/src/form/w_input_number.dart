import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WInputNumber extends StatelessWidget
    implements BaseWidget<WInputNumberOn, WInputNumberProp, WInputNumberSlot> {
  @override
  late final WInputNumberOn $on;

  @override
  late final WInputNumberProp $props;

  @override
  late final WInputNumberSlot $slots;

  WInputNumber({
    Key? key,
    WInputNumberOn? on,
    WInputNumberProp? props,
    WInputNumberSlot? slots,
  }) : super(key: key) {
    $on = on ?? WInputNumberOn();
    $props = props ?? WInputNumberProp();
    $slots = slots ?? WInputNumberSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WInputNumberOn extends BaseOn {}

class WInputNumberProp extends BaseProp {}

class WInputNumberSlot extends BaseSlot {}
