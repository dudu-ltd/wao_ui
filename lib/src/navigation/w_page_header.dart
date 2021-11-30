import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WPageHeader extends StatelessWidget
    implements BaseWidget<WPageHeaderOn, WPageHeaderProp, WPageHeaderSlot> {
  @override
  late WPageHeaderOn $on;

  @override
  late WPageHeaderProp $props;

  @override
  late WPageHeaderSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WPageHeaderOn extends BaseOn {}

class WPageHeaderProp extends BaseProp {}

class WPageHeaderSlot extends BaseSlot {}
