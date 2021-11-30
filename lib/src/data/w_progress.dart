import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WProgress extends StatelessWidget
    implements BaseWidget<WProgressOn, WProgressProp, WProgressSlot> {
  @override
  late WProgressOn $on;

  @override
  late WProgressProp $props;

  @override
  late WProgressSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WProgressOn extends BaseOn {}

class WProgressProp extends BaseProp {}

class WProgressSlot extends BaseSlot {}
