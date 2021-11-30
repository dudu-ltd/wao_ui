import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WBacktop extends StatelessWidget
    implements BaseWidget<WBacktopOn, WBacktopProp, WBacktopSlot> {
  @override
  late WBacktopOn $on;

  @override
  late WBacktopProp $props;

  @override
  late WBacktopSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WBacktopOn extends BaseOn {}

class WBacktopProp extends BaseProp {}

class WBacktopSlot extends BaseSlot {}
