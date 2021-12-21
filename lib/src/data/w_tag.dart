import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WTag extends StatelessWidget
    implements BaseWidget<WTagOn, WTagProp, WTagSlot> {
  @override
  late final WTagOn $on;

  @override
  late final WTagProp $props;

  @override
  late final WTagSlot $slots;

  WTag({
    Key? key,
    WTagOn? on,
    WTagProp? props,
    WTagSlot? slots,
  }) : super(key: key) {
    $on = on ?? WTagOn();
    $props = props ?? WTagProp();
    $slots = slots ?? WTagSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTagOn extends BaseOn {}

class WTagProp extends BaseProp {}

class WTagSlot extends BaseSlot {
  WTagSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
