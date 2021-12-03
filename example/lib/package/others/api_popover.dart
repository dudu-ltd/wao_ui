import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_popover.dart';

class ApiPopover extends StatelessWidget {
  const ApiPopover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WPopover'),
      WPopover(),
    ]);
  }
}
