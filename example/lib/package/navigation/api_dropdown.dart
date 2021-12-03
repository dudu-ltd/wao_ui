import 'package:flutter/material.dart';
import 'package:wao_ui/src/navigation/w_dropdown.dart';

class ApiDropdown extends StatelessWidget {
  const ApiDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WDropdown'),
      WDropdown(),
    ]);
  }
}
