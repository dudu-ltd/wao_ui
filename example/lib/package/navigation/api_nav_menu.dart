import 'package:flutter/material.dart';
import 'package:wao_ui/src/navigation/w_nav_menu.dart';

class ApiNavMenu extends StatelessWidget {
  const ApiNavMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WNavMenu'),
      WNavMenu(),
    ]);
  }
}
