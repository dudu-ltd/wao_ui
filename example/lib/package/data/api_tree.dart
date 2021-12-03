import 'package:flutter/material.dart';
import 'package:wao_ui/src/data/w_tree.dart';

class ApiTree extends StatelessWidget {
  const ApiTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WTree'),
      WTree(),
    ]);
  }
}
