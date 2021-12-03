import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_calendar.dart';

class ApiCalendar extends StatelessWidget {
  const ApiCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WCalendar'),
      WCalendar(),
    ]);
  }
}
