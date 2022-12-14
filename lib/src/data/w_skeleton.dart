// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class WSkeleton extends WStatelessWidget<WSkeletonOn, WSkeletonProp,
    WSkeletonSlot, WSkeletonStyle> {
  WSkeleton({
    Key? key,
    WSkeletonOn? on,
    WSkeletonProp? props,
    WSkeletonSlot? slots,
    WSkeletonStyle? style,
  }) : super(key: key) {
    $on = on ?? WSkeletonOn();
    $props = props ?? WSkeletonProp();
    $slots = slots ?? WSkeletonSlot(null);
    $style = style ?? WSkeletonStyle();
    init();
  }

  @override
  Widget wbuild(BuildContext context) {
    return Container();
  }
}

class WSkeletonOn extends BaseOn {}

class WSkeletonProp extends BaseProp {}

class WSkeletonSlot extends BaseSlot {
  WSkeletonSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
