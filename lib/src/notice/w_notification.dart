import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WNotification extends StatelessWidget
    implements
        BaseWidget<WNotificationOn, WNotificationProp, WNotificationSlot> {
  @override
  late WNotificationOn $on;

  @override
  late WNotificationProp $props;

  @override
  late WNotificationSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WNotificationOn extends BaseOn {}

class WNotificationProp extends BaseProp {}

class WNotificationSlot extends BaseSlot {}
