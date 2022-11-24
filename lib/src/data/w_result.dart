// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';

class WResult extends WStatelessWidget<WResultOn, WResultProp, WResultSlot,
    WResultStyle> {
  WResult({
    Key? key,
    WResultOn? on,
    WResultProp? props,
    WResultSlot? slots,
    WResultStyle? style,
  }) : super(key: key) {
    $on = on ?? WResultOn();
    $props = props ?? WResultProp();
    $slots = slots ?? WResultSlot(null);
    $style = style ?? WResultStyle();
    init();
  }

  @override
  Widget wbuild(BuildContext context) {
    return Padding(
      padding: cfgGlobal.result.outPadding,
      child: Column(
        children: [
          if (icon != null) marginWrapper(icon!, cfgGlobal.result.itemMargin),
          if (title != null) marginWrapper(title!, cfgGlobal.result.itemMargin),
          if (subTitle != null)
            marginWrapper(subTitle!, cfgGlobal.result.itemMargin),
          if (extra != null)
            marginWrapper(extra!, cfgGlobal.result.extraMargin),
        ],
      ),
    );
  }

  Widget mT18Wrapper(Widget child) {
    return Container(
      margin: cfgGlobal.result.itemMargin,
      child: child,
    );
  }

  Widget? get icon {
    return $slots.icon ??
        Icon(
          cfgGlobal.result.icon($props.icon),
          color: CfgGlobal.color($props.icon),
          size: 72,
        );
  }

  Widget? get title {
    return $slots.title ??
        Text(
          $props.title ?? '',
          style: TextStyle(
            fontSize: cfgGlobal.result.titleFontSize,
            color: cfgGlobal.result.titleColor,
          ),
        );
  }

  Widget? get subTitle {
    return $slots.subTitle ??
        Text(
          $props.subTitle ?? '',
          style: TextStyle(
            fontSize: cfgGlobal.result.subTitleFontSize,
            color: cfgGlobal.result.subTitleColor,
          ),
        );
  }

  Widget? get extra {
    return $slots.extra;
  }
}

class WResultOn extends BaseOn {}

class WResultProp extends BaseProp {
  String? title;
  String? subTitle;
  late String icon;
  WResultProp({this.title, this.subTitle, icon}) {
    this.icon = icon ?? 'info';
  }
}

class WResultSlot extends BaseSlot {
  Widget? icon;
  Widget? title;
  Widget? subTitle;
  Widget? extra;
  WResultSlot(defaultSlotBefore,
      {this.icon, this.title, this.subTitle, this.extra})
      : super(defaultSlotBefore);
}
