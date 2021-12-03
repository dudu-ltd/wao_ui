import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_input_number.dart';

class ApiInputNumber extends StatelessWidget {
  const ApiInputNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WInputNumber'),
      WInputNumber(),
    ]);
  }
}
