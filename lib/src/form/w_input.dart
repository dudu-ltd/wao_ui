import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WInput extends StatelessWidget
    implements BaseWidget<WInputOn, WInputProp, WInputSlot> {
  @override
  late WInputOn $on;

  @override
  late WInputProp $props;

  @override
  late WInputSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WInputOn extends BaseOn {}

class WInputProp extends BaseProp {}

class WInputSlot extends BaseSlot {}
