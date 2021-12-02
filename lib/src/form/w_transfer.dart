import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WTransfer extends StatelessWidget
    implements BaseWidget<WTransferOn, WTransferProp, WTransferSlot> {
  @override
  late final WTransferOn $on;

  @override
  late final WTransferProp $props;

  @override
  late final WTransferSlot $slots;

  WTransfer({
    Key? key,
    WTransferOn? on,
    WTransferProp? props,
    WTransferSlot? slots,
  }) : super(key: key) {
    $on = on ?? WTransferOn();
    $props = props ?? WTransferProp();
    $slots = slots ?? WTransferSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTransferOn extends BaseOn {}

class WTransferProp extends BaseProp {}

class WTransferSlot extends BaseSlot {}
