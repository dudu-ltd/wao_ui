import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_divider.dart';

class ApiDivider extends StatelessWidget {
  const ApiDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WDivider'),
      WDivider(),
    ]);
  }
}
