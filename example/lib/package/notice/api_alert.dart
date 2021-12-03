import 'package:flutter/material.dart';
import 'package:wao_ui/src/notice/w_alert.dart';

class ApiAlert extends StatelessWidget {
  const ApiAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WAlert'),
      WAlert(),
    ]);
  }
}
