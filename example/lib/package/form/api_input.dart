import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_input.dart';

class ApiInput extends StatelessWidget {
  const ApiInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WInput'),
      WInput(),
    ]);
  }
}
