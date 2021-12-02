import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WNotification extends StatelessWidget
    implements
        BaseWidget<WNotificationOn, WNotificationProp, WNotificationSlot> {
  @override
  late final WNotificationOn $on;

  @override
  late final WNotificationProp $props;

  @override
  late final WNotificationSlot $slots;

  WNotification({
    Key? key,
    WNotificationOn? on,
    WNotificationProp? props,
    WNotificationSlot? slots,
  }) : super(key: key) {
    $on = on ?? WNotificationOn();
    $props = props ?? WNotificationProp();
    $slots = slots ?? WNotificationSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WNotificationOn extends BaseOn {}

class WNotificationProp extends BaseProp {}

class WNotificationSlot extends BaseSlot {}
