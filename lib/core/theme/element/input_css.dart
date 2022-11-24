// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../../../wao_ui.dart';
import '../../base_style.dart';

input() {
  double.infinity;
  var _input = Clazz.input = '.el-input';

  CfgGlobal.selectors.addAll({
    'WInput': (cpn) {
      cpn as WInput;
      return [_input];
    },
  });

  CfgGlobal.css.addAll({
    [
      [_input]
    ]: WInputStyle()
      ..maxHeight = double.infinity
      ..maxWidth = double.infinity,
  });
}
