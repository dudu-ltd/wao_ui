import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_style.dart';
import 'package:wao_ui/wao_ui.dart';

import '../../demos.dart';

regist() {
  WDialog? d = null;
  var dialogBasic = Demo(
    'dialogBasic',
    d = WDialog()
      ..$props.btn = '带标题弹窗'
      ..$props.top = '400px'
      ..$slots.$ = '带标题弹窗'
      ..$slots.title = const Text('提示')
      ..$style.footSpace = 8
      ..$slots.footer = [
        WButton()
          ..$slots.$ = '取消'
          ..$props.size = 'mini'
          ..$on.click = () => d?.$props.visible = false,
        WButton()
          ..$props.type = 'primary'
          ..$slots.$ = '确定'
          ..$props.size = 'mini'
          ..$on.click = () => d?.$props.visible = false,
      ],
    r'''
    WDialog? d = null;
    d = WDialog()
      ..$props.btn = '带标题弹窗'
      ..$props.top = '400px'
      ..$slots.$ = '带标题弹窗'
      ..$slots.title = const Text('提示')
      ..$style.footSpace = 8
      ..$slots.footer = [
        WButton()
          ..$slots.$ = '取消'
          ..$props.size = 'mini'
          ..$on.click = () => d?.$props.visible = false,
        WButton()
          ..$props.type = 'primary'
          ..$slots.$ = '确定'
          ..$props.size = 'mini'
          ..$on.click = () => d?.$props.visible = false,
      ],
    ''',
  );

  WDialog? noTitleDialog;
  var dialogNoTitle = Demo(
    'dialogNoTitle',
    noTitleDialog = WDialog()
      ..$props.btn = '无标题弹窗'
      ..$props.top = '400px'
      ..$slots.$ = '无标题弹窗'
      ..$style.footSpace = 8
      ..$slots.footer = [
        WButton()
          ..$slots.$ = '取消'
          ..$props.size = 'mini'
          ..$on.click = () => noTitleDialog?.$props.visible = false,
        WButton()
          ..$props.type = 'primary'
          ..$slots.$ = '确定'
          ..$props.size = 'mini'
          ..$on.click = () => noTitleDialog?.$props.visible = false,
      ],
    r'''
    WDialog? noTitleDialog = null;
    noTitleDialog = WDialog()
      ..$props.btn = '标题弹窗'
      ..$props.top = '400px'
      ..$slots.$ = '标题弹窗'
      ..$style.footSpace = 8
      ..$slots.footer = [
        WButton()
          ..$slots.$ = '取消'
          ..$props.size = 'mini'
          ..$on.click = () => d?.$props.visible = false,
        WButton()
          ..$props.type = 'primary'
          ..$slots.$ = '确定'
          ..$props.size = 'mini'
          ..$on.click = () => d?.$props.visible = false,
      ],
    ''',
  );

  CfgGlobal.css.addAll({
    [
      [Clazz.button, '.colorful-btn']
    ]: WButtonStyle()
      ..gradient = const LinearGradient(colors: [Colors.pink, Colors.orange]),
    [
      [Clazz.button, '.colorful-btn', Clazz.hover]
    ]: WButtonStyle()
      ..gradient = LinearGradient(
          colors: [Colors.pink.shade800, Colors.orange.shade800]),
    [
      [Clazz.button, '.colorful-btn', Clazz.active]
    ]: WButtonStyle()
      ..gradient = LinearGradient(
          colors: [Colors.pink.shade900, Colors.orange.shade900]),
  });

  WDialog? titleDialogCircleBtn;
  var dialogCircleBtn = Demo(
    'dialogCircleBtn',
    titleDialogCircleBtn = WDialog()
      ..$props.btn = '居中的 圆角按钮确认键的 标题弹窗'
      ..$props.top = '400px'
      ..$slots.$ = '爱而不得不遗憾，\n得而不爱才遗憾。\n愿我们不论什么时候，\n都有直面自己内心的勇气。'
      ..$props.title = '提示'
      ..$style.footSpace = 0
      ..$props.center = true
      ..$slots.footer = [
        WButton()
          ..$props.type = 'primary'
          ..$slots.$ = '记下了'
          ..$props.size = 'mini'
          ..$style.width = 200
          ..$props.round = true
          ..$style.clazz.add('.colorful-btn')
          ..$on.click = () => titleDialogCircleBtn?.$props.visible = false,
      ],
    r'''
    CfgGlobal.css.addAll({
      [
        [Clazz.button, '.colorful-btn']
      ]: WButtonStyle()
        ..gradient = const LinearGradient(colors: [Colors.green, Colors.orange]),
      [
        [Clazz.button, '.colorful-btn', Clazz.hover]
      ]: WButtonStyle()
        ..gradient = LinearGradient(
            colors: [Colors.green.shade800, Colors.orange.shade800]),
      [
        [Clazz.button, '.colorful-btn', Clazz.active]
      ]: WButtonStyle()
        ..gradient = LinearGradient(
            colors: [Colors.green.shade900, Colors.orange.shade900]),
    });
    WDialog? titleDialogCircleBtn;
    titleDialogCircleBtn = WDialog()
      ..$props.btn = '无标题弹窗'
      ..$props.top = '400px'
      ..$slots.$ = '无标题弹窗'
      ..$props.title = '提示'
      ..$style.footSpace = 8
      ..$props.center = true
      ..$slots.footer = [
        WButton()
          ..$props.type = 'primary'
          ..$slots.$ = '确定'
          ..$props.size = 'mini'
          ..$props.round = true
          ..$on.click = () => titleDialogCircleBtn?.$props.visible = false,
      ],
    ''',
  );

  WDialog? noTitleDialogCircleBtn;
  var dialogCircleBtnNoTitle = Demo(
    'dialogCircleBtnNoTitle',
    noTitleDialogCircleBtn = WDialog()
      ..$props.btn = '无标题弹窗'
      ..$props.top = '400px'
      ..$slots.$ = '竹杖芒鞋轻胜马，谁怕？\n一蓑烟雨任平生。'
      ..$style.footSpace = 8
      ..$props.center = true
      ..$slots.footer = [
        WButton()
          ..$props.type = 'primary'
          ..$slots.$ = '确定'
          ..$props.size = 'mini'
          ..$style.width = double.infinity
          ..$props.round = true
          ..$on.click = () => noTitleDialogCircleBtn?.$props.visible = false,
      ],
    r'''
    'dialogCircleBtnNoTitle',
    noTitleDialogCircleBtn = WDialog()
      ..$props.btn = '无标题弹窗'
      ..$props.top = '400px'
      ..$slots.$ = '竹杖芒鞋轻胜马，谁怕？\n一蓑烟雨任平生。'
      ..$style.footSpace = 8
      ..$props.center = true
      ..$slots.footer = [
        WButton()
          ..$props.type = 'primary'
          ..$slots.$ = '确定'
          ..$props.size = 'mini'
          ..$style.width = double.infinity
          ..$props.round = true
          ..$on.click = () => noTitleDialogCircleBtn?.$props.visible = false,
      ],
    ''',
  );

  var dialogNestedWidget = Demo(
    'dialogNestedWidget',
    WDialog()
      ..$props.btn = '双层弹窗'
      ..$slots.$ = ''
      ..$props.title = '外层弹窗'
      ..$slots.footer = [
        WDialog()
          ..$props.btn = '打开内层'
          ..$props.title = '里层弹窗'
          ..$slots.$ = '我是里层'
      ],
    r'''
    WDialog()
      ..$props.btn = '双层弹窗'
      ..$slots.$ = ''
      ..$props.title = '外层弹窗'
      ..$slots.footer = [
        WDialog()
          ..$props.btn = '打开内层'
          ..$props.title = '里层弹窗'
          ..$slots.$ = '我是里层'
      ],
    ''',
  );

  var dialogNestedDialog = Demo(
    'dialogNestedDialog',
    WDialog()
      ..$props.btn = '复合弹窗'
      ..$slots.$ = (WTable()
        ..$style.height = 280
        ..$style.width = 700
        ..$slots.$ = [
          WTableColumnProp(
            prop: (row) => row['date'],
            label: '日期',
            width: '180',
          ),
          WTableColumnProp(
            prop: (row) => row['name'],
            label: '姓名',
            width: '180',
          ),
          WTableColumnProp(
            prop: (row) => row['address'],
            label: '地址',
          ),
        ]
        ..$props.data = <Map<dynamic, dynamic>>[
          {
            'date': '2016-05-03',
            'name': '王小虎1',
            'address': '上海市普陀区金沙江路 1516 弄'
          },
          {
            'date': '2016-05-01',
            'name': '王小虎2',
            'address': '上海市普陀区金沙江路 1519 弄'
          },
          {
            'date': '2016-05-02',
            'name': '王小虎3',
            'address': '上海市普陀区金沙江路 1518 弄'
          },
          {
            'date': '2016-05-04',
            'name': '王小虎4',
            'address': '上海市普陀区金沙江路 1517 弄'
          },
        ])
      ..$props.title = '外层弹窗',
    r'''
    WDialog()
      ..$props.btn = '复合弹窗'
      ..$slots.$ = (WTable()
        ..$style.height = 280
        ..$style.width = 700
        ..$slots.$ = [
          WTableColumnProp(
            prop: (row) => row['date'],
            label: '日期',
            width: '180',
          ),
          WTableColumnProp(
            prop: (row) => row['name'],
            label: '姓名',
            width: '180',
          ),
          WTableColumnProp(
            prop: (row) => row['address'],
            label: '地址',
          ),
        ]
        ..$props.data = <Map<dynamic, dynamic>>[
          {'date': '2016-05-03', 'name': '王小虎1', 'address': '上海市普陀区金沙江路 1516 弄'},
          {'date': '2016-05-01', 'name': '王小虎2', 'address': '上海市普陀区金沙江路 1519 弄'},
          {'date': '2016-05-02', 'name': '王小虎3', 'address': '上海市普陀区金沙江路 1518 弄'},
          {'date': '2016-05-04', 'name': '王小虎4', 'address': '上海市普陀区金沙江路 1517 弄'},
        ]
      )
      ..$props.title = '外层弹窗',
    ''',
  );
}
