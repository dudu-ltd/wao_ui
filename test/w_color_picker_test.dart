import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wao_ui/core/theme/element/theme_element.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:wao_ui/src/basic/w_button.dart';
import 'package:wao_ui/src/form/w_color_picker.dart';

void main() {
  testWidgets('test slider', (WidgetTester tester) async {
    element();
    var slider = WColorPicker();
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: slider)));
    await tester.tap(find.byType(WButton));
    // await tester.pumpAndSettle(CfgGlobal.duration);
  });

  test('test painter', () {
    var painter = MainColorAdjustPainter(
        height: 180, width: 300, color: Color.fromRGBO(255, 0, 0, 1));
    Color white = painter.trans2color(0, 0);
    assert(white == Colors.white);
    Color black2 = painter.trans2color(0, 180);
    assert(black2 == Colors.black);
    Color black = painter.trans2color(300, 180);
    assert(black == Colors.black);
    Color red = painter.trans2color(300, 0);
    assert(red == Color.fromRGBO(255, 0, 0, 1));
  });
}
