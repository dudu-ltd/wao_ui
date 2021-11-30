import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WRadio extends StatelessWidget
    implements BaseWidget<WRadioOn, WRadioProp, WRadioSlot> {
  @override
  late WRadioOn $on;

  @override
  late WRadioProp $props;

  @override
  late WRadioSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WRadioOn extends BaseOn {}

class WRadioProp extends BaseProp {}

class WRadioSlot extends BaseSlot {}
