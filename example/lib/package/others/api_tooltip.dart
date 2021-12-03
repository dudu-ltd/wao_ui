import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_tooltip.dart';

class ApiTooltip extends StatelessWidget {
  const ApiTooltip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WTooltip'),
      WTooltip(),
    ]);
  }
}
