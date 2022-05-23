import 'package:example/demo/demos.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

registMaterialButton() {
  final FocusNode focusNode = FocusNode();
  Color getTextColor(Set<MaterialState> states) {
    final Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.green[900]!;
    }
    return Colors.green[600]!;
  }

  var textButtonTheme = Demo(
    'textButtonTheme',
    TextButtonTheme(
      data: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.resolveWith<Color>(getTextColor),
        ),
      ),
      child: Builder(
        builder: (BuildContext context) {
          return TextButton(
            onPressed: () {},
            focusNode: focusNode,
            child: const Text('TextButton'),
          );
        },
      ),
    ),
    r'''
    final FocusNode focusNode = FocusNode();

    // 适合作为全局方法来设计，用来控制应用中相同状态下的元素颜色（前景、背景、边框等）。
    Color getTextColor(Set<MaterialState> states) {
      final Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.green[900]!;
      }
      return Colors.green[600]!;
    }
    
    TextButtonTheme(
      data: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.resolveWith<Color>(getTextColor),
        ),
      ),
      child: Builder(
        builder: (BuildContext context) {
          return TextButton(
            onPressed: () {},
            focusNode: focusNode,
            child: const Text('TextButton'),
          );
        },
      ),
    ),
    ''',
  );

  var toggleButtonsValue = [false, true, false];
  var toggleButtons = Demo(
    'toggleButtons',
    StatefulBuilder(
      builder: (context, setState) {
        return ToggleButtonsTheme(
          data: const ToggleButtonsThemeData(
            constraints: BoxConstraints(
              minWidth: 80.0,
              minHeight: 40.0,
            ),
          ),
          child: ToggleButtons(
            onPressed: (int index) {
              var oldSelected =
                  toggleButtonsValue.indexWhere((element) => element == true);
              toggleButtonsValue[oldSelected] = false;
              toggleButtonsValue[index] = true;
              setState(() {});
            },
            isSelected: toggleButtonsValue,
            children: const <Widget>[
              Text('按钮1'),
              Text('按钮2'),
              Text('按钮3'),
            ],
          ),
        );
      },
    ),
    r'''
    var toggleButtonsValue = [false, true, false];

    StatefulBuilder(
      builder: (context, setState) {
        return ToggleButtonsTheme(
          data: const ToggleButtonsThemeData(
            constraints: BoxConstraints(
              minWidth: 80.0,
              minHeight: 40.0,
            ),
          ),
          child: ToggleButtons(
            onPressed: (int index) {
              var oldSelected =
                  toggleButtonsValue.indexWhere((element) => element == true);
              toggleButtonsValue[oldSelected] = false;
              toggleButtonsValue[index] = true;
              setState(() {});
            },
            isSelected: toggleButtonsValue,
            children: const <Widget>[
              Text('按钮1'),
              Text('按钮2'),
              Text('按钮3'),
            ],
          ),
        );
      },
    ),
    ''',
    'ToggleButtonsTheme',
  );

  var materialButtonWithStyle = Demo(
    'materialButtonWithStyle',
    MaterialButton(
      color: Colors.orange,
      textColor: Colors.orange.shade50,
      focusColor: Colors.orange.shade900,
      hoverColor: Colors.orange.shade900,
      onPressed: () {},
      child: const Text('确定'),
    ),
    r'''
    MaterialButton(
      color: Colors.orange,
      textColor: Colors.orange.shade50,
      focusColor: Colors.orange.shade900,
      hoverColor: Colors.orange.shade900,
      onPressed: () {},
      child: const Text('确定'),
    ),
    ''',
    'MaterialButton',
  );
}
