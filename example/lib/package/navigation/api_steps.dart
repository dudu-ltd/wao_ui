import 'package:flutter/material.dart';
import 'package:wao_ui/src/navigation/w_steps.dart';

class ApiSteps extends StatelessWidget {
  const ApiSteps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WSteps'),
      WSteps(),
    ]);
  }
}
