import 'package:flutter/material.dart';
import 'package:wao_ui/src/data/w_descriptions.dart';

class ApiDescriptions extends StatelessWidget {
  const ApiDescriptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WDescriptions'),
      WDescriptions(),
    ]);
  }
}
