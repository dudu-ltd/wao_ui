import 'package:flutter/material.dart';

import '../../../wao_ui.dart';
import '../../base_style.dart';

container() {
  not(String str) {
    return ':not($str)';
  }

  var focus = Clazz.focus;
  var hover = Clazz.hover;
  var active = Clazz.active;

  var firstChild = Clazz.firstChild;
  var lastChild = Clazz.lastChild;

  var isPlain = Clazz.isPlain;
  var isDisabled = Clazz.isDisabled;
  var isActive = Clazz.isActive;
  var isRound = Clazz.isRound;
  var isCircle = Clazz.isCircle;
  var isLoading = Clazz.isLoading;
  var isOpened = Clazz.isOpened;

  var primarySuf = Clazz.primarySuf;
  var successSuf = Clazz.successSuf;
  var infoSuf = Clazz.infoSuf;
  var warningSuf = Clazz.warningSuf;
  var dangerSuf = Clazz.dangerSuf;
  var textSuf = Clazz.textSuf;

  var miniSuf = Clazz.miniSuf;
  var smallSuf = Clazz.smallSuf;
  var mediumSuf = Clazz.mediumSuf;
  var largeSuf = Clazz.largeSuf;

  // position
  var horizontalSuf = Clazz.horizontalSuf;
  var verticalSuf = Clazz.verticalSuf;
  var isCollapse = Clazz.isCollapse;
  var titleSuf = Clazz.titleSuf;
  var contentSuf = Clazz.contentSuf;
  var iconArrowSuf = Clazz.iconArrowSuf;
  var popupSuf = Clazz.popupSuf;

  var iconSuf = Clazz.iconSuf;
  var squareSuf = Clazz.squareSuf;
  var circleSuf = Clazz.circleSuf;
  var _container = Clazz.container = '.el-container';
  var _main = Clazz.main = '.el-main';
  var _aside = Clazz.aside = '.el-aside';
  var _header = Clazz.header = '.el-header';
  var _footer = Clazz.footer = '.el-footer';

  CfgGlobal.selectors.addAll({
    'WContainer': (cpn) {
      cpn as WContainer;
      return [_container];
    },
    'WMain': (cpn) {
      cpn as WMain;
      return [_main];
    },
    'WAside': (cpn) {
      cpn as WAside;
      return [_aside];
    },
    'WHeader': (cpn) {
      cpn as WHeader;
      return [_header];
    },
    'WFooter': (cpn) {
      cpn as WFooter;
      return [_footer];
    },
  });

  CfgGlobal.css.addAll({
    [
      [_container]
    ]: BaseStyle(),
    [
      [_main]
    ]: BaseStyle()..padding = const EdgeInsets.all(20.0),
    [
      [_footer],
      [_header]
    ]: BaseStyle()
      ..padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
  });
}
