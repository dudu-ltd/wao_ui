import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WCollapse extends StatelessWidget
    implements
        BaseWidget<WCollapseOn, WCollapseProp, WCollapseSlot, WCollapseStyle> {
  @override
  late final WCollapseOn $on;
  @override
  late final WCollapseProp $props;
  @override
  late final WCollapseSlot $slots;
  @override
  late WCollapseStyle $style;

  WCollapse({
    Key? key,
    WCollapseOn? on,
    WCollapseProp? props,
    WCollapseSlot? slots,
    WCollapseStyle? style,
  }) : super(key: key) {
    $on = on ?? WCollapseOn();
    $props = props ?? WCollapseProp();
    $slots = slots ?? WCollapseSlot(null);
    $style = style ?? WCollapseStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCollapseOn extends BaseOn {}

class WCollapseProp extends BaseProp {}

class WCollapseSlot extends BaseSlot {
  WCollapseSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
