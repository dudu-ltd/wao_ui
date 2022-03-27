import 'package:flutter/material.dart';
import 'package:wao_ui/src/basic/w_button.dart';
import 'package:wao_ui/wao_ui.dart';

import '../../main.dart';

class ApiButton extends StatelessWidget {
  const ApiButton({Key? key}) : super(key: key);

  static Widget basic = Wrap(
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
                ..$props.type = 'warning'
                ..$slots.$ = '警告按钮',
              WButton()
                ..$props.type = 'danger'
                ..$slots.$ = '危险按钮',
              WButton()
                ..$props.type = 'info'
                ..$slots.$ = '信息按钮',
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
                ..$props.type = 'primary'
                ..$props.plain = true
                ..$slots.$ = '主要按钮',
              WButton()
                ..$props.type = 'success'
                ..$props.plain = true
                ..$slots.$ = '成功按钮',
              WButton()
                ..$props.type = 'warning'
                ..$props.plain = true
                ..$slots.$ = '警告按钮',
              WButton()
                ..$props.type = 'danger'
                ..$props.plain = true
                ..$slots.$ = '危险按钮',
              WButton()
                ..$props.type = 'info'
                ..$props.plain = true
                ..$slots.$ = '信息按钮',
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
                ..$props.type = 'warning'
                ..$props.round = true
                ..$slots.$ = '警告按钮',
              WButton()
                ..$props.type = 'danger'
                ..$props.round = true
                ..$slots.$ = '危险按钮',
              WButton()
                ..$props.type = 'info'
                ..$props.round = true
                ..$slots.$ = '信息按钮',
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
                ..$props.type = 'warning'
                ..$props.circle = true
                ..$slots.$ = Icons.message,
              WButton()
                ..$props.type = 'danger'
                ..$props.circle = true
                ..$slots.$ = Icons.message,
              WButton()
                ..$props.type = 'info'
                ..$props.circle = true
                ..$slots.$ = Icons.delete,
            ],
          ),
        ],
      ),
    ],
  );

  static Widget disabled = Wrap(
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
                ..$props.type = 'warning'
                ..$slots.$ = '警告按钮',
              WButton()
                ..$props.disabled = true
                ..$props.type = 'danger'
                ..$slots.$ = '危险按钮',
              WButton()
                ..$props.disabled = true
                ..$props.type = 'info'
                ..$slots.$ = '信息按钮',
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
                ..$props.type = 'warning'
                ..$props.disabled = true
                ..$props.plain = true
                ..$slots.$ = '警告按钮',
              WButton()
                ..$props.type = 'danger'
                ..$props.disabled = true
                ..$props.plain = true
                ..$slots.$ = '危险按钮',
              WButton()
                ..$props.type = 'info'
                ..$props.disabled = true
                ..$props.plain = true
                ..$slots.$ = '信息按钮',
            ],
          ),
        ],
      ),
    ],
  );

  static Widget text = Row(
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
  );

  static Widget icon = Row(
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
  );

  // static Widget group = WButtonGroup()

  static Widget loading = Row(
    children: [
      WButton()
        ..$props.loading = true
        ..$slots.$ = '加载中'
    ],
  );

  static Widget size = Row(
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
  );
  @override
  Widget build(BuildContext context) {
    var result = ListView(
      children: [
        basic,
        disabled,
        size,
      ],
    );
    return result;
  }
}
