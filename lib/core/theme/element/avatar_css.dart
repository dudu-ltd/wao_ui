// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../../../wao_ui.dart';
import '../../base_style.dart';

avatar() {
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
  var _avatar = Clazz.avatar = '.el-avatar';

  CfgGlobal.selectors.addAll({
    'WAvatar': (cpn) {
      cpn as WAvatar;
      return [
        _avatar,
        if (cpn.$props.isCircle) '$_avatar$circleSuf',
        if (cpn.$props.isSquare) '$_avatar$squareSuf',
        if (cpn.$props.icon != null) '$_avatar$iconSuf',
        '$_avatar--${cpn.$props.size}',
      ];
    },
  });

  CfgGlobal.css.addAll({
    [
      [_avatar]
    ]: BaseStyle()
      ..textAlign = Alignment.center
      ..color = CfgGlobal.basicColor.shade50
      ..backgroundColor = CfgGlobal.basicColor.shade500
      ..width = 40
      ..height = 40
      ..maxWidth = 40
      ..fontSize = 14
      ..overflow = Clip.hardEdge,
    [
      [_avatar, '$_avatar$circleSuf']
    ]: BaseStyle()..borderRadius = BorderRadius.circular(1024),
    [
      [_avatar, '$_avatar$squareSuf']
    ]: BaseStyle()..borderRadius = CfgGlobal.circularBorderRadius.medium,
    [
      [_avatar, '$_avatar$iconSuf']
    ]: BaseStyle()..fontSize = 18,
    [
      [_avatar, '$_avatar$iconSuf', '$_avatar$smallSuf']
    ]: BaseStyle()..fontSize = 20,
    [
      [_avatar, '$_avatar$iconSuf', '$_avatar$mediumSuf']
    ]: BaseStyle()..fontSize = 24,
    [
      [_avatar, '$_avatar$iconSuf', '$_avatar$largeSuf']
    ]: BaseStyle()..fontSize = 28,
    [
      [_avatar, '$_avatar$largeSuf']
    ]: BaseStyle()
      ..width = 40
      ..height = 40
      ..lineHeight = 40,
    [
      [_avatar, '$_avatar$mediumSuf']
    ]: BaseStyle()
      ..width = 36
      ..height = 36
      ..lineHeight = 36,
    [
      [_avatar, '$_avatar$smallSuf']
    ]: BaseStyle()
      ..width = 28
      ..height = 28
      ..lineHeight = 28,
  });
}
