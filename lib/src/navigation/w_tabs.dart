import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WTabs extends StatelessWidget
    implements BaseWidget<WTabsOn, WTabsProp, WTabsSlot, WTabsStyle> {
  @override
  late final WTabsOn $on;
  @override
  late final WTabsProp $props;
  @override
  late final WTabsSlot $slots;
  @override
  late WTabsStyle $style;

  WTabs({
    Key? key,
    WTabsOn? on,
    WTabsProp? props,
    WTabsSlot? slots,
    WTabsStyle? style,
  }) : super(key: key) {
    $on = on ?? WTabsOn();
    $props = props ?? WTabsProp();
    $slots = slots ?? WTabsSlot(null);
    $style = style ?? WTabsStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTabsOn extends BaseOn {}

class WTabsProp extends BaseProp {}

class WTabsSlot extends BaseSlot {
  WTabsSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
