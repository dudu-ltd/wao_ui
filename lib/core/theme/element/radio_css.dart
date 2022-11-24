// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../../../wao_ui.dart';
import '../../base_style.dart';

radio() {
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
  var _radioButton = Clazz.radioButton = '.el-radio-button';
  var _radio = Clazz.radio = '.el-radio';
  var _radioGroup = Clazz.radioGroup = '.el-radio-group';

  CfgGlobal.selectors.addAll({
    'WRadio': (cpn) {
      cpn as WRadio;
      return [_radio, '$_radio--${cpn.$props.size}'];
    },
    'WRadioGroup': (cpn) {
      cpn as WRadioGroup;
      return [_radioGroup, '$_radioGroup--${cpn.$props.size}'];
    },
    'WRadioButton': (cpn) {
      cpn as WRadioButton;
      return [_radioButton];
    },
  });

  CfgGlobal.css.addAll({
    [
      [_radio]
    ]: WRadioStyle()..padding = EdgeInsets.zero,
    [
      [_radioGroup]
    ]: WRadioGroupStyle()..padding = EdgeInsets.zero,
    [
      [_radioGroup, '$_radioGroup$miniSuf']
    ]: WRadioGroupStyle()
      ..button = (WRadioButtonStyle()..clazz = ['$_radioButton$miniSuf']),
    [
      [_radioGroup, '$_radioGroup$smallSuf']
    ]: WRadioGroupStyle()
      ..button = (WRadioButtonStyle()..clazz = ['$_radioButton$smallSuf']),
    [
      [_radioGroup, '$_radioGroup$mediumSuf']
    ]: WRadioGroupStyle()
      ..button = (WRadioButtonStyle()..clazz = ['$_radioButton$mediumSuf']),
    [
      [_radioGroup, '$_radioGroup$largeSuf']
    ]: WRadioGroupStyle()
      ..button = (WRadioButtonStyle()..clazz = ['$_radioButton$largeSuf']),
    [
      [_radioButton, '$_radioButton$miniSuf']
    ]: WRadioButtonStyle()..padding = CfgGlobal.padding.mini,
    [
      [_radioButton, '$_radioButton$smallSuf']
    ]: WRadioButtonStyle()..padding = CfgGlobal.padding.small,
    [
      [_radioButton, '$_radioButton$mediumSuf']
    ]: WRadioButtonStyle()..padding = CfgGlobal.padding.medium,
    [
      [_radioButton, '$_radioButton$largeSuf']
    ]: WRadioButtonStyle()..padding = CfgGlobal.padding.large,
  });
}
