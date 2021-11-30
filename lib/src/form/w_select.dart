import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WSelect extends StatelessWidget
    implements BaseWidget<WSelectOn, WSelectProp, WSelectSlot> {
  @override
  late WSelectOn $on;

  @override
  late WSelectProp $props;

  @override
  late WSelectSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WSelectOn extends BaseOn {}

class WSelectProp extends BaseProp {}

class WSelectSlot extends BaseSlot {}
