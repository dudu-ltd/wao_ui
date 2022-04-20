import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wao_ui/core/theme/element/theme_element.dart';
import 'package:wao_ui/src/basic/w_button.dart';

void main() {
  testWidgets('test Button', (WidgetTester tester) async {
    element();
    var button = WButton();

    await tester.pumpWidget(MaterialApp(
      home: button,
    ));
  });
}
