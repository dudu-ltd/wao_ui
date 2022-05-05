import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wao_ui/core/theme/element/theme_element.dart';
import 'package:wao_ui/wao_ui.dart';

main() {
  testWidgets('test Basic Form', (WidgetTester tester) async {
    element();
    var modelInline = {};
    var form = WForm()
      ..$props.model = modelInline
      ..$props.inline = true
      ..$slots.$ = [
        WFormItem()
          ..$props.prop = 'name'
          ..$props.label = '姓名  '
          ..$slots.$ = WInput(),
        WFormItem()
          ..$props.prop = 'exp'
          ..$props.label = '工作年限  '
          ..$slots.$ = (WSelect()
            ..$props.clearable = true
            ..$slots.$ = [
              WOption()
                ..$props.label = '实习生'
                ..$props.value = 1,
              WOption()
                ..$props.label = '1~3年'
                ..$props.value = 2,
              WOption()
                ..$props.label = '3~8年'
                ..$props.value = 3,
              WOption()
                ..$props.label = '8年以上'
                ..$props.value = 4
            ]),
        WFormItem()
          // ..$props.label = '  '
          ..$slots.$ = (WButtonGroup()
            ..$slots.$ = [
              WButton()
                ..$on.click =
                    (() => debugPrint(const JsonEncoder().convert(modelInline)))
                ..$props.type = 'primary'
                ..$slots.$ = '查询',
            ])
      ];

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: form),
    ));
  });
}
