import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WPageHeader extends StatelessWidget
    implements BaseWidget<WPageHeaderOn, WPageHeaderProp, WPageHeaderSlot> {
  @override
  late final WPageHeaderOn $on;

  @override
  late final WPageHeaderProp $props;

  @override
  late final WPageHeaderSlot $slots;

  WPageHeader({
    Key? key,
    WPageHeaderOn? on,
    WPageHeaderProp? props,
    WPageHeaderSlot? slots,
  }) : super(key: key) {
    $on = on ?? WPageHeaderOn();
    $props = props ?? WPageHeaderProp();
    $slots = slots ?? WPageHeaderSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WPageHeaderOn extends BaseOn {}

class WPageHeaderProp extends BaseProp {}

class WPageHeaderSlot extends BaseSlot {
  WPageHeaderSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
