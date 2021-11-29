import 'package:example/package/ApiContainerLayout.dart';
import 'package:example/views/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Api());
}

class Api extends StatelessWidget {
  const Api({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IndexPage(),
      routes: {
        //路由注册表
        "ContainerLayout": (BuildContext context) => ApiContainerLayout(),
      },
    );
  }
}
