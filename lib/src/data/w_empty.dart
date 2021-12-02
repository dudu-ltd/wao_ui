import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WEmpty extends StatelessWidget
    implements BaseWidget<WEmptyOn, WEmptyProp, WEmptySlot> {
  @override
  late final WEmptyOn $on;

  @override
  late final WEmptyProp $props;

  @override
  late final WEmptySlot $slots;

  WEmpty({
    Key? key,
    WEmptyOn? on,
    WEmptyProp? props,
    WEmptySlot? slots,
  }) : super(key: key) {
    $on = on ?? WEmptyOn();
    $props = props ?? WEmptyProp();
    $slots = slots ?? WEmptySlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WEmptyOn extends BaseOn {}

class WEmptyProp extends BaseProp {}

class WEmptySlot extends BaseSlot {}
