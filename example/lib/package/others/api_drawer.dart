import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_drawer.dart';

class ApiDrawer extends StatelessWidget {
  const ApiDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WDrawer'),
      WDrawer(),
    ]);
  }
}
