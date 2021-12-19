import 'package:flutter/material.dart';

CfgGlobal cfgGlobal = CfgGlobal();

class CfgGlobal {
  WBorderRadius borderRadius = WBorderRadius();
  WBorderStyle borderStyle = WBorderStyle();
  WPadding padding = WPadding();
  WColor color = WColor();
  WAvatarSize avatarSize = WAvatarSize();
  WBadgeFont badgeFont = WBadgeFont();

  WBreadcrumbStyle breadcrumb = WBreadcrumbStyle();

  WDescriptionsStyle descriptions = WDescriptionsStyle();

  WEmptyStyle empty = WEmptyStyle();

  WPaginationStyle pagination = WPaginationStyle();

  WButtonStyle button = WButtonStyle();

  WProgressStyle progress = WProgressStyle();

  CfgGlobal._privateConstrucor();

  static final CfgGlobal _instance = CfgGlobal._privateConstrucor();

  factory CfgGlobal() {
    return _instance;
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

class WBorderRadius {
  double none = 0.0;
  double mini = 2.0;
  double small = 4.0;
  double medium = 6.0;
  double large = 8.0;
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
  double mini = 3.0;
  double small = 5.0;
  double medium = 8.0;
  double large = 10.0;

  WPadding._privateConstrucor();
  static final WPadding _instance = WPadding._privateConstrucor();
  factory WPadding() {
    return _instance;
  }

  double val(String k) {
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

class WColor {
  MaterialColor primary = Colors.blue;
  MaterialColor success = Colors.green;
  MaterialColor waring = Colors.orange;
  MaterialColor danger = Colors.pink;
  MaterialColor info = Colors.grey;

  WColor._privateConstrucor();
  static final WColor _instance = WColor._privateConstrucor();
  factory WColor() {
    return _instance;
  }

  MaterialColor val(String? k) {
    return k == 'primary'
        ? primary
        : k == 'success'
            ? success
            : k == 'warning'
                ? waring
                : k == 'danger' || k == 'exception'
                    ? danger
                    : k == 'info'
                        ? info
                        : info;
  }
}

class WBreadcrumbStyle {
  late EdgeInsets padding = const EdgeInsets.fromLTRB(8, 2, 8, 2);

  WBreadcrumbStyle._privateConstrucor();
  static final WBreadcrumbStyle _instance =
      WBreadcrumbStyle._privateConstrucor();
  factory WBreadcrumbStyle() {
    return _instance;
  }
}

class WDescriptionsStyle {
  double labelWidth = 80;
  Color labelColor = Colors.grey.shade100;

  double borderWidth = 1.0;
  Color borderColor = Colors.grey.shade300;

  late EdgeInsets padding = const EdgeInsets.fromLTRB(3, 2, 3, 2);

  WDescriptionsStyle._privateConstrucor();
  static final WDescriptionsStyle _instance =
      WDescriptionsStyle._privateConstrucor();
  factory WDescriptionsStyle() {
    return _instance;
  }
}

class WEmptyStyle {
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

class WPaginationStyle {
  Color totalColor = Colors.grey.shade600;

  WPaginationStyle._privateConstrucor();
  static final WPaginationStyle _instance =
      WPaginationStyle._privateConstrucor();
  factory WPaginationStyle() {
    return _instance;
  }
}

class WButtonStyle {
  double minWidth = 30;

  WButtonStyle._privateConstrucor();
  static final WButtonStyle _instance = WButtonStyle._privateConstrucor();
  factory WButtonStyle() {
    return _instance;
  }
}

class WProgressStyle {
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
