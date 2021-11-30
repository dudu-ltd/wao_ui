import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WTimePicker extends StatelessWidget
    implements BaseWidget<WTimePickerOn, WTimePickerProp, WTimePickerSlot> {
  @override
  late WTimePickerOn $on;

  @override
  late WTimePickerProp $props;

  @override
  late WTimePickerSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTimePickerOn extends BaseOn {}

class WTimePickerProp extends BaseProp {}

class WTimePickerSlot extends BaseSlot {}
