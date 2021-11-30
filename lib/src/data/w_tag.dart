import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WTag extends StatelessWidget
    implements BaseWidget<WTagOn, WTagProp, WTagSlot> {
  @override
  late WTagOn $on;

  @override
  late WTagProp $props;

  @override
  late WTagSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTagOn extends BaseOn {}

class WTagProp extends BaseProp {}

class WTagSlot extends BaseSlot {}
