import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_backtop.dart';

class ApiBacktop extends StatelessWidget {
  const ApiBacktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WBacktop'),
      WBacktop(),
    ]);
  }
}
