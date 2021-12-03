import 'package:flutter/material.dart';
import 'package:wao_ui/src/data/w_empty.dart';

class ApiEmpty extends StatelessWidget {
  const ApiEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WEmpty'),
      WEmpty(),
    ]);
  }
}
