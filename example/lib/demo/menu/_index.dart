import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_style.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

var menus = [
  {
    'text': 'File',
    'value': '1',
    'children': [
      [
        {'text': 'New File', 'value': '1-1'},
        {'text': 'New File...', 'value': '1-2'},
        {'text': 'New Window', 'value': '1-3'},
      ],
      [
        {'text': 'Open File...', 'value': '1-4'},
        {'text': 'Open Folder...', 'value': '1-5'},
        {'text': 'Open Workspace from File...', 'value': '1-6'},
        {
          'text': 'New Window',
          'value': '1-7',
          'groups': [
            [
              {'text': 'Reopen Closed Editor', 'value': '1-7-1'},
            ],
            [
              {'text': 'More...', 'value': '1-7-2'},
            ],
            [
              {'text': 'Clear Recently Opend', 'value': '1-7-3'},
            ]
          ]
        },
      ],
      [
        {'text': 'Add Folder to Workspace...', 'value': '1-8'},
        {'text': 'Save Workspace As...', 'value': '1-9'},
        {'text': 'Duplicate Workspace', 'value': '1-10'},
      ],
    ],
  },
  {
    'text': 'Edit',
    'value': '2',
    'children': [
      [
        {'text': 'Undo', 'value': '2-1'},
        {'text': 'Redo', 'value': '2-2'},
      ],
      [
        {'text': 'Cut', 'value': '2-3'},
        {'text': 'Copy', 'value': '2-4'},
        {'text': 'Paste', 'value': '2-5'},
      ],
    ]
  },
  {'text': 'Selection', 'value': '3'},
  {'text': 'View', 'value': '4'},
  {'text': 'Go', 'value': '5'},
  {'text': 'Run', 'value': '6'},
  {'text': 'Terminal', 'value': '7'},
  {'text': 'Help', 'value': '8'},
];
regist() {
  var menuData = Demo(
    'menuData',
    const Text('测试用例的数据，以下涉及 menus 的变量均使用此数据'),
    r'''
var menus = [
  {
    'text': 'File',
    'value': '1',
    'groups': [
      [
        {'text': 'New File', 'value': '1-1'},
        {'text': 'New File...', 'value': '1-2'},
        {'text': 'New Window', 'value': '1-3'},
      ],
      [
        {'text': 'Open File...', 'value': '1-4'},
        {'text': 'Open Folder...', 'value': '1-5'},
        {'text': 'Open Workspace from File...', 'value': '1-6'},
        {
          'text': 'New Window',
          'value': '1-7',
          'groups': [
            [
              {'text': 'Reopen Closed Editor', 'value': '1-7-1'},
            ],
            [
              {'text': 'More...', 'value': '1-7-2'},
            ],
            [
              {'text': 'Clear Recently Opend', 'value': '1-7-3'},
            ]
          ]
        },
      ],
      [
        {'text': 'Add Folder to Workspace...', 'value': '1-8'},
        {'text': 'Save Workspace As...', 'value': '1-9'},
        {'text': 'Duplicate Workspace', 'value': '1-10'},
      ],
    ],
  },
  {
    'text': 'Edit',
    'value': '2',
    'groups': [
      [
        {'text': 'Undo', 'value': '2-1'},
        {'text': 'Redo', 'value': '2-2'},
      ],
      [
        {'text': 'Cut', 'value': '2-3'},
        {'text': 'Copy', 'value': '2-4'},
        {'text': 'Paste', 'value': '2-5'},
      ],
    ]
  },
  {'text': 'Selection', 'value': '3'},
  {'text': 'View', 'value': '4'},
  {'text': 'Go', 'value': '5'},
  {'text': 'Run', 'value': '6'},
  {'text': 'Terminal', 'value': '7'},
  {'text': 'Help', 'value': '8'},
];
    ''',
  );

  var activeIndex = '1';
  var menuTop = Demo(
    'menuTop',
    WMenu()
      ..$props.defaultActive = activeIndex
      ..$props.mode = 'horizontal'
      ..$props.menuTrigger = 'click'
      ..$on.select = ((p0, p1) {})
      ..$slots.$ = menus,
    r'''
    WMenu()
      ..$props.defaultActive = activeIndex
      ..$props.mode = 'horizontal'
      ..$props.menuTrigger = 'click'
      ..$on.select = ((p0, p1) {})
      ..$slots.$ = List.generate(menus.length, (i) {
        var menu = menus[i];
        if (menu.containsKey('children')) {
          return WSubmenu()..$props.index = menu['value'].toString();
        } else {
          return WMenuItem()..$props.index = menu['value'].toString();
        }
      })
    ''',
  );
  var menuAside = Demo(
    'menuAside',
    SizedBox(
      width: 300,
      child: WMenu()
        ..$props.defaultActive = activeIndex
        ..$on.select = ((p0, p1) {})
        ..$slots.$ = menus,
    ),
    r'''
    SizedBox(
      width: 300,
      child: WMenu()
        ..$props.defaultActive = activeIndex
        ..$on.select = ((p0, p1) {})
        ..$slots.$ = menus,
    )
    ''',
  );
  var menuAsideDark = Demo(
    'menuAsideDark',
    SizedBox(
      width: 300,
      child: WMenu()
        ..$props.defaultActive = activeIndex
        ..$on.select = ((p0, p1) {})
        ..$slots.$ = menus
        ..$style.height = 200
        ..$style.minHeight = 400
        // ..$style.backgroundColor = Color(0xFF545c64)
        ..$style.hoverBackgroundColor = Color.fromRGBO(67, 74, 80, 1)
        // ..$style.color = Colors.white
        ..$style.activeColor = Color(0xffffd04b),
    ),
    r'''
    SizedBox(
      width: 300,
      child: WMenu()
        ..$props.defaultActive = activeIndex
        ..$on.select = ((p0, p1) {})
        ..$slots.$ = menus
        ..$style.height = 200
        ..$style.minHeight = 400
        ..$style.backgroundColor = Color(0xFF545c64)
        ..$style.hoverBackgroundColor = Color.fromRGBO(67, 74, 80, 1)
        ..$style.color = Colors.white
        ..$style.activeColor = Color(0xffffd04b),
    )
    ''',
  );

  var isCollapse = ValueNotifier(true);
  var menuCollapse = Demo(
    'menuCollapse',
    SizedBox(
      width: 300,
      child: WMenu()
        ..$props.defaultActive = activeIndex
        ..$on.select = ((p0, p1) {})
        ..$slots.$ = menus
        ..$props.collapse = isCollapse.value,
    ),
    r'''
    var isCollapse = ValueNotifier(true);
    SizedBox(
      width: 300,
      child: WMenu()
        ..$props.defaultActive = activeIndex
        ..$on.select = ((p0, p1) {})
        ..$slots.$ = menus,
    )
    ''',
  );
}
