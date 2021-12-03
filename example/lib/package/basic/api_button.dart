import 'package:flutter/material.dart';
import 'package:wao_ui/src/basic/w_button.dart';

class ApiButton extends StatelessWidget {
  const ApiButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WButton'),
      WButton(),
    ]);
  }
}
