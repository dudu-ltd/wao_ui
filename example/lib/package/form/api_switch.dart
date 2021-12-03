import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_switch.dart';

class ApiSwitch extends StatelessWidget {
  const ApiSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WSwitch'),
      WSwitch(),
    ]);
  }
}
