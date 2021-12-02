import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WCollapse extends StatelessWidget
    implements BaseWidget<WCollapseOn, WCollapseProp, WCollapseSlot> {
  @override
  late final WCollapseOn $on;

  @override
  late final WCollapseProp $props;

  @override
  late final WCollapseSlot $slots;

  WCollapse({
    Key? key,
    WCollapseOn? on,
    WCollapseProp? props,
    WCollapseSlot? slots,
  }) : super(key: key) {
    $on = on ?? WCollapseOn();
    $props = props ?? WCollapseProp();
    $slots = slots ?? WCollapseSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCollapseOn extends BaseOn {}

class WCollapseProp extends BaseProp {}

class WCollapseSlot extends BaseSlot {}
