import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  badgePrimary;
  badgeSuccess;
  badgeWarning;
  badgeInfo;
  badgeDot;
  badgeText;
  badgeMax;
}

var badgePrimary = Demo(
  'badgePrimary',
  WBadge()
    ..$props.value = 3
    // * 关键属性在这
    ..$props.type = 'danger'
    ..$slots.$ = (WButton()
      ..$slots.$ = '消息'
      ..$props.type = 'primary'
      ..$props.plain = true),
  r'''
  WBadge()
    ..$props.value = 3
    // * 关键属性在这
    ..$props.type = 'danger'
    ..$slots.$ = (WButton()
      ..$slots.$ = '消息'
      ..$props.type = 'primary'
      ..$props.plain = true),
  ''',
);

var badgeWarning = Demo(
  'badgeWarning',
  WBadge()
    ..$props.value = 3
    // * 关键属性在这
    ..$props.type = 'warning'
    ..$style.marginRight = 0
    ..$slots.$ = (WButton()
      ..$slots.$ = '消息'
      ..$props.type = 'primary'
      ..$props.plain = true),
  r'''
  WBadge()
    ..$props.value = 3
    // * 关键属性在这
    ..$props.type = 'warning'
    ..$slots.$ = (WButton()
      ..$slots.$ = '消息'
      ..$props.type = 'primary'
      ..$props.plain = true)
  ''',
);

var badgeInfo = Demo(
  'badgeInfo',
  WBadge()
    ..$props.value = 3
    // * 关键属性在这
    ..$props.type = 'info'
    ..$slots.$ = (WButton()
      ..$slots.$ = '消息'
      ..$props.type = 'primary'
      ..$props.plain = true),
  r'''
  WBadge()
    ..$props.value = 3
    // * 关键属性在这
    ..$props.type = 'info'
    ..$slots.$ = (WButton()
      ..$slots.$ = '消息'
      ..$props.type = 'primary' 
      ..$props.plain = true)
  ''',
);

var badgeSuccess = Demo(
  'badgeSuccess',
  WBadge()
    ..$props.value = 3
    // * 关键属性在这
    ..$props.type = 'success'
    ..$slots.$ = (WButton()
      ..$slots.$ = '消息'
      ..$props.type = 'primary'
      ..$props.plain = true),
  r'''
  WBadge()
    ..$props.value = 3
    // * 关键属性在这
    ..$props.type = 'success'
    ..$slots.$ = (WButton()
      ..$slots.$ = '消息'
      ..$props.type = 'primary'
      ..$props.plain = true)
  ''',
);

var badgeDot = Demo(
  'badgeDot',
  ListTile(
    leading: WBadge()
      ..$props.value = 3
      // * 关键属性在这
      ..$props.isDot = true
      ..$style.marginRight = 0
      ..$props.type = 'danger'
      ..$slots.$ = const ColoredBox(
        color: Colors.blue,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.library_books_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    title: const Text('订阅号'),
    subtitle: const Text('WaoUI: Flutter组件库发布新版本'),
  ),
  r'''
  ListTile(
    leading: WBadge()
      ..$props.value = 3
      // * 关键属性在这
      ..$props.isDot = true
      ..style.marginRight = 0
      ..$props.type = 'danger'
      ..$slots.$ = const ColoredBox(
        color: Colors.blue,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.library_books_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    title: const Text('订阅号'),
    subtitle: const Text('WaoUI: Flutter组件库发布新版本'),
  )
  ''',
);

var badgeText = Demo(
  'badgeText',
  Row(children: [
    WBadge()
      ..$props.value = '特惠'
      ..$props.type = 'danger'
      ..$slots.$ = (WButton()
        ..$slots.$ = '企业版'
        ..$props.type = 'primary'
        ..$props.plain = true),
    WBadge()
      ..$props.value = 'HOT'
      ..$props.type = 'danger'
      ..$slots.$ = (WButton()
        ..$slots.$ = '活动中...'
        ..$props.type = 'primary'
        ..$props.plain = true),
  ]),
  r'''
  Row(children: [
    WBadge()
      ..$props.value = '特惠'
      ..$props.type = 'danger'
      ..$slots.$ = (WButton()
        ..$slots.$ = '企业版'
        ..$props.type = 'primary'
        ..$props.plain = true),
    WBadge()
      ..$props.value = 'HOT'
      ..$props.type = 'danger'
      ..$slots.$ = (WButton()
        ..$slots.$ = '活动中...'
        ..$props.type = 'primary'
        ..$props.plain = true),
  ])
  ''',
);

var badge;
var badgeMax = Demo(
  'badgeMax',
  Row(
    children: [
      badge = WBadge()
        ..$props.value = 1
        ..$props.max = 9
        ..$props.type = 'danger'
        ..$slots.$ = (WButton()
          ..$slots.$ = '点我试试'
          ..$props.type = 'primary'
          ..$props.plain = true
          ..$on.click = () {
            print('click');
            badge.$props.value++;
          }),
    ],
  ),
  r'''
  Row(
    children: [
      badge = WBadge()
        ..$props.value = 11
        ..$props.max = 9
        ..$props.type = 'danger'
        ..$slots.$ = (WButton()
          ..$slots.$ = '点我试试'
          ..$props.type = 'primary'
          ..$props.plain = true
          ..$on.click = () {
            print('click');
            badge.$props.value++;
          }),
    ],
  ),
  ''',
);
