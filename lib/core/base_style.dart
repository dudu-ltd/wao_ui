import 'package:flutter/cupertino.dart';

class BaseStyle {
  Color? color;
  double? width;
  double? height;
  double? minWidth;
  double? minHeight;
  double? maxWidth;
  double? maxHeight;
  EdgeInsets? padding;
  EdgeInsets? margin;
  Border? border;
  Color? backgroundColor;
  Color? hoverBackgroundColor;
  Color? borderColor;
  double? fontSize;
  BaseStyle({
    this.color,
    this.width,
    this.height,
    this.minWidth,
    this.minHeight,
    this.maxWidth,
    this.maxHeight,
    this.padding,
    this.margin,
    this.border,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.borderColor,
    this.fontSize,
  });
}
