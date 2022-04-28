import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wao_ui/core/theme/element/theme_element.dart';

import 'package:wao_ui/wao_ui.dart';

void main() {
  testWidgets('test WMenu', (WidgetTester tester) async {
    element();
    GlobalKey menuKey = GlobalKey();
    var activeIndex = '1';
    var menu = WMenu(key: menuKey)
      ..$props.defaultActive = activeIndex
      ..$props.mode = 'horizontal'
      ..$props.menuTrigger = 'click'
      ..$on.select = ((p0, p1) {})
      ..$slots.$ = menus;

    await tester.pumpWidget(MaterialApp(
      home: menu,
    ));

    expect(find.text('File'), findsOneWidget);
    expect(find.text('Open Folder...'), findsNWidgets(0));
    await tester.tap(find.byType(WMenuItem));
    await tester.pumpAndSettle(CfgGlobal.duration);
    expect(find.text('Open Folder...'), findsOneWidget);
    await tester.tap(find.byType(WMenuItem));
  });
}

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
          'children': [
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
  // {
  //   'text': 'Edit',
  //   'value': '2',
  //   'children': [
  //     [
  //       {'text': 'Undo', 'value': '2-1'},
  //       {'text': 'Redo', 'value': '2-2'},
  //     ],
  //     [
  //       {'text': 'Cut', 'value': '2-3'},
  //       {'text': 'Copy', 'value': '2-4'},
  //       {'text': 'Paste', 'value': '2-5'},
  //     ],
  //   ]
  // },
  // {'text': 'Selection', 'value': '3'},
  // {'text': 'View', 'value': '4'},
  // {'text': 'Go', 'value': '5'},
  // {'text': 'Run', 'value': '6'},
  // {'text': 'Terminal', 'value': '7'},
  // {'text': 'Help', 'value': '8'},
];
