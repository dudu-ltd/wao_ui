import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wao_ui/core/theme/element/theme_element.dart';
import 'package:wao_ui/src/form/w_input.dart';

void main() {
  testWidgets('test WInputNumber', (WidgetTester tester) async {
    element();
    var input = WInput();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: input),
    ));
  });
}
