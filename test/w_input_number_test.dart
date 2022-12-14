import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wao_ui/core/theme/element/theme_element.dart';
import 'package:wao_ui/src/form/w_input_number.dart';

void main() {
  testWidgets('test WInputNumber', (WidgetTester tester) async {
    element();
    var inputNumber = WInputNumber(props: WInputNumberProp(model: 3))
      ..$props.model = 1
      ..$on.change = (v) => print(v);

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: inputNumber),
    ));

    expect(inputNumber.$props.model, 1);
  });
}
