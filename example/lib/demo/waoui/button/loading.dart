import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';
import '../../demos.dart';

var buttonLoading = Demo(
  'buttonLoading',
  Row(
    children: [
      WButton()
        ..$props.type = 'primary'
        ..$props.loading = true
        ..$slots.$ = '加载中'
    ],
  ),
  r'''
Row(
  children: [
    WButton()
      ..$props.loading = true
      ..$slots.$ = '加载中'
  ],
)
  ''',
);
