import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WSteps extends StatelessWidget
    implements BaseWidget<WStepsOn, WStepsProp, WStepsSlot, WStepsStyle> {
  @override
  late final WStepsOn $on;
  @override
  late final WStepsProp $props;
  @override
  late final WStepsSlot $slots;
  @override
  late WStepsStyle $style;

  WSteps({
    Key? key,
    WStepsOn? on,
    WStepsProp? props,
    WStepsSlot? slots,
    WStepsStyle? style,
  }) : super(key: key) {
    $on = on ?? WStepsOn();
    $props = props ?? WStepsProp();
    $slots = slots ?? WStepsSlot(null);
    $style = style ?? WStepsStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WStepsOn extends BaseOn {}

class WStepsProp extends BaseProp {}

class WStepsSlot extends BaseSlot {
  WStepsSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
