import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';
import '../demos.dart';

var buttonBasic = Demo(
  'buttonBasic',
  Wrap(
    runSpacing: 8,
    children: [
      Row(
        children: [
          Wrap(
            spacing: 8,
            children: [
              WButton()
                ..$slots.$ = '默认按钮'
                ..$on.click = () => print('ttttttttttt'),
              WButton()
                ..$props.type = 'primary'
                ..$slots.$ = '主要按钮',
              WButton()
                ..$props.type = 'success'
                ..$slots.$ = '成功按钮',
              WButton()
                ..$props.type = 'info'
                ..$slots.$ = '信息按钮',
              WButton()
                ..$props.type = 'warning'
                ..$slots.$ = '警告按钮',
              WButton()
                ..$props.type = 'danger'
                ..$slots.$ = '危险按钮',
            ],
          ),
        ],
      ),
      Row(
        children: [
          Wrap(
            spacing: 8,
            children: [
              WButton()
                ..$props.plain = true
                ..$slots.$ = '默认按钮',
              WButton()
                ..$props.plain = true
                ..$props.type = 'primary'
                ..$slots.$ = '主要按钮',
              WButton()
                ..$props.plain = true
                ..$props.type = 'success'
                ..$slots.$ = '成功按钮',
              WButton()
                ..$props.plain = true
                ..$props.type = 'info'
                ..$slots.$ = '信息按钮',
              WButton()
                ..$props.plain = true
                ..$props.type = 'warning'
                ..$slots.$ = '警告按钮',
              WButton()
                ..$props.plain = true
                ..$props.type = 'danger'
                ..$slots.$ = '危险按钮',
            ],
          ),
        ],
      ),
      Row(
        children: [
          Wrap(
            spacing: 8,
            children: [
              WButton()
                ..$props.round = true
                ..$slots.$ = '默认按钮',
              WButton()
                ..$props.type = 'primary'
                ..$props.round = true
                ..$slots.$ = '主要按钮',
              WButton()
                ..$props.type = 'success'
                ..$props.round = true
                ..$slots.$ = '成功按钮',
              WButton()
                ..$props.type = 'info'
                ..$props.round = true
                ..$slots.$ = '信息按钮',
              WButton()
                ..$props.type = 'warning'
                ..$props.round = true
                ..$slots.$ = '警告按钮',
              WButton()
                ..$props.type = 'danger'
                ..$props.round = true
                ..$slots.$ = '危险按钮',
            ],
          ),
        ],
      ),
      Row(
        children: [
          Wrap(
            spacing: 8,
            children: [
              WButton()
                ..$props.circle = true
                ..$slots.$ = Icons.search,
              WButton()
                ..$props.type = 'primary'
                ..$props.circle = true
                ..$slots.$ = Icons.edit,
              WButton()
                ..$props.type = 'success'
                ..$props.circle = true
                ..$slots.$ = Icons.check,
              WButton()
                ..$props.type = 'info'
                ..$props.circle = true
                ..$slots.$ = Icons.message,
              WButton()
                ..$props.type = 'warning'
                ..$props.circle = true
                ..$slots.$ = Icons.star,
              WButton()
                ..$props.type = 'danger'
                ..$props.circle = true
                ..$slots.$ = Icons.delete,
            ],
          ),
        ],
      ),
    ],
  ),
  r'''
  Wrap(
    runSpacing: 8,
    children: [
      Row(
        children: [
          Wrap(
            spacing: 8,
            children: [
              WButton()..$slots.$ = '默认按钮',
              WButton()
                ..$props.type = 'primary'
                ..$slots.$ = '主要按钮',
              WButton()
                ..$props.type = 'success'
                ..$slots.$ = '成功按钮',
              WButton()
                ..$props.type = 'info'
                ..$slots.$ = '信息按钮',
              WButton()
                ..$props.type = 'warning'
                ..$slots.$ = '警告按钮',
              WButton()
                ..$props.type = 'danger'
                ..$slots.$ = '危险按钮',
            ],
          ),
        ],
      ),
      Row(
        children: [
          Wrap(
            spacing: 8,
            children: [
              WButton()
                ..$props.plain = true
                ..$slots.$ = '默认按钮',
              WButton()
                ..$props.plain = true
                ..$props.type = 'primary'
                ..$slots.$ = '主要按钮',
              WButton()
                ..$props.plain = true
                ..$props.type = 'success'
                ..$slots.$ = '成功按钮',
              WButton()
                ..$props.plain = true
                ..$props.type = 'info'
                ..$slots.$ = '信息按钮',
              WButton()
                ..$props.plain = true
                ..$props.type = 'warning'
                ..$slots.$ = '警告按钮',
              WButton()
                ..$props.plain = true
                ..$props.type = 'danger'
                ..$slots.$ = '危险按钮',
            ],
          ),
        ],
      ),
      Row(
        children: [
          Wrap(
            spacing: 8,
            children: [
              WButton()
                ..$props.round = true
                ..$slots.$ = '默认按钮',
              WButton()
                ..$props.type = 'primary'
                ..$props.round = true
                ..$slots.$ = '主要按钮',
              WButton()
                ..$props.type = 'success'
                ..$props.round = true
                ..$slots.$ = '成功按钮',
              WButton()
                ..$props.type = 'info'
                ..$props.round = true
                ..$slots.$ = '信息按钮',
              WButton()
                ..$props.type = 'warning'
                ..$props.round = true
                ..$slots.$ = '警告按钮',
              WButton()
                ..$props.type = 'danger'
                ..$props.round = true
                ..$slots.$ = '危险按钮',
            ],
          ),
        ],
      ),
      Row(
        children: [
          Wrap(
            spacing: 8,
            children: [
              WButton()
                ..$props.circle = true
                ..$slots.$ = Icons.search,
              WButton()
                ..$props.type = 'primary'
                ..$props.circle = true
                ..$slots.$ = Icons.edit,
              WButton()
                ..$props.type = 'success'
                ..$props.circle = true
                ..$slots.$ = Icons.check,
              WButton()
                ..$props.type = 'info'
                ..$props.circle = true
                ..$slots.$ = Icons.delete,
              WButton()
                ..$props.type = 'warning'
                ..$props.circle = true
                ..$slots.$ = Icons.message,
              WButton()
                ..$props.type = 'danger'
                ..$props.circle = true
                ..$slots.$ = Icons.message,
            ],
          ),
        ],
      ),
    ],
  );
  ''',
);
