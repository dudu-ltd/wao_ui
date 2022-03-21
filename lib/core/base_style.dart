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
  // margin
  double? marginLeft;
  double? marginRight;
  double? marginTop;
  double? marginBottom;
  // padding
  double? paddingLeft;
  double? paddingRight;
  double? paddingTop;
  double? paddingBottom;
  Color? backgroundColor;
  Color? hoverBackgroundColor;
  Border? border;
  double borderWidth = 1;
  Color? borderColor;
  double? fontSize;
  FontWeight? fontWeight;
  MouseCursor? cursor;
  Alignment? textAlign;

  Radius? borderTopLeftRadius;
  Radius? borderBottomLeftRadius;
  Radius? borderTopRightRadius;
  Radius? borderBottomRightRadius;

  set borderRadius(BorderRadius? borderRadius) {
    if (borderRadius == null) return;
    borderTopLeftRadius = borderRadius.topLeft;
    borderBottomLeftRadius = borderRadius.bottomLeft;
    borderTopRightRadius = borderRadius.topRight;
    borderBottomRightRadius = borderRadius.bottomRight;
  }

  BorderRadius? get borderRadius {
    if (borderTopLeftRadius == null &&
        borderBottomLeftRadius == null &&
        borderTopRightRadius == null &&
        borderBottomRightRadius == null) return null;
    return BorderRadius.only(
      topLeft: borderTopLeftRadius ?? Radius.zero,
      topRight: borderTopRightRadius ?? Radius.zero,
      bottomLeft: borderBottomLeftRadius ?? Radius.zero,
      bottomRight: borderBottomRightRadius ?? Radius.zero,
    );
  }

  set padding(EdgeInsets? padding) {
    if (padding == null) return;
    paddingLeft = padding.left;
    paddingTop = padding.top;
    paddingRight = padding.right;
    paddingBottom = padding.bottom;
  }

  EdgeInsets? get padding {
    if (paddingLeft == null &&
        paddingTop == null &&
        paddingRight == null &&
        paddingBottom == null) return null;
    return EdgeInsets.fromLTRB(
      paddingLeft ?? 0,
      paddingTop ?? 0,
      paddingRight ?? 0,
      paddingBottom ?? 0,
    );
  }

  set margin(EdgeInsets? margin) {
    if (margin == null) return;
    marginLeft = margin.left;
    marginTop = margin.top;
    marginRight = margin.right;
    marginBottom = margin.bottom;
  }

  EdgeInsets? get margin {
    return EdgeInsets.fromLTRB(
      marginLeft ?? 0,
      marginTop ?? 0,
      marginRight ?? 0,
      marginBottom ?? 0,
    );
  }

  BaseStyle({
    this.color,
    this.width,
    this.height,
    this.minWidth,
    this.minHeight,
    this.maxWidth,
    this.maxHeight,
    // margin
    this.marginLeft,
    this.marginRight,
    this.marginTop,
    this.marginBottom,
    // padding
    this.paddingLeft,
    this.paddingRight,
    this.paddingTop,
    this.paddingBottom,
    //
    this.border,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.borderColor,
    this.fontSize,
    // border-radius
    this.borderTopLeftRadius,
    this.borderBottomLeftRadius,
    this.borderTopRightRadius,
    this.borderBottomRightRadius,
    //
    BorderRadius? borderRadius,
    EdgeInsets? padding,
  }) {
    this.padding = padding;
    this.borderRadius = borderRadius;
  }
  @override
  String toString() {
    return '''{
      marginLeft: $marginLeft,
      marginRight: $marginRight,
      marginTop: $marginTop,
      marginBottom: $marginBottom,
      paddingLeft: $paddingLeft,
      paddingRight: $paddingRight,
      paddingTop: $paddingTop,
      paddingBottom: $paddingBottom,
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
    border = pickStyle(border, source.border, force: force);
    backgroundColor =
        pickStyle(backgroundColor, source.backgroundColor, force: force);
    hoverBackgroundColor =
        pickStyle(hoverBackgroundColor, source.hoverBackgroundColor);
    borderColor = pickStyle(borderColor, source.borderColor, force: force);
    fontSize = pickStyle(fontSize, source.fontSize, force: force);
    cursor = pickStyle(cursor, source.cursor, force: force);
    textAlign = pickStyle(textAlign, source.textAlign, force: force);
    paddingLeft = pickStyle(paddingLeft, source.paddingLeft, force: force);
    paddingRight = pickStyle(paddingRight, source.paddingRight, force: force);
    paddingTop = pickStyle(paddingTop, source.paddingTop, force: force);
    paddingBottom =
        pickStyle(paddingBottom, source.paddingBottom, force: force);
    marginLeft = pickStyle(marginLeft, source.marginLeft, force: force);
    marginRight = pickStyle(marginRight, source.marginRight, force: force);
    marginTop = pickStyle(marginTop, source.marginTop, force: force);
    marginBottom = pickStyle(marginBottom, source.marginBottom, force: force);

    borderTopLeftRadius = pickStyle(
      borderTopLeftRadius,
      source.borderTopLeftRadius,
      force: force,
    );
    borderBottomLeftRadius = pickStyle(
      borderBottomLeftRadius,
      source.borderBottomLeftRadius,
      force: force,
    );
    borderTopRightRadius = pickStyle(
      borderTopRightRadius,
      source.borderTopRightRadius,
      force: force,
    );
    borderBottomRightRadius = pickStyle(
      borderBottomRightRadius,
      source.borderBottomRightRadius,
      force: force,
    );
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
