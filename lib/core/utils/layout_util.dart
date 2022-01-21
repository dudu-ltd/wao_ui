import 'package:flutter/material.dart';

Rect getPosition(BuildContext context) {
  // flutter\packages\flutter\lib\src\material\dropdown.dart #line: 1259 ~ 1262
  final NavigatorState navigator = Navigator.of(context);
  final RenderBox itemBox = context.findRenderObject()! as RenderBox;
  final Rect itemRect = itemBox.localToGlobal(Offset.zero,
          ancestor: navigator.context.findRenderObject()) &
      itemBox.size;
  return itemRect;
}
