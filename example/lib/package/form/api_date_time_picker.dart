import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_date_time_picker.dart';

class ApiDateTimePicker extends StatelessWidget {
  const ApiDateTimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WDateTimePicker'),
      WDateTimePicker(),
    ]);
  }
}
