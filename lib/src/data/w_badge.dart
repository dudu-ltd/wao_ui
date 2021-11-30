import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WBadge extends StatelessWidget
    implements BaseWidget<WBadgeOn, WBadgeProp, WBadgeSlot> {
  @override
  late WBadgeOn $on;

  @override
  late WBadgeProp $props;

  @override
  late WBadgeSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WBadgeOn extends BaseOn {}

class WBadgeProp extends BaseProp {}

class WBadgeSlot extends BaseSlot {}
