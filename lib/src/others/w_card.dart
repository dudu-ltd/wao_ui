import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WCard extends StatelessWidget
    implements BaseWidget<WCardOn, WCardProp, WCardSlot> {
  @override
  late final WCardOn $on;

  @override
  late final WCardProp $props;

  @override
  late final WCardSlot $slots;

  WCard({
    Key? key,
    WCardOn? on,
    WCardProp? props,
    WCardSlot? slots,
  }) : super(key: key) {
    $on = on ?? WCardOn();
    $props = props ?? WCardProp();
    $slots = slots ?? WCardSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCardOn extends BaseOn {}

class WCardProp extends BaseProp {}

class WCardSlot extends BaseSlot {
  WCardSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
