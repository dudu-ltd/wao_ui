import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WDatePicker extends StatelessWidget
    implements BaseWidget<WDatePickerOn, WDatePickerProp, WDatePickerSlot> {
  @override
  late final WDatePickerOn $on;

  @override
  late final WDatePickerProp $props;

  @override
  late final WDatePickerSlot $slots;

  WDatePicker({
    Key? key,
    WDatePickerOn? on,
    WDatePickerProp? props,
    WDatePickerSlot? slots,
  }) : super(key: key) {
    $on = on ?? WDatePickerOn();
    $props = props ?? WDatePickerProp();
    $slots = slots ?? WDatePickerSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WDatePickerOn extends BaseOn {}

class WDatePickerProp extends BaseProp {}

class WDatePickerSlot extends BaseSlot {}
