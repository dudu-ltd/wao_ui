import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WTooltip extends StatelessWidget
    implements BaseWidget<WTooltipOn, WTooltipProp, WTooltipSlot> {
  @override
  late WTooltipOn $on;

  @override
  late WTooltipProp $props;

  @override
  late WTooltipSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTooltipOn extends BaseOn {}

class WTooltipProp extends BaseProp {}

class WTooltipSlot extends BaseSlot {}
