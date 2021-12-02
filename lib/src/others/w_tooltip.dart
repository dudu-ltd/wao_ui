import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WTooltip extends StatelessWidget
    implements BaseWidget<WTooltipOn, WTooltipProp, WTooltipSlot> {
  @override
  late final WTooltipOn $on;

  @override
  late final WTooltipProp $props;

  @override
  late final WTooltipSlot $slots;

  WTooltip({
    Key? key,
    WTooltipOn? on,
    WTooltipProp? props,
    WTooltipSlot? slots,
  }) : super(key: key) {
    $on = on ?? WTooltipOn();
    $props = props ?? WTooltipProp();
    $slots = slots ?? WTooltipSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTooltipOn extends BaseOn {}

class WTooltipProp extends BaseProp {}

class WTooltipSlot extends BaseSlot {}
