import 'package:flutter/material.dart';
import 'package:wao_ui/core/theme/element/badge_css.dart';
import 'package:wao_ui/core/theme/element/container_css.dart';
import 'package:wao_ui/core/theme/element/input_number_css.dart';
import 'package:wao_ui/core/theme/element/pagination_css.dart';
import 'package:wao_ui/core/theme/element/radio_css.dart';
import 'package:wao_ui/core/theme/element/result_css.dart';
import 'package:wao_ui/core/utils/color_util.dart';

import '../../../wao_ui.dart';
import '../../base_style.dart';
import '../../swatch/size_swatch.dart';
import 'avatar_css.dart';
import 'button_css.dart';
import 'decriptions_css.dart';
import 'menu_css.dart';

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

  var _empty = Clazz.empty = '.el-empty';
  var _progress = Clazz.progress = '.el-progress';
  var _skeleton = Clazz.skeleton = '.el-skeleton';
  var _table = Clazz.table = '.el-table';
  var _tag = Clazz.tag = '.el-tag';
  var _tree = Clazz.tree = '.el-tree';
  var _cascader = Clazz.cascader = '.el-cascader';
  var _containerLayout = Clazz.containerLayout = '.el-cascader-layout';
  var _checkbox = Clazz.checkbox = '.el-checkbox';
  var _colorPicker = Clazz.colorPicker = '.el-color-picker';
  var _datePicker = Clazz.datePicker = '.el-date-picker';
  var _dateTimePicker = Clazz.dateTimePicker = '.el-date-time-picker';
  var _input = Clazz.input = '.el-input';
  var _rate = Clazz.rate = '.el-rate';
  var _select = Clazz.select = '.el-select';
  var _slider = Clazz.slider = '.el-slider';
  var _swatch = Clazz.swatch = '.el-swatch';
  var _timePicker = Clazz.timePicker = '.el-time-picker';
  var _transfer = Clazz.transfer = '.el-transfer';
  var _upload = Clazz.upload = '.el-upload';
  var _breadcrumb = Clazz.breadcrumb = '.el-breadcrumb';
  var _dropdown = Clazz.dropdown = '.el-dropdown';
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

  CfgGlobal.css = {};

  // .el-button
  cfgGlobal.button = WButtonStyle();

  CfgGlobal.selectors = {
    'WContainerLayout': (cpn) {
      cpn as WContainerLayout;
      return [_containerLayout];
    },
    'WEmpty': (cpn) {
      cpn as WEmpty;
      return [_empty];
    },
    'WProgress': (cpn) {
      cpn as WProgress;
      return [_progress];
    },
    'WSkeleton': (cpn) {
      cpn as WSkeleton;
      return [_skeleton];
    },
    'WTable': (cpn) {
      cpn as WTable;
      return [_table];
    },
    'WTag': (cpn) {
      cpn as WTag;
      return [_tag];
    },
    'WTree': (cpn) {
      cpn as WTree;
      return [_tree];
    },
    'WCascader': (cpn) {
      cpn as WCascader;
      return [_cascader];
    },
    'WCheckbox': (cpn) {
      cpn as WCheckbox;
      return [_checkbox];
    },
    'WColorPicker': (cpn) {
      cpn as WColorPicker;
      return [_colorPicker];
    },
    'WDatePicker': (cpn) {
      cpn as WDatePicker;
      return [_datePicker];
    },
    'WDateTimePicker': (cpn) {
      cpn as WDateTimePicker;
      return [_dateTimePicker];
    },
    'WInput': (cpn) {
      cpn as WInput;
      return [_input];
    },
    'WRate': (cpn) {
      cpn as WRate;
      return [_rate];
    },
    'WSelect': (cpn) {
      cpn as WSelect;
      return [_select];
    },
    'WSlider': (cpn) {
      cpn as WSlider;
      return [_slider];
    },
    'WSwitch': (cpn) {
      cpn as WSwitch;
      return [_swatch];
    },
    'WTimePicker': (cpn) {
      cpn as WTimePicker;
      return [_timePicker];
    },
    'WTransfer': (cpn) {
      cpn as WTransfer;
      return [_transfer];
    },
    'WUpload': (cpn) {
      cpn as WUpload;
      return [_upload];
    },
    'WBreadcrumb': (cpn) {
      cpn as WBreadcrumb;
      return [_breadcrumb];
    },
    'WDropdown': (cpn) {
      cpn as WDropdown;
      return [_dropdown];
    },
    'WPageHeader': (cpn) {
      cpn as WPageHeader;
      return [_pageHeader];
    },
    'WSteps': (cpn) {
      cpn as WSteps;
      return [_steps];
    },
    'WTabs': (cpn) {
      cpn as WTabs;
      return [_tabs];
    },
    'WAlert': (cpn) {
      cpn as WAlert;
      return [_alert];
    },
    'WLoading': (cpn) {
      cpn as WLoading;
      return [_loading];
    },
    'WMessage': (cpn) {
      cpn as WMessage;
      return [_message];
    },
    'WMessageBox': (cpn) {
      cpn as WMessageBox;
      return [_messageBox];
    },
    'WNotification': (cpn) {
      cpn as WNotification;
      return [_notification];
    },
    'WBacktop': (cpn) {
      cpn as WBacktop;
      return [_backtop];
    },
    'WCalendar': (cpn) {
      cpn as WCalendar;
      return [_cascader];
    },
    'WCard': (cpn) {
      cpn as WCard;
      return [_card];
    },
    'WCarousel': (cpn) {
      cpn as WCarousel;
      return [_carousel];
    },
    'WCollapse': (cpn) {
      cpn as WCollapse;
      return [_collapse];
    },
    'WDialog': (cpn) {
      cpn as WDialog;
      return [_dialog];
    },
    'WDivider': (cpn) {
      cpn as WDivider;
      return [_divider];
    },
    'WDrawer': (cpn) {
      cpn as WDrawer;
      return [_drawer];
    },
    'WImage': (cpn) {
      cpn as WImage;
      return [_image];
    },
    'WInfiniteScroll': (cpn) {
      cpn as WInfiniteScroll;
      return [_infiniteScroll];
    },
    'WPopconfirm': (cpn) {
      cpn as WPopconfirm;
      return [_popconfirm];
    },
    'WPopover': (cpn) {
      cpn as WPopover;
      return [_popover];
    },
    'WTimeline': (cpn) {
      cpn as WTimeline;
      return [_timeline];
    },
    'WTooltip': (cpn) {
      cpn as WTooltip;
      return [_tooltip];
    },
    'WForm': (cpn) {
      cpn as WForm;
      return [_form];
    },
  };
  avatar();
  badge();
  button();
  container();
  decriptions();
  inputNumber();
  menu();
  pagination();
  radio();
  result();
}
