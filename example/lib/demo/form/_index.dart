import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  var model = {
    'name': 'CorvusY',
    'gender': 'F',
    'exp': 4,
    'skills': ['1', '2', '3', '4'],
    'introduce': '忠于本心，专注技术。',
  };
  var refForm;
  var formBasic = Demo(
    'formBasic',
    refForm = WForm()
      ..$props.labelWidth = 100
      ..$props.model = model
      ..$slots.$ = [
        WFormItem()
          ..$props.prop = 'name'
          ..$props.label = '姓名  '
          ..$slots.$ =
              (WInput()..$on.change = ((p0) => print('- print for debug $p0'))),
        WFormItem()
          ..$props.prop = 'gender'
          ..$props.label = '性别  '
          ..$slots.$ = (WRadioGroup()
            ..$slots.$ = [
              WRadio()
                ..$props.border = true
                ..$props.label = 'F'
                ..$slots.$ = '男',
              WRadio()
                ..$props.border = true
                ..$props.label = 'M'
                ..$slots.$ = '女',
            ]),
        WFormItem()
          ..$props.prop = 'exp'
          ..$props.label = '工作年限  '
          ..$slots.$ = (WSelect()
            ..$props.clearable = true
            ..$slots.$ = [
              WOption()
                ..$props.label = '实习生'
                ..$props.value = 1,
              WOption()
                ..$props.label = '1~3年'
                ..$props.value = 2,
              WOption()
                ..$props.label = '3~8年'
                ..$props.value = 3,
              WOption()
                ..$props.label = '8年以上'
                ..$props.value = 4
            ]),
        WFormItem()
          ..$props.prop = 'skills'
          ..$props.label = '技术栈  '
          ..$slots.$ = (WCheckboxGroup()
            ..$slots.$ = [
              WCheckbox()
                ..$props.border = true
                ..$props.label = '1'
                ..$slots.$ = 'Java',
              WCheckbox()
                ..$props.border = true
                ..$props.label = '2'
                ..$slots.$ = 'Flutter',
              WCheckbox()
                ..$props.border = true
                ..$props.label = '3'
                ..$slots.$ = 'JS',
              WCheckbox()
                ..$props.border = true
                ..$props.label = '4'
                ..$slots.$ = 'Vue',
              WCheckbox()
                ..$props.border = true
                ..$props.label = '5'
                ..$slots.$ = 'C++',
              WCheckbox()
                ..$props.border = true
                ..$props.label = '6'
                ..$slots.$ = 'Python',
            ]),
        WFormItem()
          ..$props.prop = 'introduce'
          ..$props.label = '个人简介  '
          ..$slots.$ = (WInput()..$props.type = 'textarea'),
        WFormItem()
          // ..$props.label = '  '
          ..$slots.$ = (WButtonGroup()
            ..$slots.$ = [
              WButton()
                ..$on.click =
                    (() => debugPrint(const JsonEncoder().convert(model)))
                ..$props.type = 'primary'
                ..$slots.$ = '保存',
              WButton()
                // ..$props.type = ''
                ..$slots.$ = '重置'
                ..$on.click = () => refForm.reset(),
            ]),
      ],
    r'''
  var model = {
    'name': 'CorvusY',
    'gender': 'F',
    'exp': 4,
    'skills': ['1', '2', '3', '4'],
    'introduce': '忠于本心，服务大众。'
  };

  WForm()
  ..$props.labelWidth = 100
  ..$props.model = model
  ..$slots.$ = [
    WFormItem()
      ..$props.prop = 'name'
      ..$props.label = '姓名  '
      ..$slots.$ = WInput(),
    WFormItem()
      ..$props.prop = 'gender'
      ..$props.label = '性别  '
      ..$slots.$ = (WRadioGroup()
        ..$slots.$ = [
          WRadio()
            ..$props.border = true
            ..$props.label = 'F'
            ..$slots.$ = '男',
          WRadio()
            ..$props.border = true
            ..$props.label = 'M'
            ..$slots.$ = '女',
        ]),
    WFormItem()
      ..$props.prop = 'exp'
      ..$props.label = '工作年限  '
      ..$slots.$ = (WSelect()
        ..$props.clearable = true
        ..$slots.$ = [
          WOption()
            ..$props.label = '实习生'
            ..$props.value = 1,
          WOption()
            ..$props.label = '1~3年'
            ..$props.value = 2,
          WOption()
            ..$props.label = '3~8年'
            ..$props.value = 3,
          WOption()
            ..$props.label = '8年以上'
            ..$props.value = 4
        ]),
    WFormItem()
      ..$props.prop = 'skills'
      ..$props.label = '技术栈  '
      ..$slots.$ = (WCheckboxGroup()
        ..$slots.$ = [
          WCheckbox()
            ..$props.border = true
            ..$props.label = '1'
            ..$slots.$ = 'Java',
          WCheckbox()
            ..$props.border = true
            ..$props.label = '2'
            ..$slots.$ = 'Flutter',
          WCheckbox()
            ..$props.border = true
            ..$props.label = '3'
            ..$slots.$ = 'JS',
          WCheckbox()
            ..$props.border = true
            ..$props.label = '4'
            ..$slots.$ = 'Vue',
          WCheckbox()
            ..$props.border = true
            ..$props.label = '5'
            ..$slots.$ = 'C++',
          WCheckbox()
            ..$props.border = true
            ..$props.label = '6'
            ..$slots.$ = 'Python',
        ]),
    WFormItem()
      ..$props.prop = 'introduce'
      ..$props.label = '个人简介  '
      ..$slots.$ = (WInput()..$props.type = 'textarea'),
    WFormItem()
      // ..$props.label = '  '
      ..$slots.$ = (WButtonGroup()
        ..$slots.$ = [
          WButton()
            ..$on.click =
                (() => debugPrint(const JsonEncoder().convert(model)))
            ..$props.type = 'primary'
            ..$slots.$ = '保存',
          WButton()
            // ..$props.type = ''
            ..$slots.$ = '重置'
        ]),
  ]
    ''',
  );

  var modelInline = {};

  var formInline = Demo(
    'formInline',
    WForm()
      ..$props.model = modelInline
      ..$props.inline = true
      ..$slots.$ = [
        WFormItem()
          ..$props.prop = 'name'
          ..$props.label = '姓名  '
          ..$slots.$ = WInput(),
        WFormItem()
          ..$style.width = 300
          ..$props.prop = 'exp'
          ..$props.label = '工作年限  '
          ..$slots.$ = (WSelect()
            ..$props.clearable = true
            ..$slots.$ = [
              WOption()
                ..$props.label = '实习生'
                ..$props.value = 1,
              WOption()
                ..$props.label = '1~3年'
                ..$props.value = 2,
              WOption()
                ..$props.label = '3~8年'
                ..$props.value = 3,
              WOption()
                ..$props.label = '8年以上'
                ..$props.value = 4
            ]),
        WFormItem()
          // ..$props.label = '  '
          ..$slots.$ = (WButtonGroup()
            ..$slots.$ = [
              WButton()
                ..$on.click =
                    (() => debugPrint(const JsonEncoder().convert(modelInline)))
                ..$props.type = 'primary'
                ..$slots.$ = '查询',
            ])
      ],
    r'''
  var modelInline = {};

  WForm()
    ..$props.model = modelInline
    ..$props.inline = true
    ..$slots.$ = [
      WFormItem()
        ..$props.prop = 'name'
        ..$props.label = '姓名  '
        ..$slots.$ = WInput(),
      WFormItem()
        ..$style.width = 300
        ..$props.prop = 'exp'
        ..$props.label = '工作年限  '
        ..$slots.$ = (WSelect()
          ..$props.clearable = true
          ..$slots.$ = [
            WOption()
              ..$props.label = '实习生'
              ..$props.value = 1,
            WOption()
              ..$props.label = '1~3年'
              ..$props.value = 2,
            WOption()
              ..$props.label = '3~8年'
              ..$props.value = 3,
            WOption()
              ..$props.label = '8年以上'
              ..$props.value = 4
          ]),
      WFormItem()
        // ..$props.label = '  '
        ..$slots.$ = (WButtonGroup()
          ..$slots.$ = [
            WButton()
              ..$on.click =
                  (() => debugPrint(const JsonEncoder().convert(modelInline)))
              ..$props.type = 'primary'
              ..$slots.$ = '查询',
          ])
    ],
    ''',
  );
}
