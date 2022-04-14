import 'package:flutter/material.dart';
import 'package:wao_ui/core/utils/color_util.dart';

import '../wao_ui.dart';
import 'base_style.dart';
import 'swatch/size_swatch.dart';

not(String str) {
  return ':not($str)';
}

element() {
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

  var _button = Clazz.button = '.el-button';
  var _buttonGroup = Clazz.button = '.el-button-group';

  var _avatar = Clazz.avatar = '.el-avatar';
  var _decriptions = Clazz.decriptions = '.el-decriptions';
  var _empty = Clazz.empty = '.el-empty';
  var _pagination = Clazz.pagination = '.el-pagination';
  var _progress = Clazz.progress = '.el-progress';
  var _result = Clazz.result = '.el-result';
  var _skeleton = Clazz.skeleton = '.el-skeleton';
  var _table = Clazz.table = '.el-table';
  var _tag = Clazz.tag = '.el-tag';
  var _tree = Clazz.tree = '.el-tree';
  var _cascader = Clazz.cascader = '.el-cascader';
  var _checkbox = Clazz.checkbox = '.el-checkbox';
  var _colorPicker = Clazz.colorPicker = '.el-color-picker';
  var _datePicker = Clazz.datePicker = '.el-date-picker';
  var _dateTimePicker = Clazz.dateTimePicker = '.el-date-time-picker';
  var _inputNumber = Clazz.inputNumber = '.el-input-number';
  var _input = Clazz.input = '.el-input';
  var _radio = Clazz.radio = '.el-radio';
  var _rate = Clazz.rate = '.el-rate';
  var _select = Clazz.select = '.el-select';
  var _slider = Clazz.slider = '.el-slider';
  var _swatch = Clazz.swatch = '.el-swatch';
  var _timePicker = Clazz.timePicker = '.el-time-picker';
  var _transfer = Clazz.transfer = '.el-transfer';
  var _upload = Clazz.upload = '.el-upload';
  var _breadcrumb = Clazz.breadcrumb = '.el-breadcrumb';
  var _dropdown = Clazz.dropdown = '.el-dropdown';
  var _menu = Clazz.menu = '.el-menu';
  var _submenu = Clazz.submenu = '.el-submenu';
  var _menuItemGroup = Clazz.menuItemGroup = '.el-menu-item-group';
  var _menuItem = Clazz.menuItem = '.el-menu-item';
  var _pageHeader = Clazz.pageHeader = '.el-page-header';
  var _steps = Clazz.steps = '.el-steps';
  var _tabs = Clazz.tabs = '.el-tabs';
  var _alert = Clazz.alert = '.el-alert';
  var _loading = Clazz.loading = '.el-loading';
  var _message = Clazz.message = '.el-message';
  var _messageBox = Clazz.messageBox = '.el-message-box';
  var _notification = Clazz.notification = '.el-notification';
  var _backtop = Clazz.backtop = '.el-backtop';
  var _calendar = Clazz.calendar = '.el-calendar';
  var _card = Clazz.card = '.el-card';
  var _carousel = Clazz.carousel = '.el-carousel';
  var _collapse = Clazz.collapse = '.el-collapse';
  var _dialog = Clazz.dialog = '.el-dialog';
  var _divider = Clazz.divider = '.el-divider';
  var _drawer = Clazz.drawer = '.el-drawer';
  var _image = Clazz.image = '.el-image';
  var _infiniteScroll = Clazz.infiniteScroll = '.el-infinite-scroll';
  var _popconfirm = Clazz.popconfirm = '.el-popconfirm';
  var _popover = Clazz.popover = '.el-popover';
  var _timeline = Clazz.timeline = '.el-timeline';
  var _tooltip = Clazz.tooltip = '.el-tooltip';
  var _form = Clazz.form = '.el-form';
  var _container = Clazz.container = '.el-container';
  var _main = Clazz.main = '.el-main';
  var _aside = Clazz.aside = '.el-aside';
  var _header = Clazz.header = '.el-header';
  var _footer = Clazz.footer = '.el-footer';

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
      200: Color(0xFFd0eac4),
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
      200: Color(0xFFfab6b6),
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
      200: Color(0xFFd3d4d6),
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
      200: Color(0xFFd3d4d6),
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
      200: Color(0xFFEFEDF0),
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
      'medium': 40,
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
      [Clazz.pagination]
    ]: BaseStyle()
      ..padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 2)
      ..color = CfgGlobal.textColor
      ..fontWeight = FontWeight.w700,

    [
      [Clazz.pagination, Clazz.select, Clazz.input]
    ]: BaseStyle()
      ..width = 100
      ..margin = const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 5,
      ),

    [
      [_button]
    ]: BaseStyle()
      ..cursor = SystemMouseCursors.click
      ..backgroundColor = Colors.white
      ..borderColor = CfgGlobal.textColor.shade400
      ..color = CfgGlobal.textColor.shade700
      ..textAlign = Alignment.center
      ..margin = EdgeInsets.zero
      ..fontWeight = FontWeight.w500
      ..padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 20)
      ..fontSize = 14
      ..borderWidth = 1
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
    )..borderRadius = CfgGlobal.circularBorderRadius.large,
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
    ),
    // descriptions
    [
      [_decriptions]
    ]: WDescriptionsStyle()
      ..fontSize = 14
      ..color = CfgGlobal.textColor
      ..header = (BaseStyle()
        ..alignItems = Alignment.center
        ..marginBottom = 20)
      ..title = (BaseStyle()
        ..fontSize = 16
        ..fontWeight = FontWeight.w700)
      ..body = (BaseStyle()
        ..color = ColorUtil.hexToColor('#606266')
        ..backgroundColor = Colors.white
        ..widthFactor = 1),
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

    [
      [_avatar]
    ]: BaseStyle()
      ..textAlign = Alignment.center
      ..color = CfgGlobal.basicColor.shade50
      ..backgroundColor = CfgGlobal.basicColor.shade500
      ..width = 40
      ..height = 40
      ..maxWidth = 40
      ..fontSize = 14,
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

    // WMenu
    [
      [_menu]
    ]: BaseStyle()
      ..borderRightWidth = 1
      ..borderRightColor = const Color(0xFFE6E6E6)
      ..margin = EdgeInsets.zero
      ..paddingLeft = 0.0
      ..backgroundColor = Colors.white,
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
      ..textAlign = Alignment.centerLeft
      ..padding = EdgeInsets.zero,

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
      ..borderBottomColor = Colors.transparent
      ..borderBottomColor = CfgGlobal.textColor.shade600,
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
      ..height = 36
      ..lineHeight = 36
      ..padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 0)
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
      ..padding = const EdgeInsets.symmetric(horizontal: 0, vertical: 20)
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
      ..padding = const EdgeInsets.symmetric(horizontal: 0, vertical: 45)
      ..minWidth = 200,

    [
      [_submenu, iconArrowSuf]
    ]: BaseStyle()
      ..padding = const EdgeInsets.only(right: 20)
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
      ..padding = const EdgeInsets.fromLTRB(20, 7, 0, 7)
      ..fontSize = 12
      ..color = CfgGlobal.textColor.shade600
  };

  // .el-button
  cfgGlobal.button = WButtonStyle();

  CfgGlobal.selectors = {
    'WButton': (btn) {
      btn as WButton;
      return [
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
    },
    'WContainerLayout': (cpn) {
      cpn as WContainerLayout;
      return [Clazz.containerLayout];
    },
    'WContainer': (cpn) {
      cpn as WContainer;
      return [Clazz.container];
    },
    'WMain': (cpn) {
      cpn as WMain;
      return [Clazz.main];
    },
    'WAside': (cpn) {
      cpn as WAside;
      return [Clazz.aside];
    },
    'WHeader': (cpn) {
      cpn as WHeader;
      return [Clazz.header];
    },
    'WFooter': (cpn) {
      cpn as WFooter;
      return [Clazz.footer];
    },
    'WAvatar': (cpn) {
      cpn as WAvatar;
      return [
        _avatar,
        if (cpn.$props.isCircle) '$_avatar${Clazz.circleSuf}',
        if (cpn.$props.isSquare) '$_avatar$squareSuf',
        if (cpn.$props.icon != null) '$_avatar$iconSuf',
        '$_avatar--${cpn.$props.size}',
      ];
    },
    'WBadge': (cpn) {
      cpn as WBadge;
      return [Clazz.badge];
    },
    'WDescriptions': (cpn) {
      cpn as WDescriptions;
      return [Clazz.decriptions];
    },
    'WEmpty': (cpn) {
      cpn as WEmpty;
      return [Clazz.empty];
    },
    'WPagination': (cpn) {
      cpn as WPagination;
      return [Clazz.pagination];
    },
    'WProgress': (cpn) {
      cpn as WProgress;
      return [Clazz.progress];
    },
    'WResult': (cpn) {
      cpn as WResult;
      return [Clazz.result];
    },
    'WSkeleton': (cpn) {
      cpn as WSkeleton;
      return [Clazz.skeleton];
    },
    'WTable': (cpn) {
      cpn as WTable;
      return [Clazz.table];
    },
    'WTag': (cpn) {
      cpn as WTag;
      return [Clazz.tag];
    },
    'WTree': (cpn) {
      cpn as WTree;
      return [Clazz.tree];
    },
    'WCascader': (cpn) {
      cpn as WCascader;
      return [Clazz.cascader];
    },
    'WCheckbox': (cpn) {
      cpn as WCheckbox;
      return [Clazz.checkbox];
    },
    'WColorPicker': (cpn) {
      cpn as WColorPicker;
      return [Clazz.colorPicker];
    },
    'WDatePicker': (cpn) {
      cpn as WDatePicker;
      return [Clazz.datePicker];
    },
    'WDateTimePicker': (cpn) {
      cpn as WDateTimePicker;
      return [Clazz.dateTimePicker];
    },
    'WInputNumber': (cpn) {
      cpn as WInputNumber;
      return [Clazz.inputNumber];
    },
    'WInput': (cpn) {
      cpn as WInput;
      return [Clazz.input];
    },
    'WRadio': (cpn) {
      cpn as WRadio;
      return [Clazz.radio];
    },
    'WRate': (cpn) {
      cpn as WRate;
      return [Clazz.rate];
    },
    'WSelect': (cpn) {
      cpn as WSelect;
      return [Clazz.select];
    },
    'WSlider': (cpn) {
      cpn as WSlider;
      return [Clazz.slider];
    },
    'WSwitch': (cpn) {
      cpn as WSwitch;
      return [Clazz.swatch];
    },
    'WTimePicker': (cpn) {
      cpn as WTimePicker;
      return [Clazz.timePicker];
    },
    'WTransfer': (cpn) {
      cpn as WTransfer;
      return [Clazz.transfer];
    },
    'WUpload': (cpn) {
      cpn as WUpload;
      return [Clazz.upload];
    },
    'WBreadcrumb': (cpn) {
      cpn as WBreadcrumb;
      return [Clazz.breadcrumb];
    },
    'WDropdown': (cpn) {
      cpn as WDropdown;
      return [Clazz.dropdown];
    },
    // 'WMenu': (cpn) {
    //   cpn as WMenu;
    //   return [
    //     _menu,
    //     if (cpn.$props.collapse) '$_menu$isCollapse',
    //     if (cpn.$props.modeIsVertical) '$_menu$verticalSuf',
    //     if (cpn.$props.modeIsHorizontal) horizontalSuf,
    //   ];
    // },
    // 'WMenuItem': (cpn) {
    //   cpn as WMenuItem;
    //   return [
    //     if (cpn.rootMenu != null) ...cpn.rootMenu!.selector,
    //     _menuItem,
    //   ];
    // },
    'WPageHeader': (cpn) {
      cpn as WPageHeader;
      return [Clazz.pageHeader];
    },
    'WSteps': (cpn) {
      cpn as WSteps;
      return [Clazz.steps];
    },
    'WTabs': (cpn) {
      cpn as WTabs;
      return [Clazz.tabs];
    },
    'WAlert': (cpn) {
      cpn as WAlert;
      return [Clazz.alert];
    },
    'WLoading': (cpn) {
      cpn as WLoading;
      return [Clazz.loading];
    },
    'WMessage': (cpn) {
      cpn as WMessage;
      return [Clazz.message];
    },
    'WMessageBox': (cpn) {
      cpn as WMessageBox;
      return [Clazz.messageBox];
    },
    'WNotification': (cpn) {
      cpn as WNotification;
      return [Clazz.notification];
    },
    'WBacktop': (cpn) {
      cpn as WBacktop;
      return [Clazz.backtop];
    },
    'WCalendar': (cpn) {
      cpn as WCalendar;
      return [Clazz.cascader];
    },
    'WCard': (cpn) {
      cpn as WCard;
      return [Clazz.card];
    },
    'WCarousel': (cpn) {
      cpn as WCarousel;
      return [Clazz.carousel];
    },
    'WCollapse': (cpn) {
      cpn as WCollapse;
      return [Clazz.collapse];
    },
    'WDialog': (cpn) {
      cpn as WDialog;
      return [Clazz.dialog];
    },
    'WDivider': (cpn) {
      cpn as WDivider;
      return [Clazz.divider];
    },
    'WDrawer': (cpn) {
      cpn as WDrawer;
      return [Clazz.drawer];
    },
    'WImage': (cpn) {
      cpn as WImage;
      return [Clazz.image];
    },
    'WInfiniteScroll': (cpn) {
      cpn as WInfiniteScroll;
      return [Clazz.infiniteScroll];
    },
    'WPopconfirm': (cpn) {
      cpn as WPopconfirm;
      return [Clazz.popconfirm];
    },
    'WPopover': (cpn) {
      cpn as WPopover;
      return [Clazz.popover];
    },
    'WTimeline': (cpn) {
      cpn as WTimeline;
      return [Clazz.timeline];
    },
    'WTooltip': (cpn) {
      cpn as WTooltip;
      return [Clazz.tooltip];
    },
    'WForm': (cpn) {
      cpn as WForm;
      return [Clazz.form];
    },
  };
}
