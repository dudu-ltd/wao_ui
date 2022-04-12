import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  var breadcrumbBasic = Demo(
    'breadcrumbBasic',
    WBreadcrumb()
      ..$props.separator = ' / '
      ..$slots.$ = const [
        {'text': 'wao_ui'},
        {'text': 'example'},
        {'text': 'lib'},
        {'text': 'demo'},
        {'text': 'breakcrumb'},
        {'text': '_index.dart', 'icon': Icons.language},
        {'text': 'regist', 'icon': Icons.code},
      ],
    r'''
    WBreadcrumb()
      // ..$props.separator = ' > '
      ..$props.separatorIcon = Icons.arrow_forward_ios
      ..$slots.$ = const [
        {'text': 'wao_ui'},
        {'text': 'example'},
        {'text': 'lib'},
        {'text': 'demo'},
        {'text': 'breakcrumb'},
        {'text': '_index.dart', 'icon': Icons.language},
        {'text': 'regist', 'icon': Icons.code},
      ]
    ''',
  );

  var breadcrumbIcon = Demo(
    'breadcrumbIcon',
    WBreadcrumb()
      ..$props.separatorIcon = Icons.arrow_forward_ios
      ..$slots.$ = const [
        {'text': 'wao_ui'},
        {'text': 'example'},
        {'text': 'lib'},
        {'text': 'demo'},
        {'text': 'breakcrumb'},
        {'text': '_index.dart', 'icon': Icons.language},
        {'text': 'regist', 'icon': Icons.code},
      ],
    r'''
    WBreadcrumb()
      ..$props.separatorIcon = Icons.arrow_forward_ios
      ..$slots.$ = const [
        {'text': 'wao_ui'},
        {'text': 'example'},
        {'text': 'lib'},
        {'text': 'demo'},
        {'text': 'breakcrumb'},
        {'text': '_index.dart', 'icon': Icons.language},
        {'text': 'regist', 'icon': Icons.code},
      ]
    ''',
  );
}
