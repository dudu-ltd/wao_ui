import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WMessage extends StatelessWidget
    implements BaseWidget<WMessageOn, WMessageProp, WMessageSlot> {
  @override
  late final WMessageOn $on;

  @override
  late final WMessageProp $props;

  @override
  late final WMessageSlot $slots;

  WMessage({
    Key? key,
    WMessageOn? on,
    WMessageProp? props,
    WMessageSlot? slots,
  }) : super(key: key) {
    $on = on ?? WMessageOn();
    $props = props ?? WMessageProp();
    $slots = slots ?? WMessageSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WMessageOn extends BaseOn {}

class WMessageProp extends BaseProp {}

class WMessageSlot extends BaseSlot {
  WMessageSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
