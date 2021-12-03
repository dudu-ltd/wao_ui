import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_select.dart';

class ApiSelect extends StatelessWidget {
  const ApiSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WSelect'),
      WSelect(),
    ]);
  }
}
