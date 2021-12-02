import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WResult extends StatelessWidget
    implements BaseWidget<WResultOn, WResultProp, WResultSlot> {
  @override
  late final WResultOn $on;

  @override
  late final WResultProp $props;

  @override
  late final WResultSlot $slots;

  WResult({
    Key? key,
    WResultOn? on,
    WResultProp? props,
    WResultSlot? slots,
  }) : super(key: key) {
    $on = on ?? WResultOn();
    $props = props ?? WResultProp();
    $slots = slots ?? WResultSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WResultOn extends BaseOn {}

class WResultProp extends BaseProp {}

class WResultSlot extends BaseSlot {}
