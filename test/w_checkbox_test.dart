import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wao_ui/core/theme/element/theme_element.dart';
import 'package:wao_ui/src/form/w_checkbox.dart';

void main() {
  testWidgets('test checkbox', (WidgetTester tester) async {
    element();
    var checkbox = WCheckbox()
      ..$props.model = true
      ..$slots.$ = '备选项';

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: checkbox),
    ));

    expect(checkbox.$props.model, true);
    await tester.tap(find.byType(WCheckbox));
    expect(checkbox.$props.model, false);
  });
}
