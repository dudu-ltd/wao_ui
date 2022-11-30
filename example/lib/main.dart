import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:example/package/navigation/api_tabs.dart';
import 'package:example/views/home.dart';
import 'package:example/views/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wao_ui/core/env.dart';
import 'package:wao_ui/core/theme/element/theme_element.dart';
import 'package:wao_ui/wao_ui.dart';

import 'third_party/syntax_highlight.dart';

late ThemeData themeData;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //必须要添加这个进行初始化 否则下面
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
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate, // 指定本地化的字符串
          GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
          GlobalWidgetsLocalizations.delegate // 指定默认的文本排列方向, 由左到右或由右到左
        ],
        supportedLocales: const [
          Locale("zh")
        ],
        debugShowCheckedModeBanner: false,
        title: 'Wao ui Home',
        theme: themeData = ThemeData(
          fontFamily: 'PingFang',
          primarySwatch: CfgGlobal.primaryColor,
        ),
        themeMode: ThemeMode.dark,
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
