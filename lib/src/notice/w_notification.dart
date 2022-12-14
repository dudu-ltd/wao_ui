// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class WNotification extends WStatelessWidget<WNotificationOn, WNotificationProp,
    WNotificationSlot, WNotificationStyle> {
  WNotification({
    Key? key,
    WNotificationOn? on,
    WNotificationProp? props,
    WNotificationSlot? slots,
    WNotificationStyle? style,
  }) : super(key: key) {
    $on = on ?? WNotificationOn();
    $props = props ?? WNotificationProp();
    $slots = slots ?? WNotificationSlot(null);
    $style = style ?? WNotificationStyle();
    init();
  }

  @override
  Widget wbuild(BuildContext context) {
    return Container();
  }
}

class WNotificationOn extends BaseOn {}

class WNotificationProp extends BaseProp {}

class WNotificationSlot extends BaseSlot {
  WNotificationSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
