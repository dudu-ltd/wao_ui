// ignore_for_file: overridden_fields

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/base_style.dart';
import 'package:wao_ui/core/swatch/size_swatch.dart';
import 'package:wao_ui/core/utils/color_util.dart';

import 'w_button.dart';

CfgGlobal cfgGlobal = CfgGlobal();

typedef StyleWrap<W> = void Function(W);

class CfgGlobal {
  static Map<String, List<String> Function(BaseMixins)> selectors = {};

  static double fontRate = .72;

  static double goldRate = 0.618;
  static Map<List<List<String>>, BaseStyle?> css = {};
  // static MaterialColor primaryColor = Colors.deepPurple;
  static MaterialColor primaryColor = Colors.blue;
  static MaterialColor successColor = Colors.lightGreen;
  static MaterialColor warningColor = Colors.orange;
  static MaterialColor dangerColor = Colors.red;
  static MaterialColor infoColor = Colors.grey;
  static MaterialColor textColor = const MaterialColor(
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
  static MaterialColor defaultColor = Colors.blue;
  static MaterialColor disabledColor = Colors.grey;
  static MaterialColor basicColor = const MaterialColor(
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
                        : k == 'text'
                            ? CfgGlobal.textColor
                            : CfgGlobal.defaultColor;
  }

  static Duration duration = const Duration(milliseconds: 300);

  static WEdgeInsets padding = WEdgeInsets(
    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    const {
      'zero': EdgeInsets.zero,
      'mini': EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      'small': EdgeInsets.symmetric(vertical: 9, horizontal: 15),
      'medium': EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      'large': EdgeInsets.symmetric(vertical: 12, horizontal: 22),
    },
  );

  static WEdgeInsets roundPadding = CfgGlobal.padding;

  static WEdgeInsets circlePadding = WEdgeInsets(
    const EdgeInsets.all(10),
    const {
      'zero': EdgeInsets.zero,
      'mini': EdgeInsets.all(7),
      'small': EdgeInsets.all(9),
      'medium': EdgeInsets.all(10),
      'large': EdgeInsets.all(12),
    },
  );

  static WFontSize fontSize = WFontSize(
    14,
    const {
      'zero': 13,
      'mini': 14,
      'small': 16,
      'medium': 18,
      'large': 20,
    },
  );

  static WBorderRadius circularBorderRadius = WBorderRadius(
    BorderRadius.circular(1.0),
    {
      'zero': BorderRadius.zero,
      'mini': BorderRadius.circular(1),
      'small': BorderRadius.circular(2),
      'medium': BorderRadius.circular(4),
      'large': BorderRadius.circular(30),
    },
  );

  static WBorderRadius leftCircularBorderRadius = WBorderRadius(
    const BorderRadius.only(topLeft: Radius.circular(1.0)),
    const {
      'zero': BorderRadius.zero,
      'mini': BorderRadius.only(
        topLeft: Radius.circular(1.0),
        bottomLeft: Radius.circular(1.0),
      ),
      'small': BorderRadius.only(
        topLeft: Radius.circular(2.0),
        bottomLeft: Radius.circular(2.0),
      ),
      'medium': BorderRadius.only(
        topLeft: Radius.circular(4.0),
        bottomLeft: Radius.circular(4.0),
      ),
      'large': BorderRadius.only(
        topLeft: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      ),
    },
  );

  static WBorderRadius rightCircularBorderRadius = WBorderRadius(
    const BorderRadius.only(topLeft: Radius.circular(1.0)),
    const {
      'zero': BorderRadius.zero,
      'mini': BorderRadius.only(
        topLeft: Radius.circular(1.0),
        bottomLeft: Radius.circular(1.0),
      ),
      'small': BorderRadius.only(
        topLeft: Radius.circular(2.0),
        bottomLeft: Radius.circular(2.0),
      ),
      'medium': BorderRadius.only(
        topLeft: Radius.circular(4.0),
        bottomLeft: Radius.circular(4.0),
      ),
      'large': BorderRadius.only(
        topLeft: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      ),
    },
  );

  WFont font = WFont();
  WBorder border = WBorder();
  WBorderStyle borderStyle = WBorderStyle();

  WAvatarSize avatarSize = WAvatarSize();

  WAvatarStyle avatar = WAvatarStyle();

  WBadgeFont badgeFont = WBadgeFont();

  WBadgeStyle badge = WBadgeStyle();

  WBreadcrumbStyle breadcrumb = WBreadcrumbStyle(
    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
  );

  WDescriptionsStyle descriptions = WDescriptionsStyle(
    padding: const EdgeInsets.fromLTRB(3, 2, 3, 2),
  );

  WEmptyStyle empty = WEmptyStyle();

  WPaginationStyle pagination = WPaginationStyle();

  WButtonStyle button = WButtonStyle();
  WButtonGroupStyle buttonGroup = WButtonGroupStyle();

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
  WScrollSnapStyle scrollSnap = WScrollSnapStyle();

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

  BaseStyle? header;
  BaseStyle? title;
  BaseStyle? body;

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
      r'''<svg t="1648719362944" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="12467" width="200" height="200"><path d="M855.6 427.2H168.5c-12.7 0-24.4 6.9-30.6 18L4.4 684.7C1.5 689.9 0 695.8 0 701.8v287.1c0 19.4 15.7 35.1 35.1 35.1H989c19.4 0 35.1-15.7 35.1-35.1V701.8c0-6-1.5-11.8-4.4-17.1L886.2 445.2c-6.2-11.1-17.9-18-30.6-18zM673.4 695.6c-16.5 0-30.8 11.5-34.3 27.7-12.7 58.5-64.8 102.3-127.2 102.3s-114.5-43.8-127.2-102.3c-3.5-16.1-17.8-27.7-34.3-27.7H119c-26.4 0-43.3-28-31.1-51.4l81.7-155.8c6.1-11.6 18-18.8 31.1-18.8h622.4c13 0 25 7.2 31.1 18.8l81.7 155.8c12.2 23.4-4.7 51.4-31.1 51.4H673.4zM819.9 209.5c-1-1.8-2.1-3.7-3.2-5.5-9.8-16.6-31.1-22.2-47.8-12.6L648.5 261c-17 9.8-22.7 31.6-12.6 48.4 0.9 1.4 1.7 2.9 2.5 4.4 9.5 17 31.2 22.8 48 13L807 257.3c16.7-9.7 22.4-31 12.9-47.8zM375.4 261.1L255 191.6c-16.7-9.6-38-4-47.8 12.6-1.1 1.8-2.1 3.6-3.2 5.5-9.5 16.8-3.8 38.1 12.9 47.8L337.3 327c16.9 9.7 38.6 4 48-13.1 0.8-1.5 1.7-2.9 2.5-4.4 10.2-16.8 4.5-38.6-12.4-48.4zM512 239.3h2.5c19.5 0.3 35.5-15.5 35.5-35.1v-139c0-19.3-15.6-34.9-34.8-35.1h-6.4C489.6 30.3 474 46 474 65.2v139c0 19.5 15.9 35.4 35.5 35.1h2.5z" p-id="12468" fill="#dbdbdb"></path></svg>''';

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

class WButtonStyle extends BaseStyle<WButton> {
  double? minWidth = 30;

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
        );
}

class WButtonGroupStyle extends BaseStyle {}

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

class WContainerStyle extends BaseStyle {}

class WScrollSnapStyle extends BaseStyle {
  double snapWidth;
  WScrollSnapStyle({this.snapWidth = 150.0});
}
