import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wao_ui/core/theme/element/theme_element.dart';
import 'package:wao_ui/wao_ui.dart';

void main() {
  testWidgets('test Collapse', (WidgetTester tester) async {
    element();
    var firstText = '一栈全端，通过一个技术栈，满足全端开发的需求。';
    var futureText = '形成可定制主题的全端UI框架，融入具有传统文化特色的元素，在科技输出的同时，满足文化输出的需求。';

    var coll1, coll2;
    var collapse = WCollapse()
      ..$props.accordion = true
      ..$props.model = 'Future'
      ..$slots.$ = [
        coll1 = WCollapseItem()
          ..$props.name = 'First'
          ..$props.title = '初衷'
          ..$slots.$ = firstText,
        coll2 = WCollapseItem()
          ..$props.name = 'Future'
          ..$props.title = '展望'
          ..$slots.$ = futureText,
      ];

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: collapse),
    ));

    expect(find.byType(Text), findsNWidgets(3));

    await tester.tap(find.byType(Text).first);
    await tester.pumpAndSettle(CfgGlobal.duration);

    expect(find.byType(Text), findsNWidgets(3));
  });
}
