import 'package:flutter/material.dart';
import 'package:wao_ui/src/data/w_progress.dart';

class ApiProgress extends StatelessWidget {
  const ApiProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WProgress'),
      WProgress(),
    ]);
  }
}
