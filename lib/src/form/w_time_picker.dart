import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WTimePicker extends StatelessWidget
    implements BaseWidget<WTimePickerOn, WTimePickerProp, WTimePickerSlot> {
  @override
  late final WTimePickerOn $on;

  @override
  late final WTimePickerProp $props;

  @override
  late final WTimePickerSlot $slots;

  WTimePicker({
    Key? key,
    WTimePickerOn? on,
    WTimePickerProp? props,
    WTimePickerSlot? slots,
  }) : super(key: key) {
    $on = on ?? WTimePickerOn();
    $props = props ?? WTimePickerProp();
    $slots = slots ?? WTimePickerSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTimePickerOn extends BaseOn {}

class WTimePickerProp extends BaseProp {}

class WTimePickerSlot extends BaseSlot {}
