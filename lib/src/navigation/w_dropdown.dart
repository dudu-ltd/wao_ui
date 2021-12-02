import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WDropdown extends StatelessWidget
    implements BaseWidget<WDropdownOn, WDropdownProp, WDropdownSlot> {
  @override
  late final WDropdownOn $on;

  @override
  late final WDropdownProp $props;

  @override
  late final WDropdownSlot $slots;

  WDropdown({
    Key? key,
    WDropdownOn? on,
    WDropdownProp? props,
    WDropdownSlot? slots,
  }) : super(key: key) {
    $on = on ?? WDropdownOn();
    $props = props ?? WDropdownProp();
    $slots = slots ?? WDropdownSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WDropdownOn extends BaseOn {}

class WDropdownProp extends BaseProp {}

class WDropdownSlot extends BaseSlot {}
