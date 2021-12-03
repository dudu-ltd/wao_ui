import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_date_picker.dart';

class ApiDatePicker extends StatelessWidget {
  const ApiDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WDatePicker'),
      WDatePicker(),
    ]);
  }
}
