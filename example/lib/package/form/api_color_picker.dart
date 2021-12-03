import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_color_picker.dart';

class ApiColorPicker extends StatelessWidget {
  const ApiColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WColorPicker'),
      WColorPicker(),
    ]);
  }
}
