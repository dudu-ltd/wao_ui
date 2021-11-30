import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WEmpty extends StatelessWidget
    implements BaseWidget<WEmptyOn, WEmptyProp, WEmptySlot> {
  @override
  late WEmptyOn $on;

  @override
  late WEmptyProp $props;

  @override
  late WEmptySlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WEmptyOn extends BaseOn {}

class WEmptyProp extends BaseProp {}

class WEmptySlot extends BaseSlot {}
