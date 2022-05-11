import 'package:flutter/material.dart';

import '../../../wao_ui.dart';
import '../../base_style.dart';

dialog() {
  var _dialog = Clazz.dialog = '.el-dialog';

  CfgGlobal.selectors.addAll({
    'WDialog': (cpn) {
      cpn as WDialog;
      return [_dialog];
    },
  });

  CfgGlobal.css.addAll({
    [
      [_dialog]
    ]: WDialogStyle()
      ..footPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 0),
  });
}
