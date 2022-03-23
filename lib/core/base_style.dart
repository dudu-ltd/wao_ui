import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  Color? borderColor;
  double? fontSize;
  FontWeight? fontWeight;
  MouseCursor? cursor;
  Alignment? textAlign;

  Radius? borderTopLeftRadius;
  Radius? borderBottomLeftRadius;
  Radius? borderTopRightRadius;
  Radius? borderBottomRightRadius;

  // borderTop
  Color? borderTopColor;
  double? borderTopWidth;
  BorderStyle? borderTopStyle;
  set borderTop(BorderSide? borderSide) {
    if (borderSide == null) return;
    borderTopColor = pickStyle(borderTopColor, borderSide.color, force: true);
    borderTopWidth = pickStyle(borderTopWidth, borderSide.width, force: true);
    borderTopStyle = pickStyle(borderTopStyle, borderSide.style, force: true);
  }

  BorderSide? get borderTop {
    if (borderTopWidth == null &&
        borderTopColor == null &&
        borderTopStyle == null) return null;
    return BorderSide(color: borderTopColor ?? Colors.transparent)
        .copyWith(width: borderTopWidth)
        .copyWith(style: borderTopStyle);
  }

  // borderBottom
  Color? borderBottomColor;
  double? borderBottomWidth;
  BorderStyle? borderBottomStyle;
  set borderBottom(BorderSide? borderSide) {
    if (borderSide == null) return;
    borderBottomColor =
        pickStyle(borderBottomColor, borderSide.color, force: true);
    borderBottomWidth =
        pickStyle(borderBottomWidth, borderSide.width, force: true);
    borderBottomStyle =
        pickStyle(borderBottomStyle, borderSide.style, force: true);
  }

  BorderSide? get borderBottom {
    if (borderBottomWidth == null &&
        borderBottomColor == null &&
        borderBottomStyle == null) return null;
    return BorderSide(color: borderBottomColor ?? Colors.transparent)
        .copyWith(width: borderBottomWidth)
        .copyWith(style: borderBottomStyle);
  }

  // borderLeft
  Color? borderLeftColor;
  double? borderLeftWidth;
  BorderStyle? borderLeftStyle;
  set borderLeft(BorderSide? borderSide) {
    if (borderSide == null) return;
    borderLeftColor = pickStyle(borderLeftColor, borderSide.color, force: true);
    borderLeftWidth = pickStyle(borderLeftWidth, borderSide.width, force: true);
    borderLeftStyle = pickStyle(borderLeftStyle, borderSide.style, force: true);
  }

  BorderSide? get borderLeft {
    if (borderLeftWidth == null &&
        borderLeftColor == null &&
        borderLeftStyle == null) return null;
    return BorderSide(color: borderLeftColor ?? Colors.transparent)
        .copyWith(width: borderLeftWidth)
        .copyWith(style: borderLeftStyle);
  }

  // borderRight
  Color? borderRightColor;
  double? borderRightWidth;
  BorderStyle? borderRightStyle;
  set borderRight(BorderSide? borderSide) {
    if (borderSide == null) return;
    borderRightColor =
        pickStyle(borderRightColor, borderSide.color, force: true);
    borderRightWidth =
        pickStyle(borderRightWidth, borderSide.width, force: true);
    borderRightStyle =
        pickStyle(borderRightStyle, borderSide.style, force: true);
  }

  BorderSide? get borderRight {
    if (borderRightWidth == null &&
        borderRightColor == null &&
        borderRightStyle == null) return null;
    return BorderSide(color: borderRightColor ?? Colors.transparent)
        .copyWith(width: borderRightWidth)
        .copyWith(style: borderRightStyle);
  }

  set borderWidth(double? borderWidth) {
    if (borderWidth == null) return;
    borderTopWidth = pickStyle(borderTopWidth, borderWidth, force: true);
    borderBottomWidth = pickStyle(borderBottomWidth, borderWidth, force: true);
    borderLeftWidth = pickStyle(borderLeftWidth, borderWidth, force: true);
    borderRightWidth = pickStyle(borderRightWidth, borderWidth, force: true);
  }

  set border(Border? border) {
    if (border == null) return;
    borderTop = border.top;
    borderBottom = border.bottom;
    borderLeft = border.left;
    borderRight = border.right;
  }

  Border? get border {
    if (borderRight == null &&
        borderLeft == null &&
        borderTop == null &&
        borderBottom == null) return null;
    var b = const Border();
    if (borderRight != null) b = Border.merge(b, Border(right: borderRight!));
    if (borderLeft != null) b = Border.merge(b, Border(left: borderLeft!));
    if (borderTop != null) b = Border.merge(b, Border(top: borderTop!));
    if (borderBottom != null) {
      b = Border.merge(b, Border(bottom: borderBottom!));
    }
    return b;
  }

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
    Border? border,
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
    EdgeInsets? margin,
  }) {
    this.padding = padding;
    this.borderRadius = borderRadius;
    this.border = border;
    this.margin = margin;
  }
  @override
  String toString() {
    return '''{
      borderTopWidth: $borderTopWidth,
      borderBottomWidth: $borderBottomWidth,
      borderRightWidth: $borderRightWidth,
      borderLeftWidth: $borderLeftWidth,
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
