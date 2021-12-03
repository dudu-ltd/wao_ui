import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_transfer.dart';

class ApiTransfer extends StatelessWidget {
  const ApiTransfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WTransfer'),
      WTransfer(),
    ]);
  }
}
