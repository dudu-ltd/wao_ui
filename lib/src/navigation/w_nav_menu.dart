import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WNavMenu extends StatelessWidget
    implements BaseWidget<WNavMenuOn, WNavMenuProp, WNavMenuSlot> {
  @override
  late final WNavMenuOn $on;

  @override
  late final WNavMenuProp $props;

  @override
  late final WNavMenuSlot $slots;

  WNavMenu({
    Key? key,
    WNavMenuOn? on,
    WNavMenuProp? props,
    WNavMenuSlot? slots,
  }) : super(key: key) {
    $on = on ?? WNavMenuOn();
    $props = props ?? WNavMenuProp();
    $slots = slots ?? WNavMenuSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WNavMenuOn extends BaseOn {}

class WNavMenuProp extends BaseProp {}

class WNavMenuSlot extends BaseSlot {
  WNavMenuSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
