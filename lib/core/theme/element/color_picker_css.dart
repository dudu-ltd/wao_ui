// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../../../wao_ui.dart';
import '../../base_style.dart';

colorPicker() {
  not(String str) {
    return ':not($str)';
  }

  var _colorPicker = Clazz.colorPicker = '.el-color-picker';

  CfgGlobal.selectors.addAll({
    'WColorPicker': (cpn) {
      cpn as WColorPicker;
      return [_colorPicker];
    },
  });

  CfgGlobal.css.addAll({
    [
      [_colorPicker]
    ]: WColorPickerStyle()
      ..panel = (BaseStyle()
        ..padding = const EdgeInsets.all(8.0)
        ..width = 400
        ..height = 500),
  });
}
