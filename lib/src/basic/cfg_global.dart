import 'package:flutter/material.dart';

CfgGlobal cfgGlobal = CfgGlobal();

class CfgGlobal {
  WBorderRadius borderRadius = WBorderRadius();
  WBorderStyle borderStyle = WBorderStyle();
  WPadding padding = WPadding();
  WColor color = WColor();

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

class WPadding {
  double none = 0.0;
  double mini = 5.0;
  double small = 8.0;
  double medium = 10.0;
  double large = 12.0;

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
                : k == 'danger'
                    ? danger
                    : k == 'info'
                        ? info
                        : info;
  }
}
