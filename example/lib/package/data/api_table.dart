import 'package:flutter/material.dart';
import 'package:wao_ui/src/data/w_table.dart';

class ApiTable extends StatelessWidget {
  const ApiTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WTable'),
      WTable(),
    ]);
  }
}
