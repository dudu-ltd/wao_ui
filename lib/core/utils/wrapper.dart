import 'package:flutter/material.dart';

Widget borderWrapper(Widget child, Border border, bool needBorder) {
  if (needBorder) {
    return Container(
      decoration: BoxDecoration(
        border: border,
      ),
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

Widget colorWrapper(Widget child, Color color, needColor) {
  if (needColor) {
    return ColoredBox(
      color: color,
      child: child,
    );
  }
  return child;
}
