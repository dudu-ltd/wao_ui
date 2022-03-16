import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';
import '../demos.dart';

var buttonIcon = Demo(
  'buttonIcon',
  Row(
    children: [
      Wrap(
        spacing: 8,
        children: [
          WButton()
            ..$props.type = 'primary'
            ..$props.icon = Icons.edit,
          WButton()
            ..$props.type = 'primary'
            ..$props.icon = Icons.share,
          WButton()
            ..$props.type = 'primary'
            ..$props.icon = Icons.delete,
          WButton()
            ..$props.type = 'primary'
            ..$props.icon = Icons.search
            ..$slots.$ = '搜索',
          WButton()
            ..$props.type = 'primary'
            ..$props.icon = Icons.upload
            ..$slots.$ = '上传',
        ],
      ),
    ],
  ),
  r'''
Row(
  children: [
    Wrap(
      spacing: 8,
      children: [
        WButton()
          ..$props.type = 'primary'
          ..$props.icon = Icons.edit,
        WButton()
          ..$props.type = 'primary'
          ..$props.icon = Icons.share,
        WButton()
          ..$props.type = 'primary'
          ..$props.icon = Icons.delete,
        WButton()
          ..$props.type = 'primary'
          ..$props.icon = Icons.search
          ..$slots.$ = '搜索',
        WButton()
          ..$props.type = 'primary'
          ..$props.icon = Icons.upload
          ..$slots.$ = '上传',
      ],
    ),
  ],
)
  ''',
);
