import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WDateTimePicker extends StatelessWidget
    implements
        BaseWidget<WDateTimePickerOn, WDateTimePickerProp,
            WDateTimePickerSlot> {
  @override
  late final WDateTimePickerOn $on;

  @override
  late final WDateTimePickerProp $props;

  @override
  late final WDateTimePickerSlot $slots;

  WDateTimePicker({
    Key? key,
    WDateTimePickerOn? on,
    WDateTimePickerProp? props,
    WDateTimePickerSlot? slots,
  }) : super(key: key) {
    $on = on ?? WDateTimePickerOn();
    $props = props ?? WDateTimePickerProp();
    $slots = slots ?? WDateTimePickerSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WDateTimePickerOn extends BaseOn {}

class WDateTimePickerProp extends BaseProp {}

class WDateTimePickerSlot extends BaseSlot {}
