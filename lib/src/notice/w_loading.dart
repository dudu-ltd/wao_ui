import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class WLoading extends StatelessWidget
    with BaseMixins<WLoadingOn, WLoadingProp, WLoadingSlot, WLoadingStyle> {
  WLoading({
    Key? key,
    WLoadingOn? on,
    WLoadingProp? props,
    WLoadingSlot? slots,
    WLoadingStyle? style,
  }) : super(key: key) {
    $on = on ?? WLoadingOn();
    $props = props ?? WLoadingProp();
    $slots = slots ?? WLoadingSlot(null);
    $style = style ?? WLoadingStyle();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WLoadingOn extends BaseOn {}

class WLoadingProp extends BaseProp {}

class WLoadingSlot extends BaseSlot {
  WLoadingSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
