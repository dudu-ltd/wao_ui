import 'package:flutter/material.dart';
import 'package:wao_ui/src/data/w_tag.dart';

class ApiTag extends StatelessWidget {
  const ApiTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WTag'),
      WTag(),
    ]);
  }
}
