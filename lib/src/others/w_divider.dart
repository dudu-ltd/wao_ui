import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WDivider extends StatelessWidget
    implements
        BaseWidget<WDividerOn, WDividerProp, WDividerSlot, WDividerStyle> {
  @override
  late final WDividerOn $on;
  @override
  late final WDividerProp $props;
  @override
  late final WDividerSlot $slots;
  @override
  late WDividerStyle $style;

  WDivider({
    Key? key,
    WDividerOn? on,
    WDividerProp? props,
    WDividerSlot? slots,
    WDividerStyle? style,
  }) : super(key: key) {
    $on = on ?? WDividerOn();
    $props = props ?? WDividerProp();
    $slots = slots ?? WDividerSlot(null);
    $style = style ?? WDividerStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WDividerOn extends BaseOn {}

class WDividerProp extends BaseProp {
  late Axis direction;
  late Alignment contentPosition;

  WDividerProp({
    this.direction = Axis.horizontal,
    this.contentPosition = Alignment.center,
  });
}

class WDividerSlot extends BaseSlot {
  WDividerSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
