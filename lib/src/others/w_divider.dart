import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WDivider extends StatelessWidget
    implements BaseWidget<WDividerOn, WDividerProp, WDividerSlot> {
  @override
  late final WDividerOn $on;

  @override
  late final WDividerProp $props;

  @override
  late final WDividerSlot $slots;

  WDivider({
    Key? key,
    WDividerOn? on,
    WDividerProp? props,
    WDividerSlot? slots,
  }) : super(key: key) {
    $on = on ?? WDividerOn();
    $props = props ?? WDividerProp();
    $slots = slots ?? WDividerSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WDividerOn extends BaseOn {}

class WDividerProp extends BaseProp {}

class WDividerSlot extends BaseSlot {
  WDividerSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
