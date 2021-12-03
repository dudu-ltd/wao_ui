import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_checkbox.dart';

class ApiCheckbox extends StatelessWidget {
  const ApiCheckbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WCheckbox'),
      WCheckbox(),
    ]);
  }
}
