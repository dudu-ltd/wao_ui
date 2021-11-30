import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WDropdown extends StatelessWidget
    implements BaseWidget<WDropdownOn, WDropdownProp, WDropdownSlot> {
  @override
  late WDropdownOn $on;

  @override
  late WDropdownProp $props;

  @override
  late WDropdownSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WDropdownOn extends BaseOn {}

class WDropdownProp extends BaseProp {}

class WDropdownSlot extends BaseSlot {}
