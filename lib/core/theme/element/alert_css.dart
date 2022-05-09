import 'package:flutter/material.dart';

import '../../../wao_ui.dart';
import '../../base_style.dart';

alert() {
  var _alert = Clazz.alert = '.el-alert';
  var dark = 'dark';

  CfgGlobal.selectors.addAll({
    'WAlert': (cpn) {
      cpn as WAlert;
      return [
        _alert,
        '--${cpn.$props.type}',
        if (cpn.$props.effectIsDark) dark
      ];
    },
  });

  CfgGlobal.css.addAll({
    [
      [_alert]
    ]: WAlertStyle()..padding = const EdgeInsets.fromLTRB(16, 8, 8, 8),
    [
      [_alert, Clazz.primarySuf]
    ]: WAlertStyle()
      ..backgroundColor = CfgGlobal.primaryColor.shade100
      ..color = CfgGlobal.primaryColor.shade900,
    [
      [_alert, Clazz.infoSuf]
    ]: WAlertStyle()
      ..backgroundColor = CfgGlobal.infoColor.shade100
      ..color = CfgGlobal.infoColor.shade900,
    [
      [_alert, Clazz.successSuf]
    ]: WAlertStyle()
      ..backgroundColor = CfgGlobal.successColor.shade100
      ..color = CfgGlobal.successColor.shade900,
    [
      [_alert, Clazz.warningSuf]
    ]: WAlertStyle()
      ..backgroundColor = CfgGlobal.warningColor.shade100
      ..color = CfgGlobal.warningColor.shade900,
    [
      [_alert, Clazz.dangerSuf]
    ]: WAlertStyle()
      ..backgroundColor = CfgGlobal.dangerColor.shade100
      ..color = CfgGlobal.dangerColor.shade900,
    [
      [_alert, Clazz.primarySuf, dark]
    ]: WAlertStyle()
      ..backgroundColor = CfgGlobal.primaryColor.shade900
      ..color = Colors.white,
    [
      [_alert, Clazz.infoSuf, dark]
    ]: WAlertStyle()
      ..backgroundColor = CfgGlobal.infoColor.shade900
      ..color = Colors.white,
    [
      [_alert, Clazz.successSuf, dark]
    ]: WAlertStyle()
      ..backgroundColor = CfgGlobal.successColor.shade900
      ..color = Colors.white,
    [
      [_alert, Clazz.warningSuf, dark]
    ]: WAlertStyle()
      ..backgroundColor = CfgGlobal.warningColor.shade900
      ..color = Colors.white,
    [
      [_alert, Clazz.dangerSuf, dark]
    ]: WAlertStyle()
      ..backgroundColor = CfgGlobal.dangerColor.shade900
      ..color = Colors.white,
  });
}
