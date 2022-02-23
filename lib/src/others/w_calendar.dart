import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WCalendar extends StatelessWidget
    with BaseMixins<WCalendarOn, WCalendarProp, WCalendarSlot, WCalendarStyle> {
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
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCalendarOn extends BaseOn {}

class WCalendarProp extends BaseProp {
  late dynamic value;
  late List range;
  late int firstDayOfWeek;
  WCalendarProp({this.value, this.range = const [], this.firstDayOfWeek = 1});
}

class WCalendarSlot extends BaseSlot {
  Widget Function(DateTime, dynamic)? dateCell;
  WCalendarSlot(defaultSlotBefore, {this.dateCell}) : super(defaultSlotBefore);
}
