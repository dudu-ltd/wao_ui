import 'package:flutter/material.dart';
import 'package:wao_ui/src/notice/w_message.dart';

class ApiMessage extends StatelessWidget {
  const ApiMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WMessage'),
      WMessage(),
    ]);
  }
}
