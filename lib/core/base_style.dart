import 'package:flutter/cupertino.dart';

class BaseStyle {
  double? width;
  double? height;
  double? minWidth;
  double? minHeight;
  double? maxWidth;
  double? maxHeight;
  EdgeInsets? padding;
  EdgeInsets? margin;
  Border? border;
  BaseStyle({
    this.width,
    this.height,
    this.minWidth,
    this.minHeight,
    this.maxWidth,
    this.maxHeight,
    this.padding,
    this.margin,
    this.border,
  });
}
