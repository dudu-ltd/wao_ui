import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wao_ui/core/theme/element/theme_element.dart';
import 'package:wao_ui/src/basic/w_button.dart';
import 'package:wao_ui/src/form/w_cascader.dart';
import 'package:wao_ui/src/form/w_input.dart';
import 'package:wao_ui/wao_ui.dart';

void main() {
  testWidgets('test WSelect', (WidgetTester tester) async {
    element();
    var select = WSelect()
      ..$props.placeholder = '请选择'
      ..$props.model = '选项1'
      ..$slots.$ = List.generate(
        selectOption1.length,
        (index) => WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value'],
      );

    await tester.pumpWidget(MaterialApp(home: Scaffold(body: select)));
    await tester.tap(find.byType(WInput));
    await tester.pump();
    expect(find.byType(InkWell), findsNWidgets(5));
    await tester.pumpAndSettle(CfgGlobal.duration);
    await tester.tap(find.byType(WSelect).first);
    await tester.pump();
  });

  testWidgets('test multi select', (WidgetTester tester) async {
    element();
    var select = WSelect()
      ..$props.clearable = true
      ..$props.model = ['选项1']
      ..$props.multiple = true
      ..$slots.$ = List.generate(
        selectOption1.length,
        (index) => WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value'],
      );

    await tester.pumpWidget(MaterialApp(home: Scaffold(body: select)));
    await tester.tap(find.byType(WInput));
    await tester.pump();
    expect(find.byType(WOption), findsNWidgets(5));
    await tester.pump();
    await tester.tap(find.byType(WOption).first);
    await tester.pump();
  });

  testWidgets('test ticker', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: T()),
    ));
    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle(Duration(seconds: 1),
        EnginePhase.sendSemanticsUpdate, Duration(seconds: 3));
  });
}

class T extends StatefulWidget {
  T({Key? key}) : super(key: key);

  @override
  State<T> createState() => _TState();
}

class _TState extends State<T> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => controller.forward(), child: Text('test'));
  }
}

var selectOption1 = [
  {'value': '选项1', 'label': '黄金糕'},
  {'value': '选项2', 'label': '双皮奶'},
  {'value': '选项3', 'label': '蚵仔煎'},
  {'value': '选项4', 'label': '龙须面'},
  {'value': '选项5', 'label': '北京烤鸭'}
];
