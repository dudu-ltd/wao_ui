// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_style.dart';
import 'package:wao_ui/core/utils/color_util.dart';

import 'w_button.dart';

CfgGlobal cfgGlobal = CfgGlobal();

typedef StyleWrap<W> = void Function(W);

class CfgGlobal {
  // static MaterialColor primaryColor = Colors.deepPurple;
  static MaterialColor primaryColor = Colors.blue;
  static MaterialColor successColor = Colors.lightGreen;
  static MaterialColor warningColor = Colors.orange;
  static MaterialColor dangerColor = Colors.red;
  static MaterialColor infoColor = Colors.grey;
  static MaterialColor textColor = Colors.blue;
  static MaterialColor disabledColor = Colors.grey;
  static Color blankColor = const MaterialColor(
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

  static MaterialColor color(String? k) {
    return k == 'primary'
        ? CfgGlobal.primaryColor
        : k == 'success'
            ? CfgGlobal.successColor
            : k == 'warning'
                ? CfgGlobal.warningColor
                : k == 'danger' || k == 'exception' || k == 'error'
                    ? CfgGlobal.dangerColor
                    : k == 'info'
                        ? CfgGlobal.infoColor
                        : CfgGlobal.textColor;
  }

  static Duration duration = const Duration(milliseconds: 300);

  WFont font = WFont();
  WBorder border = WBorder();
  WBorderRadius borderRadius = WBorderRadius();
  WBorderStyle borderStyle = WBorderStyle();
  WPadding padding = WPadding();
  WAvatarSize avatarSize = WAvatarSize();

  WBadgeFont badgeFont = WBadgeFont();

  WBreadcrumbStyle breadcrumb = WBreadcrumbStyle(
    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
  );

  WDescriptionsStyle descriptions = WDescriptionsStyle(
    padding: const EdgeInsets.fromLTRB(3, 2, 3, 2),
  );

  WEmptyStyle empty = WEmptyStyle();

  WPaginationStyle pagination = WPaginationStyle();

  WButtonStyle button = WButtonStyle();

  WProgressStyle progress = WProgressStyle();

  WResultStyle result = WResultStyle();

  WTableStyle table = WTableStyle();

  WRadioStyle radio = WRadioStyle();

  WCheckboxStyle checkbox = WCheckboxStyle();

  WInputStyle input = WInputStyle();

  WDrawerStyle drawer = WDrawerStyle();

  WSelectStyle select = WSelectStyle(
    width: 240,
    panelBorder: 1,
    panelHeight: 274.0,
    panelMaxWidth: 240.0,
    panelMinWidth: 180.0,
    panelOffset: 8.0,
    noDataTextColor: Colors.grey.shade600,
  );

  WCascaderStyle cascader = WCascaderStyle();

  WCascaderPanelStyle cascaderPanel = WCascaderPanelStyle(
    cascaderMenu: WCascaderMenuStyle(
      minWidth: 180,
      maxWidth: 275,
      borderColor: Colors.grey.shade200,
    ),
  );

  WCascaderMenuStyle cascaderMenu = WCascaderMenuStyle();

  WOptionStyle option = WOptionStyle(
    disabledColor: Colors.grey.shade400,
  );

  WSliderStyle slider = WSliderStyle(
      // thumbColor: Color.fromARGB(100, 37, 211, 98),
      // height: 30,
      // valueRadiusOuter: 40,
      // valueRadiusInner: 32,
      );

  WSwitchStyle wSwitch = WSwitchStyle();

  WUploadStyle upload = WUploadStyle();

  WCardStyle card = WCardStyle(
    padding: const EdgeInsets.all(14),
  );

  WCarouselStyle carousel = WCarouselStyle();

  WMenuStyle menu = WMenuStyle();
  WTabsStyle tabs = WTabsStyle();
  WSubmenuStyle submenu = WSubmenuStyle();
  WMenuItemStyle menuItem = WMenuItemStyle();
  WMenuItemGroupStyle menuItemGroup = WMenuItemGroupStyle();

  CfgGlobal._privateConstrucor();

  static final CfgGlobal _instance = CfgGlobal._privateConstrucor();

  factory CfgGlobal() {
    return _instance;
  }
}

class WFont {
  double mini = 12.0;
  double small = 13.0;
  double medium = 14.0;

  double val(String? k) {
    return k == 'mini'
        ? mini
        : k == 'small'
            ? small
            : medium;
  }
}

class WBorderStyle {
  double solid = 1.0;
  double dashed = 2.0;

  WBorderStyle._privateConstrucor();
  static final WBorderStyle _instance = WBorderStyle._privateConstrucor();
  factory WBorderStyle() {
    return _instance;
  }

  double val(String? k) {
    return k == 'solid'
        ? solid
        : k == 'dashed'
            ? dashed
            : solid;
  }
}

class WBorder {
  static BorderSide common =
      BorderSide(color: CfgGlobal.infoColor.shade300, width: 1);

  static Border excludeLeft = Border(
    top: WBorder.common,
    bottom: WBorder.common,
    right: WBorder.common,
  );

  static Border excludeRight = Border(
    top: WBorder.common,
    bottom: WBorder.common,
    left: WBorder.common,
  );

  static Border excludeTop = Border(
    left: WBorder.common,
    bottom: WBorder.common,
    right: WBorder.common,
  );

  static Border excludeBottom = Border(
    top: WBorder.common,
    left: WBorder.common,
    right: WBorder.common,
  );

  var m = {
    'left': 'right',
    'right': 'left',
    'top': 'bottom',
    'bottom': 'top',
  };
  Border excludeReverse(String side) {
    return exclude(m[side]);
  }

  Border exclude(String? side) {
    switch (side) {
      case 'left':
        return excludeLeft;
      case 'right':
        return excludeRight;
      case 'top':
        return excludeTop;
      case 'bottom':
        return excludeBottom;
      default:
        throw Exception('[$side] is not be support for border exclude');
    }
  }

  static Border all(String? k, [String? type]) {
    double radius = cfgGlobal.borderStyle.val(k);
    return Border.all(width: .5, color: CfgGlobal.color(type).shade200);
  }
}

class WBorderRadius {
  double none = 0.0;
  double mini = 2.0;
  double small = 3.0;
  double medium = 4.0;
  double large = 5.0;
  double circle = 30.0;
  double round = 30.0;

  WBorderRadius._privateConstrucor();
  static final WBorderRadius _instance = WBorderRadius._privateConstrucor();
  factory WBorderRadius() {
    return _instance;
  }

  double val(String? k) {
    return k == 'none'
        ? none
        : k == 'mini'
            ? mini
            : k == 'small'
                ? small
                : k == 'medium'
                    ? medium
                    : k == 'large'
                        ? large
                        : k == 'round'
                            ? round
                            : small;
  }
}

class WBadgeFont {
  double size = 10;
  WBadgeFont._privateConstrucor();
  static final WBadgeFont _instance = WBadgeFont._privateConstrucor();
  factory WBadgeFont() {
    return _instance;
  }
}

class WAvatarSize {
  double large = 40;
  double medium = 36;
  double small = 28;

  WAvatarSize._privateConstrucor();
  static final WAvatarSize _instance = WAvatarSize._privateConstrucor();
  factory WAvatarSize() {
    return _instance;
  }

  double val(String k) {
    return k == 'large'
        ? large
        : k == 'medium'
            ? medium
            : k == 'small'
                ? small
                : medium;
  }
}

class WPadding {
  double none = 0.0;
  double mini = 2.0;
  double small = 4.0;
  double medium = 6.0;
  double large = 8.0;

  WPadding._privateConstrucor();
  static final WPadding _instance = WPadding._privateConstrucor();
  factory WPadding() {
    return _instance;
  }

  double val(String? k) {
    return k == 'none'
        ? none
        : k == 'mini'
            ? mini
            : k == 'small'
                ? small
                : k == 'medium'
                    ? medium
                    : k == 'large'
                        ? large
                        : none;
  }
}

class WBreadcrumbStyle extends BaseStyle {
  WBreadcrumbStyle({EdgeInsets? padding}) : super(padding: padding);
}

class WDescriptionsStyle extends BaseStyle {
  double labelWidth = 80;
  Color labelColor = Colors.grey.shade100;

  double borderWidth = 1.0;

  WDescriptionsStyle({
    EdgeInsets? padding,
    Color? borderColor,
  }) : super(
          padding: padding,
          borderColor: borderColor ?? Colors.grey.shade300,
        );
}

class WEmptyStyle extends BaseStyle {
  double imageSize = 160;
  EdgeInsets descriptionPadding = const EdgeInsets.all(8);
  Color descriptionColor = Colors.grey.shade500;
  String imgSvg =
      r'<svg viewBox="0 0 79 86" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><linearGradient id="linearGradient-1-3" x1="38.8503086%" y1="0%" x2="61.1496914%" y2="100%"><stop stop-color="#FCFCFD" offset="0%"></stop><stop stop-color="#EEEFF3" offset="100%"></stop></linearGradient><linearGradient id="linearGradient-2-3" x1="0%" y1="9.5%" x2="100%" y2="90.5%"><stop stop-color="#FCFCFD" offset="0%"></stop><stop stop-color="#E9EBEF" offset="100%"></stop></linearGradient><rect id="path-3-3" x="0" y="0" width="17" height="36"></rect></defs><g id="Illustrations" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g id="B-type" transform="translate(-1268.000000, -535.000000)"><g id="Group-2" transform="translate(1268.000000, 535.000000)"><path id="Oval-Copy-2" d="M39.5,86 C61.3152476,86 79,83.9106622 79,81.3333333 C79,78.7560045 57.3152476,78 35.5,78 C13.6847524,78 0,78.7560045 0,81.3333333 C0,83.9106622 17.6847524,86 39.5,86 Z" fill="#F7F8FC"></path><polygon id="Rectangle-Copy-14" fill="#E5E7E9" transform="translate(27.500000, 51.500000) scale(1, -1) translate(-27.500000, -51.500000) " points="13 58 53 58 42 45 2 45"></polygon><g id="Group-Copy" transform="translate(34.500000, 31.500000) scale(-1, 1) rotate(-25.000000) translate(-34.500000, -31.500000) translate(7.000000, 10.000000)"><polygon id="Rectangle-Copy-10" fill="#E5E7E9" transform="translate(11.500000, 5.000000) scale(1, -1) translate(-11.500000, -5.000000) " points="2.84078316e-14 3 18 3 23 7 5 7"></polygon><polygon id="Rectangle-Copy-11" fill="#EDEEF2" points="-3.69149156e-15 7 38 7 38 43 -3.69149156e-15 43"></polygon><rect id="Rectangle-Copy-12" fill="url(#linearGradient-1-3)" transform="translate(46.500000, 25.000000) scale(-1, 1) translate(-46.500000, -25.000000) " x="38" y="7" width="17" height="36"></rect><polygon id="Rectangle-Copy-13" fill="#F8F9FB" transform="translate(39.500000, 3.500000) scale(-1, 1) translate(-39.500000, -3.500000) " points="24 7 41 7 55 -3.63806207e-12 38 -3.63806207e-12"></polygon></g><rect id="Rectangle-Copy-15" fill="url(#linearGradient-2-3)" x="13" y="45" width="40" height="36"></rect><g id="Rectangle-Copy-17" transform="translate(53.000000, 45.000000)"><mask id="mask-4-3" fill="white"><use xlink:href="#path-3-3"></use></mask><use id="Mask" fill="#E0E3E9" transform="translate(8.500000, 18.000000) scale(-1, 1) translate(-8.500000, -18.000000) " xlink:href="#path-3-3"></use><polygon id="Rectangle-Copy" fill="#D5D7DE" mask="url(#mask-4-3)" transform="translate(12.000000, 9.000000) scale(-1, 1) translate(-12.000000, -9.000000) " points="7 0 24 0 20 18 -1.70530257e-13 16"></polygon></g><polygon id="Rectangle-Copy-18" fill="#F8F9FB" transform="translate(66.000000, 51.500000) scale(-1, 1) translate(-66.000000, -51.500000) " points="62 45 79 45 70 58 53 58"></polygon></g></g></g></svg>';

  WEmptyStyle._privateConstrucor();
  static final WEmptyStyle _instance = WEmptyStyle._privateConstrucor();
  factory WEmptyStyle() {
    return _instance;
  }
}

class WPaginationStyle extends BaseStyle {
  Color totalColor = Colors.grey.shade600;

  WPaginationStyle._privateConstrucor();
  static final WPaginationStyle _instance =
      WPaginationStyle._privateConstrucor();
  factory WPaginationStyle() {
    return _instance;
  }
}

class WButtonStyle extends BaseStyle {
  double? minWidth = 30;
  void Function(WButton)? primary;
  void Function(WButton)? success;
  void Function(WButton)? warning;
  void Function(WButton)? danger;
  void Function(WButton)? info;
  void Function(WButton)? text;

  void Function(WButton)? mini;
  void Function(WButton)? small;
  void Function(WButton)? medium;
  void Function(WButton)? large;

  void Function(WButton)? isRound;
  void Function(WButton)? isCircle;
  void Function(WButton)? isDisabled;
  void Function(WButton)? isPlain;

  void Function(WButton)? hover;
  void Function(WButton)? active;

  WButtonStyle({
    double? width,
    double? height,
    double? minWidth,
    double? minHeight,
    double? maxWidth,
    double? maxHeight,
    Radius? radius,
  }) : super(
          height: height,
          width: width,
          minHeight: minHeight,
          minWidth: minWidth,
          maxHeight: maxHeight,
          maxWidth: maxWidth,
          radius: radius,
        );
}

class WProgressStyle extends BaseStyle {
  IconData successIcon = Icons.check_circle_outline_rounded;
  IconData warningIcon = Icons.error_rounded;
  IconData exceptionIcon = Icons.highlight_remove_rounded;

  IconData? icon(val) {
    switch (val) {
      case 'success':
        return successIcon;
      case 'warning':
        return warningIcon;
      case 'exception':
        return exceptionIcon;
    }
    return null;
  }

  WProgressStyle._privateConstrucor();
  static final WProgressStyle _instance = WProgressStyle._privateConstrucor();
  factory WProgressStyle() {
    return _instance;
  }
}

class WResultStyle extends BaseStyle {
  IconData successIcon = Icons.check_circle_rounded;
  IconData warningIcon = Icons.error_rounded;
  IconData errorIcon = Icons.dangerous_rounded;
  IconData infoIcon = Icons.info_rounded;

  double titleFontSize = 15;
  double subTitleFontSize = 14;

  Color titleColor = Colors.grey.shade900;
  Color subTitleColor = Colors.grey.shade900;

  EdgeInsets itemMargin = const EdgeInsets.only(top: 10);

  EdgeInsets extraMargin = const EdgeInsets.only(top: 20);

  EdgeInsets outPadding = const EdgeInsets.all(8);

  IconData? icon(val) {
    switch (val) {
      case 'success':
        return successIcon;
      case 'warning':
        return warningIcon;
      case 'error':
      case 'exception':
        return errorIcon;
      case 'info':
        return infoIcon;
    }
    return null;
  }
}

class WTableStyle extends BaseStyle {
  Color stripeColor = Colors.grey.shade100;
  Color rowHoverColor = CfgGlobal.primaryColor.shade50;
  BorderSide rowNoBorder = const BorderSide(width: 0);
  BorderSide rowBorder = BorderSide(width: .5, color: Colors.grey.shade300);
  EdgeInsets cellMargin = const EdgeInsets.fromLTRB(5, 2, 5, 2);
}

class WRadioStyle extends BaseStyle {
  double iconRadioMini = 4.0;
  double iconRadioSmall = 5.0;
  double iconRadioMedium = 6.0;
  double iconRadioLarge = 7.0;
  double val(String k) {
    return k == 'large'
        ? iconRadioLarge
        : k == 'medium'
            ? iconRadioMedium
            : k == 'small'
                ? iconRadioSmall
                : k == 'mini'
                    ? iconRadioMini
                    : iconRadioLarge;
  }

  WRadioStyle({
    EdgeInsets? padding,
  }) : super(padding: padding);
}

class WCheckboxStyle extends BaseStyle {
  double iconCheckboxMini = 10.0;
  double iconCheckboxSmall = 12.0;
  double iconCheckboxMedium = 14.0;
  double iconCheckboxLarge = 16.0;
  double val(String size) {
    return size == 'large'
        ? iconCheckboxLarge
        : size == 'medium'
            ? iconCheckboxMedium
            : size == 'small'
                ? iconCheckboxSmall
                : size == 'mini'
                    ? iconCheckboxMini
                    : iconCheckboxLarge;
  }

  double borderRadius(String size) {
    return val(size) * .2;
  }

  WCheckboxStyle({
    EdgeInsets? padding,
  }) : super(padding: padding);
}

class WInputStyle extends BaseStyle {
  @override
  double? width;
  WInputStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        ) {
    if (width == -1) {
      width = double.infinity;
    }
  }
}

class WSelectStyle extends BaseStyle {
  @override
  double? width;

  double? panelBorder;

  double? panelHeight;
  double? panelMaxWidth;
  double? panelMinWidth;

  double? panelOffset;

  Color? noDataTextColor;

  WSelectStyle({
    this.width,
    this.panelBorder,
    this.panelHeight,
    this.panelMaxWidth,
    this.panelMinWidth,
    this.panelOffset,
    this.noDataTextColor,
  });
}

class WOptionGroupStyle extends BaseStyle {}

class WContainerLayoutStyle extends BaseStyle {
  WContainerLayoutStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WFrameStyle extends BaseStyle {
  WFrameStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WAvatarStyle extends BaseStyle {
  WAvatarStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WBadgeStyle extends BaseStyle {
  WBadgeStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WDescriptionsItemStyle extends BaseStyle {
  WDescriptionsItemStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WSkeletonStyle extends BaseStyle {
  WSkeletonStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WTableColumnStyle extends BaseStyle {
  WTableColumnStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WTagStyle extends BaseStyle {
  WTagStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WTreeStyle extends BaseStyle {
  WTreeStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WFormStyle extends BaseStyle {
  WFormStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WCascaderStyle extends BaseStyle {
  WCascaderStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WCascaderPanelStyle extends BaseStyle {
  Color? levelBorderColor;
  double? levelPanelMinWidth;
  double? levelPanelMaxWidth;

  WCascaderMenuStyle? cascaderMenu;

  WCascaderPanelStyle({
    double? width,
    double? height,
    this.cascaderMenu,
  }) : super(
          height: height,
          width: width,
        );
}

class WCascaderMenuStyle extends BaseStyle {
  WCascaderNodeStyle? cascaderNode;
  Color? borderColor;
  WCascaderMenuStyle({
    this.cascaderNode,
    this.borderColor,
    double? minWidth,
    double? maxWidth,
  }) : super(
          minWidth: minWidth,
          maxWidth: maxWidth,
        );
}

class WCascaderNodeStyle extends BaseStyle {
  Color? disabledColor;
  WCascaderNodeStyle({
    double? width,
    double? height,
    Color? disabledColor,
  }) : super(
          height: height,
          width: width,
        ) {
    this.disabledColor = disabledColor ?? CfgGlobal.disabledColor.shade300;
  }
}

class WCheckboxGroupStyle extends BaseStyle {
  WCheckboxGroupStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WCheckboxButtonStyle extends BaseStyle {
  WCheckboxButtonStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WColorPickerStyle extends BaseStyle {
  WColorPickerStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WDatePickerStyle extends BaseStyle {
  WDatePickerStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WDateTimePickerStyle extends BaseStyle {
  WDateTimePickerStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WInputNumberStyle extends BaseStyle {
  WInputNumberStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WAutocompleteStyle extends BaseStyle {
  WAutocompleteStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WRadioGroupStyle extends BaseStyle {
  WRadioGroupStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WRadioButtonStyle extends BaseStyle {
  WRadioButtonStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WRateStyle extends BaseStyle {
  WRateStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WOptionStyle extends BaseStyle {
  Color? disabledColor;
  WOptionStyle({
    double? width,
    double? height,
    this.disabledColor,
  }) : super(
          height: height,
          width: width,
        );
}

class WSliderStyle extends BaseStyle {
  Color? inactiveColor;
  Color? activeColor;
  Color? thumbColor;
  double? valueRadiusOuter;
  double? valueRadiusInner;
  WSliderStyle({
    double? width,
    double? height,
    this.inactiveColor,
    this.activeColor,
    this.thumbColor,
    this.valueRadiusOuter,
    this.valueRadiusInner,
  }) : super(
          height: height,
          width: width,
        );
}

class WSwitchStyle extends BaseStyle {
  double? btnHeight;
  double? btnInnerBorder;
  int? switchTime;
  WSwitchStyle({
    double? width,
    double? height,
    this.btnHeight,
    this.btnInnerBorder,
    this.switchTime,
  }) : super(
          height: height,
          width: width,
        );
}

class WTimePickerStyle extends BaseStyle {
  WTimePickerStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WTransferStyle extends BaseStyle {
  WTransferStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WUploadStyle extends BaseStyle {
  double? pictureSize;
  WUploadStyle({
    double? width,
    double? height,
    this.pictureSize,
  }) : super(
          height: height,
          width: width,
        );
}

class WBreadcrumbItemStyle extends BaseStyle {
  WBreadcrumbItemStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WDropdownStyle extends BaseStyle {
  WDropdownStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WDropdownMenuStyle extends BaseStyle {
  WDropdownMenuStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WDropdownItemStyle extends BaseStyle {
  WDropdownItemStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WMenuStyle extends BaseStyle {
  late Color activeColor;
  late Color prefixColor;
  late Color suffixColor;
  late double? stepPadding;
  late WSubmenuStyle? submenu;
  WMenuStyle({
    Color? color,
    Color? activeColor,
    double? width,
    double? height,
    double? minHeight,
    Color? backgroundColor,
    Color? hoverBackgroundColor,
    Color? prefixColor,
    Color? suffixColor,
    this.stepPadding,
    this.submenu,
  }) : super(
          height: height,
          width: width,
          minHeight: minHeight,
          backgroundColor: backgroundColor,
          hoverBackgroundColor: hoverBackgroundColor,
        ) {
    this.color = color ?? ColorUtil.hexToColor('#303133');
    this.prefixColor = prefixColor ?? ColorUtil.hexToColor('#909399');
    this.suffixColor = suffixColor ?? ColorUtil.hexToColor('#909399');
    this.backgroundColor = backgroundColor ?? Colors.transparent;
    this.hoverBackgroundColor =
        hoverBackgroundColor ?? ColorUtil.hexToColor('#ecf5ff');
    this.activeColor = activeColor ?? ColorUtil.hexToColor('#409EFF');
  }
}

class WSubmenuStyle extends BaseStyle {
  double? panelBorder;
  WMenuItemStyle? menuItem;
  WSubmenuStyle({
    double? width,
    double? height,
    this.panelBorder,
    this.menuItem,
  }) : super(
          height: height,
          width: width,
        );
}

class WMenuItemStyle extends BaseStyle {
  WMenuItemStyle({
    double? fontSize,
    double? width,
    double? height,
    EdgeInsets? padding,
  }) : super(
          fontSize: fontSize,
          height: height,
          width: width,
          padding: padding,
        );
}

class WMenuItemGroupStyle extends BaseStyle {
  WMenuItemGroupStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WPageHeaderStyle extends BaseStyle {
  WPageHeaderStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WStepsStyle extends BaseStyle {
  WStepsStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WStepStyle extends BaseStyle {
  WStepStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WTabsStyle extends BaseStyle {
  WTabItemStyle? item;
  WTabsStyle({
    double? width,
    double? height,
    this.item,
  }) : super(
          height: height,
          width: width,
        );
}

class WTabItemStyle extends BaseStyle {
  WTabItemStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WTabPaneStyle extends BaseStyle {
  WTabPaneStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WAlertStyle extends BaseStyle {
  WAlertStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WLoadingStyle extends BaseStyle {
  WLoadingStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WMessageStyle extends BaseStyle {
  WMessageStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WMessageBoxStyle extends BaseStyle {
  WMessageBoxStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WNotificationStyle extends BaseStyle {
  WNotificationStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WBacktopStyle extends BaseStyle {
  WBacktopStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WCalendarStyle extends BaseStyle {
  WCalendarStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WCardStyle extends BaseStyle {
  double? spacing;
  WCardStyle({
    double? width,
    double? height,
    EdgeInsets? padding,
    Color? backgroundColor,
    Color? borderColor,
    this.spacing,
  }) : super(
          height: height,
          width: width,
          padding: padding,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
        );
}

class WCarouselStyle extends BaseStyle {
  WCarouselStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WCarouselItemStyle extends BaseStyle {
  WCarouselItemStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WCollapseStyle extends BaseStyle {
  WCollapseStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WCollapseItemStyle extends BaseStyle {
  WCollapseItemStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WDialogStyle extends BaseStyle {
  WDialogStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WDividerStyle extends BaseStyle {
  WDividerStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WDrawerStyle extends BaseStyle {
  List<BoxShadow>? boxShadow;
  TextStyle? titleTextStyle;
  double? titlePadding;
  double? bodyPadding;
  WDrawerStyle({
    double? width,
    double? height,
    this.boxShadow,
    this.titleTextStyle,
    this.titlePadding,
    this.bodyPadding,
  }) : super(
          height: height,
          width: width,
        );
}

class WHoverHandleStyle extends BaseStyle {
  WHoverHandleStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WImageStyle extends BaseStyle {
  WImageStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WInfiniteScrollStyle extends BaseStyle {
  WInfiniteScrollStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WPopconfirmStyle extends BaseStyle {
  WPopconfirmStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WPopoverStyle extends BaseStyle {
  WPopoverStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WTimelineStyle extends BaseStyle {
  WTimelineStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WTimelineItemStyle extends BaseStyle {
  WTimelineItemStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class WTooltipStyle extends BaseStyle {
  WTooltipStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}

class PlainTreeStyle extends BaseStyle {
  PlainTreeStyle({
    double? width,
    double? height,
  }) : super(
          height: height,
          width: width,
        );
}
