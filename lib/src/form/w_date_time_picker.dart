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
  late WDateTimePickerOn $on;

  @override
  late WDateTimePickerProp $props;

  @override
  late WDateTimePickerSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WDateTimePickerOn extends BaseOn {}

class WDateTimePickerProp extends BaseProp {}

class WDateTimePickerSlot extends BaseSlot {}
