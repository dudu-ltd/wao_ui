import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_radio.dart';

class ApiRadio extends StatelessWidget {
  const ApiRadio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WRadio'),
      WRadio(),
    ]);
  }
}
