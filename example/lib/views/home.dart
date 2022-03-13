import 'package:example/views/header.dart';
import 'package:example/views/index.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WContainerLayout()
        ..$slots.header = Header()
        ..$slots.defaultSlotBefore = IndexPage(),
    );
  }
}
