import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WDialog extends StatelessWidget
    implements BaseWidget<WDialogOn, WDialogProp, WDialogSlot> {
  @override
  late WDialogOn $on;

  @override
  late WDialogProp $props;

  @override
  late WDialogSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WDialogOn extends BaseOn {}

class WDialogProp extends BaseProp {}

class WDialogSlot extends BaseSlot {}
