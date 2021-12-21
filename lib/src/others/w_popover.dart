import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WPopover extends StatelessWidget
    implements BaseWidget<WPopoverOn, WPopoverProp, WPopoverSlot> {
  @override
  late final WPopoverOn $on;

  @override
  late final WPopoverProp $props;

  @override
  late final WPopoverSlot $slots;

  WPopover({
    Key? key,
    WPopoverOn? on,
    WPopoverProp? props,
    WPopoverSlot? slots,
  }) : super(key: key) {
    $on = on ?? WPopoverOn();
    $props = props ?? WPopoverProp();
    $slots = slots ?? WPopoverSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WPopoverOn extends BaseOn {}

class WPopoverProp extends BaseProp {}

class WPopoverSlot extends BaseSlot {
  WPopoverSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
