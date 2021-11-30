import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WColorPicker extends StatelessWidget
    implements BaseWidget<WColorPickerOn, WColorPickerProp, WColorPickerSlot> {
  @override
  late WColorPickerOn $on;

  @override
  late WColorPickerProp $props;

  @override
  late WColorPickerSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WColorPickerOn extends BaseOn {}

class WColorPickerProp extends BaseProp {}

class WColorPickerSlot extends BaseSlot {}
