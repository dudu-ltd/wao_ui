// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class WTree
    extends WStatelessWidget<WTreeOn, WTreeProp, WTreeSlot, WTreeStyle> {
  WTree({
    Key? key,
    WTreeOn? on,
    WTreeProp? props,
    WTreeSlot? slots,
    WTreeStyle? style,
  }) : super(key: key) {
    $on = on ?? WTreeOn();
    $props = props ?? WTreeProp();
    $slots = slots ?? WTreeSlot(null);
    $style = style ?? WTreeStyle();
    init();
  }

  @override
  Widget wbuild(BuildContext context) {
    return Container();
  }
}

class WTreeOn extends BaseOn {}

class WTreeProp extends BaseProp {}

class WTreeSlot extends BaseSlot {
  WTreeSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
