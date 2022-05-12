import 'basic.dart';
import 'disabled.dart';
import 'group.dart';
import 'icon.dart';
import 'loading.dart';
import 'size.dart' as a;
import 'text.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

import '../../demos.dart';

regist() {
  buttonByType;
  buttonPlain;
  buttonRound;
  buttonIconOnly;

  buttonDisabled;
  buttonGroup;
  buttonIcon;
  buttonLoading;
  a.buttonSize;
  buttonText;

  var buttonTest = Demo(
    'buttonTest',
    AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
      insetPadding: EdgeInsets.zero,
      buttonPadding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
      titleTextStyle: const TextStyle(fontSize: 16.0, color: Colors.black),
      // alignment: getAlign(context),
      title: Text('提示'),
      content: Text('我是提示内容'),
      actionsOverflowButtonSpacing: 8,
      actionsAlignment: MainAxisAlignment.center,
      backgroundColor: Colors.transparent,
      actions: [
        WButton()
          ..$props.type = 'primary'
          ..$props.round = true
          ..$props.size = 'mini'
          ..$slots.$ = '测试',
      ],
    ),
    r'''
  
    ''',
  );
}
