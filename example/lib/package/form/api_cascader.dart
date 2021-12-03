import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_cascader.dart';

class ApiCascader extends StatelessWidget {
  const ApiCascader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WCascader'),
      WCascader(),
    ]);
  }
}
