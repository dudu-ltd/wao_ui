// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class WPageHeader extends WStatelessWidget<WPageHeaderOn, WPageHeaderProp,
    WPageHeaderSlot, WPageHeaderStyle> {
  WPageHeader({
    Key? key,
    WPageHeaderOn? on,
    WPageHeaderProp? props,
    WPageHeaderSlot? slots,
    WPageHeaderStyle? style,
  }) : super(key: key) {
    $on = on ?? WPageHeaderOn();
    $props = props ?? WPageHeaderProp();
    $slots = slots ?? WPageHeaderSlot(null);
    $style = style ?? WPageHeaderStyle();
    init();
  }

  @override
  Widget wbuild(BuildContext context) {
    return Container();
  }
}

class WPageHeaderOn extends BaseOn {
  Function? back;
  WPageHeaderOn({this.back});
}

class WPageHeaderProp extends BaseProp {
  late String title;
  String? content;
  WPageHeaderProp({this.title = '返回', this.content});
}

class WPageHeaderSlot extends BaseSlot {
  Widget? title;
  Widget? content;
  WPageHeaderSlot(defaultSlotBefore, {this.title, this.content})
      : super(defaultSlotBefore);
}
