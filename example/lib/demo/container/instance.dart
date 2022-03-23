import 'package:example/demo/demos.dart';
import 'package:example/demo/menu/v.dart';
import 'package:example/demo/table/basic.dart';
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
  '''

  ''',
);
