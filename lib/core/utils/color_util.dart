import 'package:flutter/material.dart';

class ColorUtil {
  static Color hexToColor(String colorHex) {
    return Color(int.parse(colorHex.replaceAll('#', '0xFF')));
  }
}
