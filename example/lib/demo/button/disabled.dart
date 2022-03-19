import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';
import '../demos.dart';

var buttonDisabled = Demo(
  'buttonDisabled',
  Wrap(
    runSpacing: 8,
    children: [
      Row(
        children: [
          Wrap(
            spacing: 8,
            children: [
              WButton()
                ..$props.disabled = true
                ..$slots.$ = '默认按钮',
              WButton()
                ..$props.disabled = true
                ..$props.type = 'primary'
                ..$slots.$ = '主要按钮',
              WButton()
                ..$props.disabled = true
                ..$props.type = 'success'
                ..$slots.$ = '成功按钮',
              WButton()
                ..$props.disabled = true
                ..$props.type = 'info'
                ..$slots.$ = '信息按钮',
              WButton()
                ..$props.disabled = true
                ..$props.type = 'warning'
                ..$slots.$ = '警告按钮',
              WButton()
                ..$props.disabled = true
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
                ..$props.disabled = true
                ..$props.plain = true
                ..$slots.$ = '默认按钮',
              WButton()
                ..$props.type = 'primary'
                ..$props.disabled = true
                ..$props.plain = true
                ..$slots.$ = '主要按钮',
              WButton()
                ..$props.type = 'success'
                ..$props.disabled = true
                ..$props.plain = true
                ..$slots.$ = '成功按钮',
              WButton()
                ..$props.type = 'info'
                ..$props.disabled = true
                ..$props.plain = true
                ..$slots.$ = '信息按钮',
              WButton()
                ..$props.type = 'warning'
                ..$props.disabled = true
                ..$props.plain = true
                ..$slots.$ = '警告按钮',
              WButton()
                ..$props.type = 'danger'
                ..$props.disabled = true
                ..$props.plain = true
                ..$slots.$ = '危险按钮',
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
              WButton()
                ..$props.disabled = true
                ..$slots.$ = '默认按钮',
              WButton()
                ..$props.disabled = true
                ..$props.type = 'primary'
                ..$slots.$ = '主要按钮',
              WButton()
                ..$props.disabled = true
                ..$props.type = 'success'
                ..$slots.$ = '成功按钮',
              WButton()
                ..$props.disabled = true
                ..$props.type = 'info'
                ..$slots.$ = '信息按钮',
              WButton()
                ..$props.disabled = true
                ..$props.type = 'warning'
                ..$slots.$ = '警告按钮',
              WButton()
                ..$props.disabled = true
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
                ..$props.disabled = true
                ..$props.plain = true
                ..$slots.$ = '默认按钮',
              WButton()
                ..$props.type = 'primary'
                ..$props.disabled = true
                ..$props.plain = true
                ..$slots.$ = '主要按钮',
              WButton()
                ..$props.type = 'success'
                ..$props.disabled = true
                ..$props.plain = true
                ..$slots.$ = '成功按钮',
              WButton()
                ..$props.type = 'info'
                ..$props.disabled = true
                ..$props.plain = true
                ..$slots.$ = '信息按钮',
              WButton()
                ..$props.type = 'warning'
                ..$props.disabled = true
                ..$props.plain = true
                ..$slots.$ = '警告按钮',
              WButton()
                ..$props.type = 'danger'
                ..$props.disabled = true
                ..$props.plain = true
                ..$slots.$ = '危险按钮',
            ],
          ),
        ],
      ),
    ],
  )
  ''',
);
