import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WTooltip extends StatelessWidget
    implements
        BaseWidget<WTooltipOn, WTooltipProp, WTooltipSlot, WTooltipStyle> {
  @override
  late final WTooltipOn $on;
  @override
  late final WTooltipProp $props;
  @override
  late final WTooltipSlot $slots;
  @override
  late WTooltipStyle $style;

  WTooltip({
    Key? key,
    WTooltipOn? on,
    WTooltipProp? props,
    WTooltipSlot? slots,
    WTooltipStyle? style,
  }) : super(key: key) {
    $on = on ?? WTooltipOn();
    $props = props ?? WTooltipProp();
    $slots = slots ?? WTooltipSlot(null);
    $style = style ?? WTooltipStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTooltipOn extends BaseOn {}

class WTooltipProp extends BaseProp {}

class WTooltipSlot extends BaseSlot {
  WTooltipSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
