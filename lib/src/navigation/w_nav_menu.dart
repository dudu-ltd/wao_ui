import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WNavMenu extends StatelessWidget
    implements BaseWidget<WNavMenuOn, WNavMenuProp, WNavMenuSlot> {
  @override
  late WNavMenuOn $on;

  @override
  late WNavMenuProp $props;

  @override
  late WNavMenuSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WNavMenuOn extends BaseOn {}

class WNavMenuProp extends BaseProp {}

class WNavMenuSlot extends BaseSlot {}
