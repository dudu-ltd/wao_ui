import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WDivider extends StatelessWidget
    implements BaseWidget<WDividerOn, WDividerProp, WDividerSlot> {
  @override
  late WDividerOn $on;

  @override
  late WDividerProp $props;

  @override
  late WDividerSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WDividerOn extends BaseOn {}

class WDividerProp extends BaseProp {}

class WDividerSlot extends BaseSlot {}
