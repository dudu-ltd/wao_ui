import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:example/package/basic/api_container_layout.dart';
import 'package:example/views/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/src/basic/w_frame.dart';

void main() {
  runApp(const Api());
  doWhenWindowReady(() {
    var minSize = const Size(880, 630);
    appWindow.minSize = minSize;
    appWindow.maximize();
    appWindow.show();
    appWindow.startDragging();
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
        primarySwatch: Colors.blue,
      ),
      home: kIsWeb
          ? main
          : WFrame(
              slots: WFrameSlot(null,
                  header: Text('Wao ui Api'),
                  main: main,
                  footer: const Text('状态栏')),
            ),
      themeMode: ThemeMode.dark,
      routes: {
        //路由注册表
        "ContainerLayout": (BuildContext context) => const ApiContainerLayout(),
      },
    );
  }
}
