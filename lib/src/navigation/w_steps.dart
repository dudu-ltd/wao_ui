import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WSteps extends StatelessWidget
    implements BaseWidget<WStepsOn, WStepsProp, WStepsSlot> {
  @override
  late WStepsOn $on;

  @override
  late WStepsProp $props;

  @override
  late WStepsSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WStepsOn extends BaseOn {}

class WStepsProp extends BaseProp {}

class WStepsSlot extends BaseSlot {}
