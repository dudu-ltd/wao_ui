import 'package:flutter/material.dart';
import 'package:wao_ui/src/navigation/w_tabs.dart';

class ApiTabs extends StatelessWidget {
  const ApiTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WTabs'),
      WTabs(),
    ]);
  }
}
