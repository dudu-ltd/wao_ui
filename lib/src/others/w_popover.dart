import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WPopover extends StatelessWidget
    implements BaseWidget<WPopoverOn, WPopoverProp, WPopoverSlot> {
  @override
  late WPopoverOn $on;

  @override
  late WPopoverProp $props;

  @override
  late WPopoverSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WPopoverOn extends BaseOn {}

class WPopoverProp extends BaseProp {}

class WPopoverSlot extends BaseSlot {}
