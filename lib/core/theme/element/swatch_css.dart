// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import '../../../wao_ui.dart';
import '../../base_style.dart';

swatch() {
  var _swatch = Clazz.swatch = '.el-switch';

  CfgGlobal.selectors.addAll({
    'WSwitch': (cpn) {
      cpn as WSwitch;
      return [_swatch];
    },
  });

  CfgGlobal.css.addAll({
    [
      [_swatch]
    ]: WSwitchStyle()..borderRadius = CfgGlobal.circularBorderRadius.large,
  });
}
