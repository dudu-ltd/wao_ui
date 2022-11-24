// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../../../wao_ui.dart';
import '../../base_style.dart';

collapse() {
  var _collapse = Clazz.collapse = '.el-collapse';

  CfgGlobal.selectors.addAll({
    'WCollapse': (cpn) {
      cpn as WCollapse;
      return [_collapse];
    },
  });

  CfgGlobal.css.addAll({
    [
      [_collapse]
    ]: WCollapseStyle(),
  });

  collapseItem();
}

collapseItem() {
  var _collapseItem = Clazz.collapseItem = '.el-collapse-item';

  CfgGlobal.selectors.addAll({
    'WCollapseItem': (cpn) {
      cpn as WCollapseItem;
      return [_collapseItem];
    },
  });

  CfgGlobal.css.addAll({
    [
      [_collapseItem]
    ]: WCollapseItemStyle()
      ..body = (BaseStyle()
        ..textAlign = Alignment.centerLeft
        ..padding = const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        )),
  });
}
