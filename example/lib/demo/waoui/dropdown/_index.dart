import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

import '../../demos.dart';

regist() {
  var dropdownBasic = Demo(
    'dropdownBasic',
    WDropdown()
      ..$props.type = 'primary'
      ..$slots.$ = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          WAvatar(),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: CfgGlobal.primaryColor,
          )
        ],
      )
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '个人主页',
          WDropdownItem()..$slots.$ = '我的星集库',
          WDropdownItem()..$slots.$ = '设置',
          WDropdownItem()..$slots.$ = '帮助',
          WDropdownItem()..$slots.$ = '退出',
        ]),
    r'''
    WDropdown()
      ..$props.type = 'primary'
      ..$slots.$ = WAvatar()
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '个人主页',
          WDropdownItem()..$slots.$ = '我的星集库',
          WDropdownItem()..$slots.$ = '设置',
          WDropdownItem()..$slots.$ = '帮助',
          WDropdownItem()..$slots.$ = '退出',
        ]),
    ''',
  );

  var dropdownSplit1 = Demo(
    'dropdownSplit1',
    WDropdown()
      ..$props.splitButton = false
      ..$slots.$ = '发送'
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '按Enter键发送消息',
          WDropdownItem()..$slots.$ = '按Ctrl+Enter键发送消息',
        ]),
    r'''
    WDropdown()
      ..$props.splitButton = false
      ..$slots.$ = '发送'
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '按Enter键发送消息',
          WDropdownItem()..$slots.$ = '按Ctrl+Enter键发送消息',
        ]),
  ''',
  );

  var dropdownSplit2 = Demo(
    'dropdownSplit2',
    WDropdown()
      ..$props.splitButton = true
      ..$slots.$ = '发送'
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '按Enter键发送消息',
          WDropdownItem()..$slots.$ = '按Ctrl+Enter键发送消息',
        ]),
    r'''
    WDropdown()
      ..$props.splitButton = true
      ..$slots.$ = '发送'
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '按Enter键发送消息',
          WDropdownItem()..$slots.$ = '按Ctrl+Enter键发送消息',
        ]),
    ''',
  );

  var dropdownTriggerClick = Demo(
    'dropdownTriggerClick',
    WDropdown()
      ..$props.trigger = 'click'
      ..$slots.$ = (WButton()
        ..$props.type = 'primary'
        ..$props.iconRight = Icons.keyboard_arrow_down_rounded
        ..$slots.$ = '发送')
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '按Enter键发送消息',
          WDropdownItem()..$slots.$ = '按Ctrl+Enter键发送消息',
        ]),
    r'''
    WDropdown()
      ..$slots.$ = (WButton()
        ..$props.type = 'primary'
        ..$props.iconRight = Icons.keyboard_arrow_down_rounded
        ..$slots.$ = '发送')
      ..$slots.dropdown = (WDropdownMenu()
      ..$slots.$ = [
        WDropdownItem()..$slots.$ = '按Enter键发送消息',
        WDropdownItem()..$slots.$ = '按Ctrl+Enter键发送消息',
      ])
    ''',
  );

  var dropdownTriggerHover = Demo(
    'dropdownTriggerHover',
    WDropdown()
      ..$props.splitButton = true
      ..$props.type = 'primary'
      ..$slots.$ = '发送'
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '按Enter键发送消息',
          WDropdownItem()..$slots.$ = '按Ctrl+Enter键发送消息',
        ]),
    r'''
    WDropdown()
      ..$props.splitButton = true
      ..$slots.$ = (WButton()
        ..$props.type = 'primary'
        ..$slots.$ = '发送')
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '按Enter键发送消息',
          WDropdownItem()..$slots.$ = '按Ctrl+Enter键发送消息',
        ])
    ''',
  );

  var dropdownDisabled = Demo(
    'dropdownDisabled',
    WDropdown()
      ..$props.hideOnClick = false
      ..$props.disabled = true
      ..$slots.$ = (WButton()
        ..$props.type = 'primary'
        ..$slots.$ = '禁用')
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '按Enter键发送消息',
          WDropdownItem()..$slots.$ = '按Ctrl+Enter键发送消息',
        ]),
    r'''
    WDropdown()
      ..$props.hideOnClick = false
      ..$props.disabled = true
      ..$slots.$ = (WButton()
        ..$props.type = 'primary'
        ..$slots.$ = '禁用')
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '按Enter键发送消息',
          WDropdownItem()..$slots.$ = '按Ctrl+Enter键发送消息',
        ])
    ''',
  );

  var dropdownCommand = Demo(
    'dropdownCommand',
    WDropdown()
      ..$on.command = (() {})
      ..$slots.$ = (WButton()
        ..$props.type = 'primary'
        ..$slots.$ = '命令下拉')
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()
            ..$slots.$ = '按Enter键发送消息'
            ..$props.divided = true,
          WDropdownItem()..$slots.$ = '按Ctrl+Enter键发送消息',
        ]),
    r'''
    WDropdown()
      ..$on.command = (() {})
      ..$slots.$ = (WButton()
        ..$props.type = 'primary'
        ..$slots.$ = '命令下拉')
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()
            ..$slots.$ = '按Enter键发送消息'
            ..$props.divided = true,
          WDropdownItem()..$slots.$ = '按Ctrl+Enter键发送消息',
        ])
    ''',
  );

  var dropdownSize1 = Demo(
    'dropdownSize1',
    WDropdown()
      ..$slots.$ = '下拉'
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '选项1',
          WDropdownItem()..$slots.$ = '选项2',
          WDropdownItem()..$slots.$ = '选项3',
          WDropdownItem()..$slots.$ = '选项4',
          WDropdownItem()..$slots.$ = '选项5',
        ]),
    r'''
    WDropdown()
      ..$props.type = 'primary'
      ..$slots.$ = '下拉'
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '选项1',
          WDropdownItem()..$slots.$ = '选项2',
          WDropdownItem()..$slots.$ = '选项3',
          WDropdownItem()..$slots.$ = '选项4',
          WDropdownItem()..$slots.$ = '选项5',
        ])
    ''',
  );

  var dropdownSize2 = Demo(
    'dropdownSize2',
    WDropdown()
      ..$props.size = 'medium'
      ..$slots.$ = '下拉'
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '选项1',
          WDropdownItem()..$slots.$ = '选项2',
          WDropdownItem()..$slots.$ = '选项3',
          WDropdownItem()..$slots.$ = '选项4',
          WDropdownItem()..$slots.$ = '选项5',
        ]),
    r'''
    WDropdown()
      ..$props.size = 'medium'
      ..$slots.$ = '下拉'
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '选项1',
          WDropdownItem()..$slots.$ = '选项2',
          WDropdownItem()..$slots.$ = '选项3',
          WDropdownItem()..$slots.$ = '选项4',
          WDropdownItem()..$slots.$ = '选项5',
        ])
    ''',
  );

  var dropdownSize3 = Demo(
    'dropdownSize3',
    WDropdown()
      ..$props.size = 'small'
      ..$slots.$ = '下拉'
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '选项1',
          WDropdownItem()..$slots.$ = '选项2',
          WDropdownItem()..$slots.$ = '选项3',
          WDropdownItem()..$slots.$ = '选项4',
          WDropdownItem()..$slots.$ = '选项5',
        ]),
    r'''
    WDropdown()
      ..$props.size = 'small'
      ..$slots.$ = '下拉'
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '选项1',
          WDropdownItem()..$slots.$ = '选项2',
          WDropdownItem()..$slots.$ = '选项3',
          WDropdownItem()..$slots.$ = '选项4',
          WDropdownItem()..$slots.$ = '选项5',
        ]),
    ''',
  );

  var dropdownSize4 = Demo(
    'dropdownSize4',
    WDropdown()
      ..$props.size = 'mini'
      ..$slots.$ = '下拉'
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '选项1',
          WDropdownItem()..$slots.$ = '选项2',
          WDropdownItem()..$slots.$ = '选项3',
          WDropdownItem()..$slots.$ = '选项4',
          WDropdownItem()..$slots.$ = '选项5',
        ]),
    r'''
    WDropdown()
      ..$props.size = 'mini'
      ..$slots.$ = '下拉'
      ..$slots.dropdown = (WDropdownMenu()
        ..$slots.$ = [
          WDropdownItem()..$slots.$ = '选项1',
          WDropdownItem()..$slots.$ = '选项2',
          WDropdownItem()..$slots.$ = '选项3',
          WDropdownItem()..$slots.$ = '选项4',
          WDropdownItem()..$slots.$ = '选项5',
        ]),
    ''',
  );
}
