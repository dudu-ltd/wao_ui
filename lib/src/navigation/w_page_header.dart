import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WPageHeader extends StatelessWidget
    implements
        BaseWidget<WPageHeaderOn, WPageHeaderProp, WPageHeaderSlot,
            WPageHeaderStyle> {
  @override
  late final WPageHeaderOn $on;
  @override
  late final WPageHeaderProp $props;
  @override
  late final WPageHeaderSlot $slots;
  @override
  late WPageHeaderStyle $style;

  WPageHeader({
    Key? key,
    WPageHeaderOn? on,
    WPageHeaderProp? props,
    WPageHeaderSlot? slots,
    WPageHeaderStyle? style,
  }) : super(key: key) {
    $on = on ?? WPageHeaderOn();
    $props = props ?? WPageHeaderProp();
    $slots = slots ?? WPageHeaderSlot(null);
    $style = style ?? WPageHeaderStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WPageHeaderOn extends BaseOn {}

class WPageHeaderProp extends BaseProp {}

class WPageHeaderSlot extends BaseSlot {
  WPageHeaderSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
