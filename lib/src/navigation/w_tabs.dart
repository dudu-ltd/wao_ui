import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WTabs extends StatelessWidget
    implements BaseWidget<WTabsOn, WTabsProp, WTabsSlot> {
  @override
  late WTabsOn $on;

  @override
  late WTabsProp $props;

  @override
  late WTabsSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTabsOn extends BaseOn {}

class WTabsProp extends BaseProp {}

class WTabsSlot extends BaseSlot {}
