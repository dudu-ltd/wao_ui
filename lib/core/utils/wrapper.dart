import 'package:flutter/material.dart';

Widget borderWrapper(Widget child, Border? border, bool needBorder,
    {EdgeInsets? padding, EdgeInsets? margin}) {
  if (needBorder) {
    return Container(
      decoration: BoxDecoration(
        border: border,
      ),
      padding: padding,
      margin: margin,
      child: child,
    );
  }
  return child;
}

Widget paddingWrapper(Widget child, EdgeInsets padding, needPadding) {
  if (needPadding) {
    return Padding(
      padding: padding,
      child: child,
    );
  }
  return child;
}

Widget marginWrapper(Widget child, EdgeInsets margin, {needMargin = true}) {
  if (needMargin) {
    return Container(
      child: child,
      margin: margin,
    );
  }
  return child;
}

Widget colorWrapper(Widget child, Color color, needColor) {
  if (needColor) {
    return ColoredBox(
      color: color,
      child: child,
    );
  }
  return child;
}

Widget sizedScrollWrapper(child, height, width, needSized) {
  if (needSized) {
    if (child is List<Widget>) {
      child = ListView(children: child);
    } else {
      child = SingleChildScrollView(child: child);
    }
    return SizedBox(
      child: child,
      height: height,
      width: width,
    );
  }
  return child;
}

Widget expandedScrollWrapper(child, needExpanded) {
  if (needExpanded) {
    if (child is List<Widget>) {
      child = ListView(children: child);
    } else {
      child = SingleChildScrollView(child: child);
    }
    return Expanded(child: child);
  }
  return child;
}

Widget constWrapper(child, BoxConstraints constraints, needConst) {
  if (needConst) {
    return ConstrainedBox(
      constraints: constraints,
      child: child,
    );
  }
  return child;
}
