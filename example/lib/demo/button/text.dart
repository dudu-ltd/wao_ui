import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';
import '../demos.dart';

var buttonText = Demo(
  'buttonText',
  Row(
    children: [
      Wrap(
        alignment: WrapAlignment.center,
        spacing: 8,
        children: [
          WButton()
            ..$props.type = 'text'
            ..$slots.$ = '文字按钮',
          WButton()
            ..$props.type = 'text'
            ..$props.disabled = true
            ..$slots.$ = '文字按钮',
        ],
      ),
    ],
  ),
  r'''
  Row(
    children: [
      Wrap(
        alignment: WrapAlignment.center,
        spacing: 8,
        children: [
          WButton()
            ..$props.type = 'text'
            ..$slots.$ = '文字按钮',
          WButton()
            ..$props.type = 'text'
            ..$props.disabled = true
            ..$slots.$ = '文字按钮',
        ],
      ),
    ],
  )
  ''',
);
