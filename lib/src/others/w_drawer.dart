import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WDrawer extends StatelessWidget
    implements BaseWidget<WDrawerOn, WDrawerProp, WDrawerSlot> {
  @override
  late WDrawerOn $on;

  @override
  late WDrawerProp $props;

  @override
  late WDrawerSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WDrawerOn extends BaseOn {}

class WDrawerProp extends BaseProp {}

class WDrawerSlot extends BaseSlot {}
