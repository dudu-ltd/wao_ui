import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_style.dart';

/// Utility extension methods to the [ThemeData] class.
extension WThemeDataExtension on ThemeData {
  Map<List<List<String>>, ThemeData> get widgetTheme => {};
  ThemeData get avatar => ThemeData();
  set avatar(ThemeData avatar) => this.avatar._copyWith(avatar);
  ThemeData get descriptions => copyWith(cardColor: Colors.red);
  Map<String, ThemeData> get global => {
        'avator': avatar,
        'descriptions': descriptions,
      };

  // ThemeData copyWith({ThemeData? custom}) {}

  /// Returns whether we are currently using a dark theme.
  bool get isDarkTheme => brightness == Brightness.dark;
  ThemeData operator [](String widgetName) => global[widgetName] ?? this;
  ThemeData _copyWith(ThemeData? setStyles) {
    return this;
  }
}
