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
  double? paddingLeft;
  double? paddingRight;
  double? paddingTop;
  double? paddingBottom;
  EdgeInsets? margin;
  Color? backgroundColor;
  Color? hoverBackgroundColor;
  Border? border;
  double borderWidth = 1;
  Color? borderColor;
  double? fontSize;
  FontWeight? fontWeight;
  Radius? radius;
  BorderRadius? borderRadius;
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
    this.paddingLeft,
    this.paddingRight,
    this.paddingTop,
    this.paddingBottom,
    this.margin,
    this.border,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.borderColor,
    this.fontSize,
    this.radius,
    this.borderRadius,
  });
  @override
  String toString() {
    return '''{
      color: $color,
      background: $backgroundColor,
      borderColor: $borderColor
    }''';
  }

  BaseStyle merge<T extends BaseStyle?>(T source, {bool force = false}) {
    if (source == null) return this;
    color = pickStyle(color, source.color, force: force);
    width = pickStyle(width, source.width, force: force);
    height = pickStyle(height, source.height, force: force);
    minWidth = pickStyle(minWidth, source.minWidth, force: force);
    minHeight = pickStyle(minHeight, source.minHeight, force: force);
    maxWidth = pickStyle(maxWidth, source.maxWidth, force: force);
    maxHeight = pickStyle(maxHeight, source.maxHeight, force: force);
    padding = pickStyle(padding, source.padding, force: force);
    margin = pickStyle(margin, source.margin, force: force);
    border = pickStyle(border, source.border, force: force);
    backgroundColor =
        pickStyle(backgroundColor, source.backgroundColor, force: force);
    hoverBackgroundColor =
        pickStyle(hoverBackgroundColor, source.hoverBackgroundColor);
    borderColor = pickStyle(borderColor, source.borderColor, force: force);
    fontSize = pickStyle(fontSize, source.fontSize, force: force);
    radius = pickStyle(radius, source.radius, force: force);
    cursor = pickStyle(cursor, source.cursor, force: force);
    textAlign = pickStyle(textAlign, source.textAlign, force: force);
    borderRadius = pickStyle(borderRadius, source.borderRadius, force: force);
    paddingLeft = pickStyle(paddingLeft, source.paddingLeft, force: force);
    paddingRight = pickStyle(paddingRight, source.paddingRight, force: force);
    paddingTop = pickStyle(paddingTop, source.paddingTop, force: force);
    paddingBottom =
        pickStyle(paddingBottom, source.paddingBottom, force: force);
    return this;
  }

  T? pickStyle<T>(T? target, T? source, {bool force = false}) {
    if (force) {
      if (source != null) {
        return source;
      }
    }
    return target ?? source;
  }

  wrap<W extends BaseMixins>(List<StyleWrap<W>?> wraps, W w) {
    // print(wraps);
    for (var wrap in wraps) {
      wrap?.call(w);
    }
  }
}
