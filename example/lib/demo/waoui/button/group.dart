import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';
import '../../demos.dart';

var buttonGroup = Demo(
  'buttonGroup',
  Row(
    children: [
      Wrap(
        direction: Axis.vertical,
        spacing: 20,
        children: [
          Row(
            children: [
              Wrap(
                spacing: 10,
                children: [
                  WButtonGroup()
                    ..$slots.$ = [
                      WButton()
                        ..$props.type = 'primary'
                        ..$props.icon = Icons.arrow_back_ios
                        ..$slots.$ = '上一页',
                      WButton()
                        ..$props.type = 'primary'
                        ..$props.iconRight = Icons.arrow_forward_ios
                        ..$slots.$ = '下一页',
                    ],
                  WButtonGroup()
                    ..$slots.$ = [
                      WButton()
                        ..$props.type = 'primary'
                        ..$props.icon = Icons.edit,
                      WButton()
                        ..$props.type = 'primary'
                        ..$props.icon = Icons.share,
                      WButton()
                        ..$props.type = 'primary'
                        ..$props.icon = Icons.delete,
                    ],
                ],
              ),
            ],
          ),
          Row(
            children: [
              Wrap(
                spacing: 10,
                children: [
                  WButtonGroup()
                    ..$slots.$ = [
                      WButton()
                        ..$props.circle = true
                        ..$props.type = 'primary'
                        ..$props.icon = Icons.edit,
                      WButton()
                        ..$props.circle = true
                        ..$props.type = 'primary'
                        ..$props.icon = Icons.share,
                      WButton()
                        ..$props.circle = true
                        ..$props.type = 'primary'
                        ..$props.icon = Icons.delete,
                    ],
                  WButtonGroup()
                    ..$slots.$ = [
                      WButton()
                        ..$props.round = true
                        ..$props.type = 'primary'
                        ..$props.icon = Icons.edit,
                      WButton()
                        ..$props.round = true
                        ..$props.type = 'success'
                        ..$props.icon = Icons.share,
                      WButton()
                        ..$props.round = true
                        ..$props.type = 'primary'
                        ..$props.icon = Icons.delete,
                    ],
                ],
              )
            ],
          )
        ],
      ),
    ],
  ),
  r'''
Container()
  ''',
);
