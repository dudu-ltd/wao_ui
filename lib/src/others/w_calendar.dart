import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WCalendar extends StatelessWidget
    implements
        BaseWidget<WCalendarOn, WCalendarProp, WCalendarSlot, WCalendarStyle> {
  @override
  late final WCalendarOn $on;
  @override
  late final WCalendarProp $props;
  @override
  late final WCalendarSlot $slots;
  @override
  late WCalendarStyle $style;

  WCalendar({
    Key? key,
    WCalendarOn? on,
    WCalendarProp? props,
    WCalendarSlot? slots,
    WCalendarStyle? style,
  }) : super(key: key) {
    $on = on ?? WCalendarOn();
    $props = props ?? WCalendarProp();
    $slots = slots ?? WCalendarSlot(null);
    $style = style ?? WCalendarStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCalendarOn extends BaseOn {}

class WCalendarProp extends BaseProp {}

class WCalendarSlot extends BaseSlot {
  WCalendarSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
