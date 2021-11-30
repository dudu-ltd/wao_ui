import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WInputNumber extends StatelessWidget
    implements BaseWidget<WInputNumberOn, WInputNumberProp, WInputNumberSlot> {
  @override
  late WInputNumberOn $on;

  @override
  late WInputNumberProp $props;

  @override
  late WInputNumberSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WInputNumberOn extends BaseOn {}

class WInputNumberProp extends BaseProp {}

class WInputNumberSlot extends BaseSlot {}
