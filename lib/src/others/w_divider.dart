import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class WDivider extends StatelessWidget
    with BaseMixins<WDividerOn, WDividerProp, WDividerSlot, WDividerStyle> {
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
    init();
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
