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

class WStepsProp extends BaseProp {
  late dynamic space;
  late String direction;
  late int active;
  late String processStatus;
  late String finishStatus;
  late bool alignCenter;
  late bool simple;
  WStepsProp({
    this.space,
    this.direction = 'horizontal',
    this.active = 0,
    this.processStatus = 'process',
    this.finishStatus = 'finish',
    this.alignCenter = false,
    this.simple = false,
  });
}

class WStepsSlot extends BaseSlot {
  WStepsSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

///
///
///
///
///
///
///
///

class WStep extends StatelessWidget
    implements BaseWidget<WStepOn, WStepProp, WStepSlot, WStepStyle> {
  @override
  late final WStepOn $on;

  @override
  late final WStepProp $props;

  @override
  late final WStepSlot $slots;

  @override
  late final WStepStyle $style;

  WStep({
    Key? key,
    WStepOn? on,
    WStepProp? props,
    WStepSlot? slots,
    WStepStyle? style,
  }) : super(key: key) {
    $on = on ?? WStepOn();
    $props = props ?? WStepProp();
    $slots = slots ?? WStepSlot(null);
    $style = style ?? WStepStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WStepOn extends BaseOn {}

class WStepProp extends BaseProp {
  String? title;
  String? description;
  IconData? icon;
  String? status;
  WStepProp({
    this.title,
    this.description,
    this.icon,
    this.status,
  });
}

class WStepSlot extends BaseSlot {
  Widget? icon;
  Widget? title;
  Widget? description;

  WStepSlot(
    defaultSlotBefore, {
    this.icon,
    this.title,
    this.description,
  }) : super(defaultSlotBefore);
}
