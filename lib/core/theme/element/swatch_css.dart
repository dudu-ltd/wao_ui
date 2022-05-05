import 'package:flutter/material.dart';

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
