import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wao_ui/core/theme/element/theme_element.dart';
import 'package:wao_ui/src/form/w_radio.dart';

void main() {
  testWidgets('test radio', (WidgetTester tester) async {
    element();
    var $model = ValueNotifier<dynamic>(null);
    WRadio radio1, radio2;
    var radio = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        radio1 = WRadio()
          ..$props.$model = $model
          ..$props.label = '1'
          ..$slots.$ = '选项1',
        radio2 = WRadio()
          ..$props.$model = $model
          ..$props.label = '2'
          ..$slots.$ = '选项2'
      ],
    );
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: radio),
    ));
    expect(radio1.$props.$model, radio2.$props.$model);
    expect($model, radio1.$props.$model);
    expect($model, radio2.$props.$model);
    // expect(radio1.$props.model, false);
    // expect(radio2.$props.model, false);
    await tester.tap(find.byType(WRadio).first);
    expect(radio1.$props.model, '1');
    expect(radio2.$props.model, '1');
    await tester.tap(find.byType(WRadio).last);
    expect(radio2.$props.model, '2');
    expect(radio1.$props.model, '2');
  });
}
