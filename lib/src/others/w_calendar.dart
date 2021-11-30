import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WCalendar extends StatelessWidget
    implements BaseWidget<WCalendarOn, WCalendarProp, WCalendarSlot> {
  @override
  late WCalendarOn $on;

  @override
  late WCalendarProp $props;

  @override
  late WCalendarSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCalendarOn extends BaseOn {}

class WCalendarProp extends BaseProp {}

class WCalendarSlot extends BaseSlot {}
