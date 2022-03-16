import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';
import '../demos.dart';

var buttonSize = Demo(
  'buttonSize',
  Row(
    children: [
      Wrap(
        alignment: WrapAlignment.center,
        spacing: 8,
        children: [
          WButton()
            ..$props.size = 'mini'
            ..$slots.$ = 'mini',
          WButton()
            ..$props.size = 'small'
            ..$slots.$ = 'small',
          WButton()
            ..$props.size = 'medium'
            ..$slots.$ = 'medium',
          WButton()
            ..$props.size = 'large'
            ..$slots.$ = 'large',
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
          ..$props.size = 'mini'
          ..$slots.$ = 'mini',
        WButton()
          ..$props.size = 'small'
          ..$slots.$ = 'small',
        WButton()
          ..$props.size = 'medium'
          ..$slots.$ = 'medium',
        WButton()
          ..$props.size = 'large'
          ..$slots.$ = 'large',
      ],
    ),
  ],
)
  ''',
);
