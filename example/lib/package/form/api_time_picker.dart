import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_time_picker.dart';

class ApiTimePicker extends StatelessWidget {
  const ApiTimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WTimePicker'),
      WTimePicker(),
    ]);
  }
}
