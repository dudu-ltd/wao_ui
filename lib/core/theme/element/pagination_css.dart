// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../../../wao_ui.dart';
import '../../base_style.dart';

pagination() {
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
  var _pagination = Clazz.pagination = '.el-pagination';
  var _input = Clazz.input = '.el-input';
  var _select = Clazz.select = '.el-select';

  CfgGlobal.selectors.addAll({
    'WPagination': (cpn) {
      cpn as WPagination;
      return [_pagination];
    },
  });

  CfgGlobal.css.addAll({
    [
      [_pagination]
    ]: BaseStyle()
      ..padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 2)
      ..color = CfgGlobal.textColor
      ..fontWeight = FontWeight.w700,
    [
      [_pagination, _select, _input]
    ]: BaseStyle()
      ..width = 100
      ..margin = const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 5,
      ),
  });
}
