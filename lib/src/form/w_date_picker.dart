import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WDatePicker extends StatelessWidget
    implements BaseWidget<WDatePickerOn, WDatePickerProp, WDatePickerSlot> {
  @override
  late WDatePickerOn $on;

  @override
  late WDatePickerProp $props;

  @override
  late WDatePickerSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WDatePickerOn extends BaseOn {}

class WDatePickerProp extends BaseProp {}

class WDatePickerSlot extends BaseSlot {}
