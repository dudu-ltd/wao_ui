import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wao_ui/core/theme/element/theme_element.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:wao_ui/src/form/w_switch.dart';

void main() {
  testWidgets('test swatch', (WidgetTester tester) async {
    element();
    var swatch = WSwitch();

    await tester.pumpWidget(MaterialApp(home: Scaffold(body: swatch)));

    expect(swatch.$props.model, false);
    await tester.tap(find.byType(WSwitch));
    await tester.pumpAndSettle(CfgGlobal.duration);
    expect(swatch.$props.model, true);
  });

  testWidgets('test disabled swatch', (WidgetTester tester) async {
    element();
    var swatch = WSwitch()..$props.disabled = true;

    await tester.pumpWidget(MaterialApp(home: Scaffold(body: swatch)));

    expect(swatch.$props.model, false);
    await tester.tap(find.byType(WSwitch));
    await tester.pumpAndSettle(CfgGlobal.duration);
    expect(swatch.$props.model, false);
  });
}
