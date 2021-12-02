import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WSelect extends StatelessWidget
    implements BaseWidget<WSelectOn, WSelectProp, WSelectSlot> {
  @override
  late final WSelectOn $on;

  @override
  late final WSelectProp $props;

  @override
  late final WSelectSlot $slots;

  WSelect({
    Key? key,
    WSelectOn? on,
    WSelectProp? props,
    WSelectSlot? slots,
  }) : super(key: key) {
    $on = on ?? WSelectOn();
    $props = props ?? WSelectProp();
    $slots = slots ?? WSelectSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WSelectOn extends BaseOn {}

class WSelectProp extends BaseProp {}

class WSelectSlot extends BaseSlot {}
