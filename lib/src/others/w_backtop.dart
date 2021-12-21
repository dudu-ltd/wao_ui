import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WBacktop extends StatelessWidget
    implements BaseWidget<WBacktopOn, WBacktopProp, WBacktopSlot> {
  @override
  late final WBacktopOn $on;

  @override
  late final WBacktopProp $props;

  @override
  late final WBacktopSlot $slots;

  WBacktop({
    Key? key,
    WBacktopOn? on,
    WBacktopProp? props,
    WBacktopSlot? slots,
  }) : super(key: key) {
    $on = on ?? WBacktopOn();
    $props = props ?? WBacktopProp();
    $slots = slots ?? WBacktopSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WBacktopOn extends BaseOn {}

class WBacktopProp extends BaseProp {}

class WBacktopSlot extends BaseSlot {
  WBacktopSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
