import 'package:flutter/cupertino.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  var model = {
    'name': 'CorvusY',
    'gender': 'F',
    'exp': '1',
    'skills': ['1', '2'],
    'introduce': '忠于本心，服务大众。'
  };

  var formBasic = Demo(
    'formBasic',
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
            ..$props.value = []
            ..$slots.$ = [
              WOption()
                ..$props.label = '1年'
                ..$props.value = 1,
              WOption()
                ..$props.label = '2年'
                ..$props.value = 2
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
                ..$props.type = 'primary'
                ..$slots.$ = '保存',
              WButton()
                // ..$props.type = ''
                ..$slots.$ = '重置'
            ]),
      ],
    r'''
  WForm()..$slots.$ = []
    ''',
  );
}
