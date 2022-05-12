import 'package:example/demo/demos.dart';
import '../menu/v.dart';
import '../table/basic.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

var containerInstance = Demo(
  'container.instance',
  SizedBox(
      height: 300,
      child: WContainer()
        ..$slots.$ = [
          WAside()..$slots.$ = v,
          WMain()..$slots.$ = tableBasicInner
        ]),
  r'''
  SizedBox(
      height: 300,
      child: WContainer()
        ..$slots.$ = [
          WAside()..$slots.$ = v,
          WMain()..$slots.$ = tableBasicInner
        ]),
  ''',
);
