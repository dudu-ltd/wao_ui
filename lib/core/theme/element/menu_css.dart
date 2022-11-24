// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../../../wao_ui.dart';
import '../../base_style.dart';

menu() {
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
  var _menu = Clazz.menu = '.el-menu';
  var _submenu = Clazz.submenu = '.el-submenu';
  var _menuItemGroup = Clazz.menuItemGroup = '.el-menu-item-group';
  var _menuItem = Clazz.menuItem = '.el-menu-item';

  CfgGlobal.css.addAll({
    // WMenu
    [
      [_menu]
    ]: WMenuStyle()
      ..color = CfgGlobal.textColor.shade800
      ..prefixColor = CfgGlobal.textColor.shade600
      ..suffixColor = CfgGlobal.textColor.shade600
      ..activeColor = CfgGlobal.primaryColor
      ..backgroundColor = Colors.transparent
      ..borderRightWidth = 1
      ..borderRightColor = const Color(0xFFE6E6E6)
      ..margin = EdgeInsets.zero
      ..paddingLeft = 0.0
      ..backgroundColor = Colors.white
      ..hoverBackgroundColor = const Color(0xFFecf5ff),
    [
      [_menu, horizontalSuf]
    ]: BaseStyle()
      ..borderRightWidth = 0
      ..borderBottomWidth = 1
      ..borderBottomColor = const Color(0xFFE6E6E6),

    [
      [_menu, horizontalSuf, _menuItem]
    ]: BaseStyle()
      ..height = 60
      ..lineHeight = 60
      ..margin = EdgeInsets.zero
      ..borderBottomWidth = 2
      ..borderBottomColor = Colors.transparent
      ..color = CfgGlobal.textColor.shade600,

    [
      [_menu, horizontalSuf, _menuItem, not(isDisabled), focus],
      [_menu, horizontalSuf, _menuItem, not(isDisabled), hover]
    ]: BaseStyle()..backgroundColor = CfgGlobal.basicColor.shade50,

    [
      [horizontalSuf, _submenu]
    ]: BaseStyle()
    // ..textAlign = Alignment.centerLeft
    ,

    [
      [_menu, horizontalSuf, _submenu, focus, titleSuf],
      [_menu, horizontalSuf, hover, titleSuf]
    ]: BaseStyle()..color = CfgGlobal.textColor,

    [
      [_menu, horizontalSuf, _submenu, isActive, titleSuf],
    ]: BaseStyle()
      ..borderBottomWidth = 2
      ..borderBottomColor = CfgGlobal.primaryColor
      ..color = CfgGlobal.textColor,
    [
      [_menu, horizontalSuf, _submenu, titleSuf]
    ]: BaseStyle()
      ..height
      ..lineHeight = 60
      ..borderBottomWidth = 2
      ..borderBottomColor = Colors.transparent,
    [
      [_menu, horizontalSuf, _submenu, titleSuf, hover]
    ]: BaseStyle()..backgroundColor = CfgGlobal.basicColor.shade50,

    [
      [_menu, horizontalSuf, _submenu, iconArrowSuf]
    ]: BaseStyle()
      ..marginLeft = 8
      ..textAlign = Alignment.center,

    [
      [_menu, horizontalSuf, _menu, _menuItem],
      [_menu, horizontalSuf, _menu, _submenu, titleSuf]
    ]: BaseStyle()
      ..backgroundColor = CfgGlobal.basicColor.shade50
      ..height = 56
      ..lineHeight = 56
      ..padding = const EdgeInsets.symmetric(vertical: 0, horizontal: 20)
      ..color = CfgGlobal.basicColor.shade600,

    [
      [_menu, horizontalSuf, _menu, _menuItem, isActive],
      [_menu, horizontalSuf, _menu, _submenu, isActive, titleSuf]
    ]: BaseStyle()..color = CfgGlobal.textColor,

    [
      [_menu, horizontalSuf, _menuItem, not(isDisabled), focus],
      [_menu, horizontalSuf, _menuItem, not(isDisabled), hover]
    ]: BaseStyle()..color = CfgGlobal.textColor,

    [
      [_menu, horizontalSuf, _menuItem, isActive]
    ]: BaseStyle()
      ..borderBottomWidth = 2.0
      ..borderBottomColor = CfgGlobal.primaryColor
      ..color = CfgGlobal.textColor,

    [
      [_menu, horizontalSuf, _menuItem]
    ]: WMenuItemStyle()..padding = const EdgeInsets.symmetric(horizontal: 20),

    [
      [_menu, isCollapse]
    ]: BaseStyle()..width = 64,

    [
      [_menu, isCollapse, iconSuf],
      [_menu, isCollapse, _submenu, titleSuf, iconSuf],
    ]: BaseStyle()
      ..margin = EdgeInsets.zero
      ..verticalAlign = Alignment.center
      ..width = 24
      ..textAlign = Alignment.center,

    [
      [_menu, isCollapse, _menuItem, _submenu, iconArrowSuf],
      [_menu, isCollapse, _submenu, titleSuf, iconArrowSuf],
    ]: BaseStyle()..display = false,

    [
      [_menu, isCollapse, _submenu]
    ]: BaseStyle()..minWidth = 200.0,

    [
      [_menu, isCollapse, _menu, _submenu]
    ]: BaseStyle()
      ..marginLeft = 5
      ..borderWidth = 1
      ..borderColor = const Color(0xFFe4e7ed),

    [
      [_menu, popupSuf]
    ]: BaseStyle()
      ..minWidth = 200
      ..borderWidth = 0
      ..padding = const EdgeInsets.symmetric(vertical: 5)
      ..borderRadius = BorderRadius.circular(2)
      ..boxShadow = [
        const BoxShadow(
          offset: Offset(0.0, 2.0),
          blurRadius: 12.0,
          spreadRadius: 0.0,
          color: Colors.black,
        )
      ],

    [
      [_menuItem]
    ]: BaseStyle()
      ..height = 56
      ..lineHeight = 56
      ..fontSize = 14
      ..color = CfgGlobal.textColor
      // ..padding = const EdgeInsets.symmetric(horizontal: 0, vertical: 20)
      ..verticalAlign = Alignment.centerLeft,

    [
      [_menuItem, iconSuf]
    ]: BaseStyle()..color = CfgGlobal.textColor.shade600,

    [
      [_menuItem, focus],
      [_menuItem, hover]
    ]: BaseStyle()..backgroundColor = CfgGlobal.primaryColor.shade50,

    [
      [_menuItem, isDisabled]
    ]: BaseStyle()
      ..opacity = .25
      ..cursor = SystemMouseCursors.forbidden
      ..backgroundColor = Colors.transparent,

    [
      [_menuItem, iconSuf]
    ]: BaseStyle()
      ..marginRight = 5
      ..width = 24
      ..textAlign = Alignment.center
      ..fontSize = 18
      ..verticalAlign = Alignment.center,

    [
      [_menuItem, isActive]
    ]: BaseStyle()..color = CfgGlobal.primaryColor,

    [
      [_menuItem, isActive, iconSuf]
    ]: BaseStyle()..color,

    [
      [_submenu]
    ]: BaseStyle()
      ..margin = EdgeInsets.zero
      ..paddingLeft = 0,

    [
      [_submenu, titleSuf]
    ]: BaseStyle()
      ..height = 56
      ..lineHeight = 56
      ..fontSize = 14
      ..color = CfgGlobal.textColor
      ..padding = const EdgeInsets.symmetric(horizontal: 0, vertical: 20)
      ..cursor = SystemMouseCursors.click,

    [
      [_submenu, iconSuf]
    ]: BaseStyle()..color = CfgGlobal.textColor.shade600,

    [
      [_submenu, titleSuf, focus],
      [_submenu, titleSuf, hover]
    ]: BaseStyle()..backgroundColor = CfgGlobal.primaryColor.shade50,

    [
      [_submenu, titleSuf, isDisabled]
    ]: BaseStyle()
      ..opacity = .25
      ..cursor = SystemMouseCursors.forbidden,

    [
      [_submenu, _menuItem]
    ]: BaseStyle()
      ..height = 50
      ..lineHeight = 50
      ..padding = const EdgeInsets.symmetric(horizontal: 20)
      ..minWidth = 0,

    [
      [_submenu, _menuItem, titleSuf]
    ]: BaseStyle()
      ..height = 56
      ..lineHeight = 56,

    [
      [_submenu, iconArrowSuf]
    ]: BaseStyle()
      // ..padding = const EdgeInsets.only(right: 20)
      ..fontSize = 12,

    [
      [_submenu, active, titleSuf]
    ]: BaseStyle()..borderBottomColor = CfgGlobal.primaryColor,

    [
      [_submenu, isDisabled, _menuItem],
      [_submenu, isDisabled, titleSuf]
    ]: BaseStyle()
      ..opacity = .25
      ..cursor = SystemMouseCursors.forbidden
      ..backgroundColor = Colors.transparent,

    [
      [_submenu, iconSuf]
    ]: BaseStyle()
      ..verticalAlign = Alignment.center
      ..marginRight = 5
      ..width = 24
      ..textAlign = Alignment.center
      ..fontSize = 18,

    [
      [_menuItemGroup]
    ]: BaseStyle()..padding = EdgeInsets.zero,

    [
      [_menuItemGroup, titleSuf]
    ]: BaseStyle()
      // ..padding = const EdgeInsets.fromLTRB(20, 7, 0, 7)
      ..fontSize = 12
      ..color = CfgGlobal.textColor.shade600,
  });

  CfgGlobal.selectors.addAll({
    'WMenu': (cpn) {
      cpn as WMenu;
      return [
        _menu,
        if (cpn.$props.collapse) '$_menu$isCollapse',
        if (cpn.$props.modeIsVertical) verticalSuf,
        if (cpn.$props.modeIsHorizontal) horizontalSuf,
      ];
    },
    'WMenuItemGroup': (cpn) {
      cpn as WMenuItemGroup;
      return [_menuItemGroup];
    },
    'WSubmenu': (cpn) {
      cpn as WSubmenu;
      return [_submenu];
    },
    'WMenuItem': (cpn) {
      cpn as WMenuItem;
      print(cpn.rootMenu?.selector);
      return [
        if (cpn.rootMenu != null) ...cpn.rootMenu!.selector,
        if (cpn.belongTo != null)
          ...(cpn.belongTo!.currentWidget as WSubmenu).selector,
        _menuItem,
        if (cpn.menuState?.value.value == cpn.$props.index) isActive
      ];
    },
  });
}
