import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WCollapse extends StatelessWidget
    implements BaseWidget<WCollapseOn, WCollapseProp, WCollapseSlot> {
  @override
  late WCollapseOn $on;

  @override
  late WCollapseProp $props;

  @override
  late WCollapseSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCollapseOn extends BaseOn {}

class WCollapseProp extends BaseProp {}

class WCollapseSlot extends BaseSlot {}
