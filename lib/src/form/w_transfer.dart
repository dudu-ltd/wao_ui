import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WTransfer extends StatelessWidget
    implements BaseWidget<WTransferOn, WTransferProp, WTransferSlot> {
  @override
  late WTransferOn $on;

  @override
  late WTransferProp $props;

  @override
  late WTransferSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTransferOn extends BaseOn {}

class WTransferProp extends BaseProp {}

class WTransferSlot extends BaseSlot {}
