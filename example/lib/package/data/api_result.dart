import 'package:flutter/material.dart';
import 'package:wao_ui/src/data/w_result.dart';

class ApiResult extends StatelessWidget {
  const ApiResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WResult'),
      WResult(),
    ]);
  }
}
