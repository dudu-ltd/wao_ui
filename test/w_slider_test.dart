import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wao_ui/core/theme/element/theme_element.dart';
import 'package:wao_ui/src/form/w_slider.dart';

void main() {
  testWidgets('test slider', (WidgetTester tester) async {
    element();
    var slider = WSlider();
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: slider)));
    tester.pumpAndSettle(const Duration(microseconds: 1));
  });
}
