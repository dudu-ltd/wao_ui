import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:example/package/navigation/api_tabs.dart';
import 'package:example/views/home.dart';
import 'package:example/views/index.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/core/env.dart';
import 'package:wao_ui/core/theme/element/theme_element.dart';
import 'package:wao_ui/wao_ui.dart';

import 'third_party/syntax_highlight.dart';

void main() async {
  await SyntaxHighlighter.initialize();
  element();
  runApp(const Api());
  // CfgGlobal.primaryColor = Colors.orange;
  doWhenWindowReady(() {
    var minSize = const Size(880, 630);
    if (isPc) {
      appWindow.minSize = minSize;
      appWindow.maximize();
      appWindow.show();
      appWindow.startDragging();
    }
  });
}

class Api extends StatelessWidget {
  const Api({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var main = const IndexPage();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wao ui Home',
        theme: ThemeData(
          fontFamily: 'PingFang',
          primarySwatch: CfgGlobal.primaryColor,
        ),
        themeMode: ThemeMode.light,
        onGenerateRoute: buildNestedRoutes(
          {
            '/': NestedRoute(
              builder: (child) => main,
              subRoutes: {
                'index': NestedRoute(
                  builder: (child) => IndexPage(),
                  subRoutes: {
                    '/WTabs': NestedRoute(
                      builder: (son) => ApiTabs(),
                    ),
                  },
                ),
              },
            ),
            'a': NestedRoute(
              builder: (child) => ApiTabs(),
              subRoutes: {
                'index': NestedRoute(
                  builder: (child) => IndexPage(),
                  subRoutes: {
                    'WTabs': NestedRoute(
                      builder: (son) => ApiTabs(),
                    ),
                  },
                ),
              },
            ),
          },
        ));
  }
}
