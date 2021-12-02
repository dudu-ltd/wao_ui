import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WColorPicker extends StatelessWidget
    implements BaseWidget<WColorPickerOn, WColorPickerProp, WColorPickerSlot> {
  @override
  late final WColorPickerOn $on;

  @override
  late final WColorPickerProp $props;

  @override
  late final WColorPickerSlot $slots;

  WColorPicker({
    Key? key,
    WColorPickerOn? on,
    WColorPickerProp? props,
    WColorPickerSlot? slots,
  }) : super(key: key) {
    $on = on ?? WColorPickerOn();
    $props = props ?? WColorPickerProp();
    $slots = slots ?? WColorPickerSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WColorPickerOn extends BaseOn {}

class WColorPickerProp extends BaseProp {}

class WColorPickerSlot extends BaseSlot {}
