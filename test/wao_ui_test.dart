import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wao_ui/core/base_style.dart';
import 'package:wao_ui/core/theme_element.dart';

import 'package:wao_ui/wao_ui.dart';

void main() {
  test('test border radius merge', () {
    var style = BaseStyle();
    List<BaseStyle> styles = <BaseStyle>[
      BaseStyle(borderRadius: BorderRadius.circular(15.0)),
      BaseStyle(),
      BaseStyle(borderRadius: BorderRadius.circular(4)),
      BaseStyle(
        borderBottomLeftRadius: Radius.zero,
        borderBottomRightRadius: Radius.zero,
      ),
    ];

    for (var s in styles) {
      style.merge(s, force: true);
    }
    print(style.borderRadius);
    assert(style.borderRadius ==
        const BorderRadius.only(
          topRight: Radius.circular(4),
          topLeft: Radius.circular(4),
        ));
  });

  test('test padding merge', () {
    var style = BaseStyle();
    List<BaseStyle> styles = <BaseStyle>[
      BaseStyle(
        paddingLeft: 23.0,
        paddingRight: 23.0,
        paddingTop: 12.0,
        paddingBottom: 12.0,
      ),
      BaseStyle(
        paddingLeft: null,
        paddingRight: 20,
        paddingTop: null,
        paddingBottom: null,
      ),
    ];
    for (var s in styles) {
      style.merge(s, force: true);
    }
    print(style.padding);
    assert(style.padding == const EdgeInsets.fromLTRB(23, 12, 20, 12));
  });

  test('test class merge', () {
    var style = WRadioButtonStyle();
    var styleWithClass = WRadioButtonStyle()..clazz = ['test'];
    style.merge(styleWithClass);
    assert(style.clazz.first == 'test');
  });

  test('test complex style merge', () {
    var style = WRadioGroupStyle();
    var complexStyle = WRadioGroupStyle()
      ..button = (WRadioButtonStyle()..clazz = ['test']);
    style.merge(complexStyle);
    assert(style.button?.clazz.first == 'test');
  });
  test('test complex style merge 2', () {
    var style = WRadioGroupStyle()
      ..button = (WRadioButtonStyle()..clazz = ['test1']);
    var complexStyle = WRadioGroupStyle()
      ..button = (WRadioButtonStyle()..clazz = ['test']);
    style.merge(complexStyle);
    assert(style.button!.clazz.contains('test1') &&
        style.button!.clazz.contains('test'));
  });

  testWidgets('test WRadioGroup button', (WidgetTester tester) async {
    var valueButtonSize1 = ValueNotifier('上海');
    element();
    var group = WRadioGroup()
      ..$props.value = valueButtonSize1
      ..$slots.$ = [
        WRadioButton()
          ..$props.label = '上海'
          ..$slots.$ = '上海',
        WRadioButton()
          ..$props.label = '北京'
          ..$slots.$ = '北京',
        WRadioButton()
          ..$props.label = '广州'
          ..$slots.$ = '广州',
        WRadioButton()
          ..$props.label = '深圳'
          ..$slots.$ = '深圳',
      ];

    await tester.pumpWidget(group);
    print(group);
  });
}
