import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';

class BaseStyle<W> {
  Alignment? alignItems;
  Color? color;
  double? width;
  double? widthFactor;
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
  double? opacity;
  Alignment? textAlign;
  Alignment? verticalAlign;

  Radius? borderTopLeftRadius;
  Radius? borderBottomLeftRadius;
  Radius? borderTopRightRadius;
  Radius? borderBottomRightRadius;

  TextStyle? font;

  // borderTop
  Color? borderTopColor;
  double? borderTopWidth;
  BorderStyle? borderTopStyle;

  List<BoxShadow>? boxShadow;
  Gradient? gradient;
  DecorationImage? backgroundImage;
  BlendMode? backgroundBlendMode;

  bool? display = true;

  List<String> Function(W)? selector;

  double? lineHeight;

  Clip? overflow;

  List<String> clazz = [];

  BaseStyle newInstance() {
    return BaseStyle();
  }

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
    if (marginLeft == null &&
        marginTop == null &&
        marginRight == null &&
        marginBottom == null) return null;
    return EdgeInsets.fromLTRB(
      marginLeft ?? 0,
      marginTop ?? 0,
      marginRight ?? 0,
      marginBottom ?? 0,
    );
  }

  BaseStyle({
    this.opacity,
    this.textAlign,
    this.verticalAlign,
    this.display,
    this.alignItems,
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
    this.boxShadow,
    this.gradient,
    this.backgroundImage,
    this.backgroundBlendMode,
    double? lineHeight,
    this.overflow,
  }) {
    this.padding = padding;
    this.borderRadius = borderRadius;
    this.border = border;
    this.margin = margin;
    if (lineHeight != null) this.lineHeight = lineHeight / (fontSize ?? 14);
  }
  @override
  String toString() {
    return '''{
      borderTopWidth: $borderTopWidth,
      borderBottomWidth: $borderBottomWidth,
      borderRightWidth: $borderRightWidth,
      borderLeftWidth: $borderLeftWidth,
      paddingLeft: $paddingLeft, 
      paddingRight: $paddingRight, 
      paddingTop: $paddingTop, 
      paddingBottom: $paddingBottom, 
      backgroundColor: $backgroundColor
      width: $width
      widthFactor: $widthFactor
      height: $height
      minWidth: $minWidth
      minHeight: $minHeight
      maxWidth: $maxWidth
      maxHeight: $maxHeight
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
    hoverBackgroundColor = pickStyle(
        hoverBackgroundColor, source.hoverBackgroundColor,
        force: force);
    borderColor = pickStyle(borderColor, source.borderColor, force: force);
    fontSize = pickStyle(fontSize, source.fontSize, force: force);
    cursor = pickStyle(cursor, source.cursor, force: force);
    textAlign = pickStyle(textAlign, source.textAlign, force: force);
    verticalAlign =
        pickStyle(verticalAlign, source.verticalAlign, force: force);
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

    boxShadow = pickStyle(boxShadow, source.boxShadow, force: force);
    gradient = pickStyle(gradient, source.gradient, force: force);
    backgroundBlendMode = pickStyle(
        backgroundBlendMode, source.backgroundBlendMode,
        force: force);
    backgroundImage =
        pickStyle(backgroundImage, source.backgroundImage, force: force);

    opacity = pickStyle(opacity, source.opacity, force: force);

    overflow = pickStyle(overflow, source.overflow, force: force);
    source.clazz.forEach((element) {
      if (!clazz.contains(element)) clazz.add(element);
    });

    return this;
  }

  T? pickStyle<T>(T? target, T? source, {bool force = false}) {
    if (force) {
      if (source != null) {
        return source;
      }
    }
    if (target is BaseStyle && source is BaseStyle) {
      target.merge(source);
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

class Clazz {
  static String iconSuf = '--icon';
  static String squareSuf = '--square';
  static String circleSuf = '--circle';

  // position
  static String horizontalSuf = '--horizontal';
  static String verticalSuf = '--vertical';

  static String isCollapse = '--collapse';

  // type
  static String titleSuf = '__title';
  static String contentSuf = '__content';
  static String iconArrowSuf = '__icon-arrow';
  static String popupSuf = '--popup';

  static String focus = ':focus';
  static String hover = ':hover';
  static String active = ':active';

  static String firstChild = ':first-child';
  static String lastChild = ':last-child';

  static String isPlain = '.is-plain';
  static String isDisabled = '.is-disabled';
  static String isActive = '.is-active';
  static String isRound = '.is-round';
  static String isCircle = '.is-circle';
  static String isLoading = '.is-loading';
  static String isOpened = '.is-opened';

  static String primarySuf = '--primary';
  static String successSuf = '--success';
  static String infoSuf = '--info';
  static String warningSuf = '--warning';
  static String dangerSuf = '--danger';
  static String textSuf = '--text';

  static String miniSuf = '--mini';
  static String smallSuf = '--small';
  static String mediumSuf = '--medium';
  static String largeSuf = '--large';

  static String button = '.button';
  static String buttonGroup = '.button-group';

  static String container = '.container';
  static String main = '.main';
  static String aside = '.aside';
  static String header = '.header';
  static String footer = '.footer';

  static String containerLayout = '.container-layout';

  static String avatar = '.avatar';

  static String badge = '.badge';

  static String decriptions = '.decriptions';

  static String empty = '.empty';
  static String pagination = '.pagination';
  static String progress = '.progress';
  static String result = '.result';
  static String skeleton = '.skeleton';
  static String table = '.table';
  static String tag = '.tag';
  static String tree = '.tree';
  static String cascader = '.cascader';
  static String checkbox = '.checkbox';
  static String colorPicker = '.color-picker';
  static String datePicker = '.date-picker';
  static String dateTimePicker = '.date-time-picker';
  static String inputNumber = '.input-number';
  static String input = '.input';
  static String radio = '.radio';
  static String radioGroup = '.radio-group';
  static String rate = '.rate';
  static String select = '.select';
  static String slider = '.slider';
  static String swatch = '.swatch';
  static String timePicker = '.time-picker';
  static String transfer = '.transfer';
  static String upload = '.upload';
  static String breadcrumb = '.breadcrumb';
  static String dropdown = '.dropdown';
  static String menu = '.menu';
  static String submenu = '.submenu';
  static String menuItemGroup = '.menu-item-group';
  static String menuItem = '.menu-item';
  static String pageHeader = '.page-header';
  static String steps = '.steps';
  static String tabs = '.tabs';
  static String alert = '.alert';
  static String loading = '.loading';
  static String message = '.message';
  static String messageBox = '.message-box';
  static String notification = '.notification';
  static String backtop = '.backtop';
  static String calendar = '.calendar';
  static String card = '.card';
  static String carousel = '.carousel';
  static String collapse = '.collapse';
  static String dialog = '.dialog';
  static String divider = '.divider';
  static String drawer = '.drawer';
  static String image = '.image';
  static String infiniteScroll = '.infinite-scroll';
  static String popconfirm = '.popconfirm';
  static String popover = '.popover';
  static String timeline = '.timeline';
  static String tooltip = '.tooltip';
  static String form = '.form';

  static String radioButton = '.radio-button';
}
