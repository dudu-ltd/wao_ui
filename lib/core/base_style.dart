import 'package:flutter/cupertino.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';

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
  FontWeight? fontWeight;
  Radius? radius;
  MouseCursor? cursor;
  Alignment? textAlign;

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
    this.radius,
  });

  BaseStyle merge<T extends BaseStyle?>(T source) {
    if (source == null) return this;

    color = color ?? source.color;
    width = width ?? source.width;
    height = height ?? source.height;
    minWidth = minWidth ?? source.minWidth;
    minHeight = minHeight ?? source.minHeight;
    maxWidth = maxWidth ?? source.maxWidth;
    maxHeight = maxHeight ?? source.maxHeight;
    padding = padding ?? source.padding;
    margin = margin ?? source.margin;
    border = border ?? source.border;
    backgroundColor = backgroundColor ?? source.backgroundColor;
    hoverBackgroundColor = hoverBackgroundColor ?? source.hoverBackgroundColor;
    borderColor = borderColor ?? source.borderColor;
    fontSize = fontSize ?? source.fontSize;
    radius = radius ?? source.radius;
    cursor = cursor ?? source.cursor;
    textAlign = textAlign ?? source.textAlign;

    return this;
  }

  wrap<W extends BaseMixins>(List<StyleWrap<W>?> wraps, W w) {
    // print(wraps);
    for (var wrap in wraps) {
      wrap?.call(w);
    }
  }
}
