import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WCard extends StatelessWidget
    implements BaseWidget<WCardOn, WCardProp, WCardSlot> {
  @override
  late WCardOn $on;

  @override
  late WCardProp $props;

  @override
  late WCardSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCardOn extends BaseOn {}

class WCardProp extends BaseProp {}

class WCardSlot extends BaseSlot {}
