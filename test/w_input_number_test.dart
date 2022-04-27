import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wao_ui/core/theme/element/theme_element.dart';
import 'package:wao_ui/src/form/w_input_number.dart';

void main() {
  testWidgets('test WInputNumber', (WidgetTester tester) async {
    element();
    var inputNumber = WInputNumber()
      // ..$props.value = 1
      ..$props.step = 2
      ..$props.stepStrictly = true;

    await tester.pumpWidget(MaterialApp(
      home: inputNumber,
    ));
  });
}
