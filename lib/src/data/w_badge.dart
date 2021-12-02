import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WBadge extends StatelessWidget
    implements BaseWidget<WBadgeOn, WBadgeProp, WBadgeSlot> {
  @override
  late final WBadgeOn $on;

  @override
  late final WBadgeProp $props;

  @override
  late final WBadgeSlot $slots;

  WBadge({
    Key? key,
    WBadgeOn? on,
    WBadgeProp? props,
    WBadgeSlot? slots,
  }) : super(key: key) {
    $on = on ?? WBadgeOn();
    $props = props ?? WBadgeProp();
    $slots = slots ?? WBadgeSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WBadgeOn extends BaseOn {}

class WBadgeProp extends BaseProp {}

class WBadgeSlot extends BaseSlot {}
