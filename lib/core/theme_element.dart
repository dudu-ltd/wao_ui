import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/core/utils/collect_util.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';

import '../wao_ui.dart';
import 'base_style.dart';
import 'swatch/size_swatch.dart';

not(String str) {
  return ':not($str)';
}

element() {
  var focus = ':focus';
  var hover = ':hover';
  var active = ':active';

  var firstChild = ':first-child';
  var lastChild = ':last-child';

  var isPlain = '.is-plain';
  var isDisabled = '.is-disabled';
  var isActive = '.is-active';
  var isRound = '.is-round';
  var isCircle = '.is-circle';
  var isLoading = '.is-loading';

  var primarySuf = '--primary';
  var successSuf = '--success';
  var infoSuf = '--info';
  var warningSuf = '--warning';
  var dangerSuf = '--danger';
  var textSuf = '--text';

  var miniSuf = '--mini';
  var smallSuf = '--small';
  var mediumSuf = '--medium';

  var _button = '.el-button';
  var _buttonGroup = '.el-button-group';

  CfgGlobal.primaryColor = const MaterialColor(
    0xFF409eff,
    <int, Color>{
      50: Color(0xFFecf5ff),
      100: Color(0xFFd9ecff),
      200: Color(0xFFc6e2ff),
      300: Color(0xFFb3d8ff),
      400: Color(0xFFa0cfff),
      500: Color(0xFF8cc5ff),
      600: Color(0xFF79bbff), //
      700: Color(0xFF66b1ff),
      800: Color(0xFF409EFF),
      900: Color(0xFF3a8ee6),
    },
  );

  CfgGlobal.successColor = const MaterialColor(
    0xFF67c23a,
    <int, Color>{
      50: Color(0xFFf0f9eb),
      100: Color(0xFFe1f3d8),
      200: Color(0xFFc6e2ff),
      300: Color(0xFFc2e7b0),
      400: Color(0xFFb3e19d),
      500: Color(0xFFa4da89),
      600: Color(0xFF79bbff),
      700: Color(0xFF85ce61),
      800: Color(0xFF67c23a),
      900: Color(0xFF5daf34),
    },
  );

  CfgGlobal.warningColor = const MaterialColor(
    0xFFe6a23c,
    <int, Color>{
      50: Color(0xFFfdf6ec),
      100: Color(0xFFfaecd8),
      200: Color(0xFFfaecd8),
      300: Color(0xFFf5dab1),
      400: Color(0xFFf3d19e),
      500: Color(0xFFf0c78a),
      600: Color(0xFF79bbff),
      700: Color(0xFFebb563),
      800: Color(0xFFe6a23c),
      900: Color(0xFFcf9236),
    },
  );

  CfgGlobal.dangerColor = const MaterialColor(
    0xFFf56c6c,
    <int, Color>{
      50: Color(0xFFfef0f0),
      100: Color(0xFFfde2e2),
      // 200: Color(0xFFfab6b6),
      300: Color(0xFFfbc4c4),
      400: Color(0xFFfab6b6),
      500: Color(0xFFf9a7a7),
      600: Color(0xFF79bbff),
      700: Color(0xFFf78989),
      800: Color(0xFFf56c6c),
      900: Color(0xFFdd6161),
    },
  );

  CfgGlobal.infoColor = const MaterialColor(
    0xFF909399,
    <int, Color>{
      50: Color(0xFFf4f4f5),
      100: Color(0xFFe9e9eb),
      // 200: Color(0xFFd3d4d6),
      300: Color(0xFFd3d4d6),
      400: Color(0xFFc8c9cc),
      500: Color(0xFFbcbec2),
      600: Color(0xFF79bbff),
      700: Color(0xFFa6a9ad),
      800: Color(0xFF909399),
      900: Color(0xFF82848a),
    },
  );

  CfgGlobal.defaultColor = const MaterialColor(
    0xFF909399,
    <int, Color>{
      50: Color(0xFFf4f4f5),
      100: Color(0xFFe9e9eb),
      // 200: Color(0xFFd3d4d6),
      300: Color(0xFFd3d4d6),
      400: Color(0xFFc8c9cc),
      500: Color(0xFFbcbec2),
      600: Color(0xFF79bbff),
      700: Color(0xFFa6a9ad),
      800: Color(0xFF909399),
      900: Color(0xFF82848a),
    },
  );
  CfgGlobal.textColor = const MaterialColor(
    0xFF303133,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFF2F6FC),
      200: Color(0xFFEBEEF5),
      300: Color(0xFFE4E7ED),
      400: Color(0xFFDCDFE6),
      500: Color(0xFFC0C4CC),
      600: Color(0xFF909399),
      700: Color(0xFF606266),
      800: Color(0xFF303133),
      900: Color(0xFF000000),
    },
  );

  CfgGlobal.padding = WEdgeInsets(
    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    const {
      'zero': EdgeInsets.zero,
      'mini': EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      'small': EdgeInsets.symmetric(vertical: 9, horizontal: 15),
      'medium': EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      'large': EdgeInsets.symmetric(vertical: 12, horizontal: 22),
    },
  );

  CfgGlobal.fontSize = WFontSize(
    14,
    const {
      'zero': 12,
      'mini': 13,
      'small': 14,
      'medium': 16,
      'large': 20,
    },
  );

  CfgGlobal.roundPadding = CfgGlobal.padding;

  CfgGlobal.circlePadding = WEdgeInsets(
    const EdgeInsets.all(10),
    const {
      'zero': EdgeInsets.zero,
      'mini': EdgeInsets.all(7),
      'small': EdgeInsets.all(9),
      'medium': EdgeInsets.all(10),
      'large': EdgeInsets.all(12),
    },
  );

  CfgGlobal.circularBorderRadius = WBorderRadius(
    BorderRadius.circular(20),
    {
      'zero': BorderRadius.zero,
      'mini': BorderRadius.circular(2),
      'small': BorderRadius.circular(4),
      'medium': BorderRadius.circular(15),
      'large': BorderRadius.circular(30),
    },
  );

  CfgGlobal.css = {
    [
      [_button]
    ]: BaseStyle()
      ..cursor = SystemMouseCursors.click
      ..backgroundColor = Colors.white
      ..borderColor = CfgGlobal.textColor.shade400
      ..color = const Color(0xFF606266)
      ..textAlign = Alignment.center
      ..margin = EdgeInsets.zero
      ..fontWeight = FontWeight.w500
      ..padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 20)
      ..fontSize = 14
      ..borderRadius = CfgGlobal.circularBorderRadius.small,
    [
      [_button, isRound]
    ]: BaseStyle()
      ..borderRadius = CfgGlobal.circularBorderRadius
      ..padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    [
      [_button, focus],
      [_button, hover]
    ]: BaseStyle()
      ..color = CfgGlobal.primaryColor
      ..backgroundColor = CfgGlobal.primaryColor.shade200
      ..borderColor = CfgGlobal.primaryColor.shade200,
    [
      [_button, active]
    ]: BaseStyle()
      ..borderColor = CfgGlobal.primaryColor.shade900
      ..color = CfgGlobal.primaryColor.shade900,
    [
      [_button, isPlain, focus],
      [_button, isPlain, hover]
    ]: BaseStyle()
      ..backgroundColor = Colors.white
      ..borderColor = CfgGlobal.primaryColor
      ..color = CfgGlobal.primaryColor,
    [
      [_button, isPlain, active]
    ]: BaseStyle()..backgroundColor = CfgGlobal.basicColor.shade50,
    [
      [_button, isActive],
      [_button, isPlain, active]
    ]: BaseStyle()
      ..borderColor = CfgGlobal.primaryColor.shade900
      ..color = CfgGlobal.primaryColor.shade900,
    [
      [_button, isDisabled],
      [_button, isDisabled, focus],
      [_button, isDisabled, hover],
    ]: BaseStyle()
      ..color = CfgGlobal.basicColor.shade500
      ..cursor = SystemMouseCursors.forbidden
      ..backgroundColor = CfgGlobal.basicColor.shade50
      ..borderColor = CfgGlobal.basicColor.shade200,
    [
      [_button, isDisabled, '$_button$textSuf'],
    ]: BaseStyle()..backgroundColor = Colors.transparent,
    [
      [_button, isDisabled, isPlain],
      [_button, isDisabled, isPlain, focus],
      [_button, isDisabled, isPlain, hover],
    ]: BaseStyle()
      ..backgroundColor = CfgGlobal.basicColor.shade50
      ..borderColor = CfgGlobal.basicColor.shade200
      ..color = CfgGlobal.basicColor.shade500,
    [
      [_button, isLoading],
    ]: BaseStyle()..cursor = SystemMouseCursors.progress,
    [
      [_button, isRound],
    ]: BaseStyle()
      ..borderRadius = CfgGlobal.circularBorderRadius.large
      ..padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 23),
    [
      [_button, isCircle],
    ]: BaseStyle()
      ..borderRadius = CfgGlobal.circularBorderRadius.large
      ..padding = const EdgeInsets.all(12),

    /// 颜色设置，不同类型结构相同，当前是 primary
    [
      [_button, '$_button$primarySuf']
    ]: BaseStyle(
      color: CfgGlobal.basicColor.shade50,
      backgroundColor: CfgGlobal.primaryColor,
      borderColor: CfgGlobal.primaryColor,
    ),
    [
      [_button, '$_button$primarySuf', focus],
      [_button, '$_button$primarySuf', hover],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.primaryColor.shade700,
      borderColor: CfgGlobal.primaryColor.shade700,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$primarySuf', isActive],
      [_button, '$_button$primarySuf', active],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.primaryColor.shade900,
      borderColor: CfgGlobal.primaryColor.shade900,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$primarySuf', isDisabled],
      [_button, '$_button$primarySuf', isDisabled, active],
      [_button, '$_button$primarySuf', isDisabled, focus],
      [_button, '$_button$primarySuf', isDisabled, hover],
    ]: BaseStyle(
      color: CfgGlobal.basicColor.shade50,
      backgroundColor: CfgGlobal.primaryColor.shade400,
      borderColor: CfgGlobal.primaryColor.shade400,
    ),
    [
      [_button, '$_button$primarySuf', isPlain]
    ]: BaseStyle(
      color: CfgGlobal.primaryColor,
      backgroundColor: CfgGlobal.primaryColor.shade50,
      borderColor: CfgGlobal.primaryColor.shade300,
    ),
    [
      [_button, '$_button$primarySuf', isPlain, focus],
      [_button, '$_button$primarySuf', isPlain, hover],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.primaryColor,
      borderColor: CfgGlobal.primaryColor,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$primarySuf', isPlain, active],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.primaryColor.shade900,
      borderColor: CfgGlobal.primaryColor.shade900,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$primarySuf', isPlain, isDisabled],
      [_button, '$_button$primarySuf', isPlain, isDisabled, active],
      [_button, '$_button$primarySuf', isPlain, isDisabled, focus],
      [_button, '$_button$primarySuf', isPlain, isDisabled, hover],
    ]: BaseStyle(
      color: CfgGlobal.primaryColor.shade500,
      backgroundColor: CfgGlobal.primaryColor.shade50,
      borderColor: CfgGlobal.primaryColor.shade100,
    ),

    /// 颜色设置，不同类型结构相同，当前是 success
    [
      [_button, '$_button$successSuf']
    ]: BaseStyle(
      color: CfgGlobal.basicColor.shade50,
      backgroundColor: CfgGlobal.successColor,
      borderColor: CfgGlobal.successColor,
    ),
    [
      [_button, '$_button$successSuf', focus],
      [_button, '$_button$successSuf', hover],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.successColor.shade700,
      borderColor: CfgGlobal.successColor.shade700,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$successSuf', isActive],
      [_button, '$_button$successSuf', active],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.successColor.shade900,
      borderColor: CfgGlobal.successColor.shade900,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$successSuf', isDisabled],
      [_button, '$_button$successSuf', isDisabled, active],
      [_button, '$_button$successSuf', isDisabled, focus],
      [_button, '$_button$successSuf', isDisabled, hover],
    ]: BaseStyle(
      color: CfgGlobal.basicColor.shade50,
      backgroundColor: CfgGlobal.successColor.shade400,
      borderColor: CfgGlobal.successColor.shade400,
    ),
    [
      [_button, '$_button$successSuf', isPlain]
    ]: BaseStyle(
      color: CfgGlobal.successColor,
      backgroundColor: CfgGlobal.successColor.shade50,
      borderColor: CfgGlobal.successColor.shade300,
    ),
    [
      [_button, '$_button$successSuf', isPlain, focus],
      [_button, '$_button$successSuf', isPlain, hover],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.successColor,
      borderColor: CfgGlobal.successColor,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$successSuf', isPlain, active],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.successColor.shade900,
      borderColor: CfgGlobal.successColor.shade900,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$successSuf', isPlain, isDisabled],
      [_button, '$_button$successSuf', isPlain, isDisabled, active],
      [_button, '$_button$successSuf', isPlain, isDisabled, focus],
      [_button, '$_button$successSuf', isPlain, isDisabled, hover],
    ]: BaseStyle(
      color: CfgGlobal.successColor.shade500,
      backgroundColor: CfgGlobal.successColor.shade50,
      borderColor: CfgGlobal.successColor.shade100,
    ),

    /// 颜色设置，不同类型结构相同，当前是 warning
    [
      [_button, '$_button$warningSuf']
    ]: BaseStyle(
      color: CfgGlobal.basicColor.shade50,
      backgroundColor: CfgGlobal.warningColor,
      borderColor: CfgGlobal.warningColor,
    ),
    [
      [_button, '$_button$warningSuf', focus],
      [_button, '$_button$warningSuf', hover],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.warningColor.shade700,
      borderColor: CfgGlobal.warningColor.shade700,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$warningSuf', isActive],
      [_button, '$_button$warningSuf', active],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.warningColor.shade900,
      borderColor: CfgGlobal.warningColor.shade900,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$warningSuf', isDisabled],
      [_button, '$_button$warningSuf', isDisabled, active],
      [_button, '$_button$warningSuf', isDisabled, focus],
      [_button, '$_button$warningSuf', isDisabled, hover],
    ]: BaseStyle(
      color: CfgGlobal.basicColor.shade50,
      backgroundColor: CfgGlobal.warningColor.shade400,
      borderColor: CfgGlobal.warningColor.shade400,
    ),
    [
      [_button, '$_button$warningSuf', isPlain]
    ]: BaseStyle(
      color: CfgGlobal.warningColor,
      backgroundColor: CfgGlobal.warningColor.shade50,
      borderColor: CfgGlobal.warningColor.shade300,
    ),
    [
      [_button, '$_button$warningSuf', isPlain, focus],
      [_button, '$_button$warningSuf', isPlain, hover],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.warningColor,
      borderColor: CfgGlobal.warningColor,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$warningSuf', isPlain, active],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.warningColor.shade900,
      borderColor: CfgGlobal.warningColor.shade900,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$warningSuf', isPlain, isDisabled],
      [_button, '$_button$warningSuf', isPlain, isDisabled, active],
      [_button, '$_button$warningSuf', isPlain, isDisabled, focus],
      [_button, '$_button$warningSuf', isPlain, isDisabled, hover],
    ]: BaseStyle(
      color: CfgGlobal.warningColor.shade500,
      backgroundColor: CfgGlobal.warningColor.shade50,
      borderColor: CfgGlobal.warningColor.shade100,
    ),

    /// 颜色设置，不同类型结构相同，当前是 danger
    [
      [_button, '$_button$dangerSuf']
    ]: BaseStyle(
      color: CfgGlobal.basicColor.shade50,
      backgroundColor: CfgGlobal.dangerColor,
      borderColor: CfgGlobal.dangerColor,
    ),
    [
      [_button, '$_button$dangerSuf', focus],
      [_button, '$_button$dangerSuf', hover],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.dangerColor.shade700,
      borderColor: CfgGlobal.dangerColor.shade700,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$dangerSuf', isActive],
      [_button, '$_button$dangerSuf', active],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.dangerColor.shade900,
      borderColor: CfgGlobal.dangerColor.shade900,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$dangerSuf', isDisabled],
      [_button, '$_button$dangerSuf', isDisabled, active],
      [_button, '$_button$dangerSuf', isDisabled, focus],
      [_button, '$_button$dangerSuf', isDisabled, hover],
    ]: BaseStyle(
      color: CfgGlobal.basicColor.shade50,
      backgroundColor: CfgGlobal.dangerColor.shade400,
      borderColor: CfgGlobal.dangerColor.shade400,
    ),
    [
      [_button, '$_button$dangerSuf', isPlain]
    ]: BaseStyle(
      color: CfgGlobal.dangerColor,
      backgroundColor: CfgGlobal.dangerColor.shade50,
      borderColor: CfgGlobal.dangerColor.shade300,
    ),
    [
      [_button, '$_button$dangerSuf', isPlain, focus],
      [_button, '$_button$dangerSuf', isPlain, hover],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.dangerColor,
      borderColor: CfgGlobal.dangerColor,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$dangerSuf', isPlain, active],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.dangerColor.shade900,
      borderColor: CfgGlobal.dangerColor.shade900,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$dangerSuf', isPlain, isDisabled],
      [_button, '$_button$dangerSuf', isPlain, isDisabled, active],
      [_button, '$_button$dangerSuf', isPlain, isDisabled, focus],
      [_button, '$_button$dangerSuf', isPlain, isDisabled, hover],
    ]: BaseStyle(
      color: CfgGlobal.dangerColor.shade500,
      backgroundColor: CfgGlobal.dangerColor.shade50,
      borderColor: CfgGlobal.dangerColor.shade100,
    ),

    /// 颜色设置，不同类型结构相同，当前是 info
    [
      [_button, '$_button$infoSuf']
    ]: BaseStyle(
      color: CfgGlobal.basicColor.shade50,
      backgroundColor: CfgGlobal.infoColor,
      borderColor: CfgGlobal.infoColor,
    ),
    [
      [_button, '$_button$infoSuf', focus],
      [_button, '$_button$infoSuf', hover],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.infoColor.shade700,
      borderColor: CfgGlobal.infoColor.shade700,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$infoSuf', isActive],
      [_button, '$_button$infoSuf', active],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.infoColor.shade900,
      borderColor: CfgGlobal.infoColor.shade900,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$infoSuf', isDisabled],
      [_button, '$_button$infoSuf', isDisabled, active],
      [_button, '$_button$infoSuf', isDisabled, focus],
      [_button, '$_button$infoSuf', isDisabled, hover],
    ]: BaseStyle(
      color: CfgGlobal.basicColor.shade50,
      backgroundColor: CfgGlobal.infoColor.shade400,
      borderColor: CfgGlobal.infoColor.shade400,
    ),
    [
      [_button, '$_button$infoSuf', isPlain]
    ]: BaseStyle(
      color: CfgGlobal.infoColor,
      backgroundColor: CfgGlobal.infoColor.shade50,
      borderColor: CfgGlobal.infoColor.shade300,
    ),
    [
      [_button, '$_button$infoSuf', isPlain, focus],
      [_button, '$_button$infoSuf', isPlain, hover],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.infoColor,
      borderColor: CfgGlobal.infoColor,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$infoSuf', isPlain, active],
    ]: BaseStyle(
      backgroundColor: CfgGlobal.infoColor.shade900,
      borderColor: CfgGlobal.infoColor.shade900,
      color: CfgGlobal.basicColor.shade50,
    ),
    [
      [_button, '$_button$infoSuf', isPlain, isDisabled],
      [_button, '$_button$infoSuf', isPlain, isDisabled, active],
      [_button, '$_button$infoSuf', isPlain, isDisabled, focus],
      [_button, '$_button$infoSuf', isPlain, isDisabled, hover],
    ]: BaseStyle(
      color: CfgGlobal.infoColor.shade500,
      backgroundColor: CfgGlobal.infoColor.shade50,
      borderColor: CfgGlobal.infoColor.shade100,
    ),

    /// 颜色设置，不同类型结构相同，当前是 text
    [
      [_button, '$_button$textSuf']
    ]: BaseStyle(
      borderColor: Colors.transparent,
      color: CfgGlobal.primaryColor,
      backgroundColor: Colors.transparent,
      paddingLeft: 0,
      paddingRight: 0,
    ),
    [
      [_button, '$_button$textSuf', focus],
      [_button, '$_button$textSuf', hover],
    ]: BaseStyle(
      color: CfgGlobal.primaryColor.shade700,
      borderColor: Colors.transparent,
      backgroundColor: Colors.transparent,
    ),
    [
      [_button, '$_button$textSuf', isActive],
      [_button, '$_button$textSuf', active],
    ]: BaseStyle(
      backgroundColor: Colors.transparent,
      color: CfgGlobal.primaryColor.shade900,
    ),
    [
      [_button, '$_button$textSuf', isDisabled],
      [_button, '$_button$textSuf', isDisabled, active],
      [_button, '$_button$textSuf', isDisabled, focus],
      [_button, '$_button$textSuf', isDisabled, hover],
    ]: BaseStyle(
      color: CfgGlobal.textColor.shade500,
      borderColor: Colors.transparent,
    ),

    /// 尺寸设置区
    [
      [_button, '$_button$mediumSuf']
    ]: BaseStyle(
      padding: CfgGlobal.padding.medium,
      fontSize: CfgGlobal.fontSize.small,
      borderRadius: CfgGlobal.circularBorderRadius.small,
    ),
    [
      [_button, '$_button$mediumSuf', isRound]
    ]: BaseStyle(
      padding: CfgGlobal.roundPadding.medium,
    ),
    [
      [_button, '$_button$mediumSuf', isCircle]
    ]: BaseStyle(
      padding: CfgGlobal.circlePadding.medium,
    ),
    [
      [_button, '$_button$smallSuf']
    ]: BaseStyle(
      padding: CfgGlobal.padding.small,
      fontSize: CfgGlobal.fontSize.mini,
      borderRadius: CfgGlobal.circularBorderRadius.small,
    ),
    [
      [_button, '$_button$smallSuf', isRound]
    ]: BaseStyle(
      padding: CfgGlobal.roundPadding.small,
    ),
    [
      [_button, '$_button$smallSuf', isCircle]
    ]: BaseStyle(
      padding: CfgGlobal.circlePadding.small,
    ),
    [
      [_button, '$_button$miniSuf']
    ]: BaseStyle(
      padding: CfgGlobal.padding.mini,
      fontSize: CfgGlobal.fontSize.mini,
      borderRadius: CfgGlobal.circularBorderRadius.mini,
    ),
    [
      [_button, '$_button$miniSuf', isRound]
    ]: BaseStyle(
      padding: CfgGlobal.roundPadding.mini,
    ),
    [
      [_button, '$_button$miniSuf', isCircle]
    ]: BaseStyle(
      padding: CfgGlobal.circlePadding.mini,
    ),

    // .el-button-group
    [
      [_buttonGroup, _button, firstChild],
    ]: BaseStyle(
      borderTopRightRadius: Radius.zero,
      borderBottomRightRadius: Radius.zero,
    ),
    [
      [_buttonGroup, _button, lastChild],
    ]: BaseStyle(
      borderTopLeftRadius: Radius.zero,
      borderBottomLeftRadius: Radius.zero,
    ),
    [
      [_buttonGroup, _button, firstChild, lastChild],
    ]: BaseStyle(
      borderRadius: CfgGlobal.circularBorderRadius.small,
    ),
    [
      [_buttonGroup, _button, firstChild, lastChild, isRound],
    ]: BaseStyle(
      borderRadius: CfgGlobal.circularBorderRadius,
    ),
    [
      [_buttonGroup, _button, firstChild, lastChild, isCircle],
    ]: BaseStyle(
      borderRadius: CfgGlobal.circularBorderRadius.large,
    ),
    [
      [_buttonGroup, _button, '${not(firstChild)}${not(lastChild)}']
    ]: BaseStyle(
      borderRadius: BorderRadius.zero,
    )
  };

  // .el-button
  cfgGlobal.button = WButtonStyle();

  cfgGlobal.button.type = (WButton btn) {
    var selector = [
      if (btn.$props.inGroup) _buttonGroup,
      _button,
      if (btn.$props.type != null) '$_button--${btn.$props.type}',
      '$_button--${btn.$props.size}',
      if (btn.$props.plain) isPlain,
      if (btn.active) ...[isActive, active],
      if (btn.focus) focus,
      if (btn.isHover) hover,
      if (btn.$props.loading) isLoading,
      if (btn.$props.circle) isCircle,
      if (btn.$props.round) isRound,
      if (btn.$props.disabled) isDisabled,
      if (btn.$props.isFirst) firstChild,
      if (btn.$props.isLast) lastChild,
      if (btn.$props.inGroup && (!btn.$props.isFirst && !btn.$props.isLast))
        '${not(firstChild)}${not(lastChild)}',
    ];

    List<BaseStyle?> styles =
        findByListKey<BaseStyle?>(CfgGlobal.css, selector);
    print(styles);
    for (var style in styles) {
      btn.style.merge(style, force: true);
    }
    print(btn.style);
    btn.style.border = Border.fromBorderSide(BorderSide(
      color: btn.style.borderColor ?? Colors.white,
      width: btn.style.borderWidth,
    ));
  };
}
