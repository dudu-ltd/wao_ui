// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class WMessage extends WStatelessWidget<WMessageOn, WMessageProp, WMessageSlot,
    WMessageStyle> {
  WMessage({
    Key? key,
    WMessageOn? on,
    WMessageProp? props,
    WMessageSlot? slots,
    WMessageStyle? style,
  }) : super(key: key) {
    $on = on ?? WMessageOn();
    $props = props ?? WMessageProp();
    $slots = slots ?? WMessageSlot(null);
    $style = style ?? WMessageStyle();
    init();
  }

  @override
  Widget wbuild(BuildContext context) {
    return Container();
  }
}

class WMessageOn extends BaseOn {}

class WMessageProp extends BaseProp {}

class WMessageSlot extends BaseSlot {
  WMessageSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
