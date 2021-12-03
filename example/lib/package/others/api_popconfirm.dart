import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_popconfirm.dart';

class ApiPopconfirm extends StatelessWidget {
  const ApiPopconfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WPopconfirm'),
      WPopconfirm(),
    ]);
  }
}
