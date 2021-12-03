import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_rate.dart';

class ApiRate extends StatelessWidget {
  const ApiRate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WRate'),
      WRate(),
    ]);
  }
}
