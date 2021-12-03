import 'package:flutter/material.dart';
import 'package:wao_ui/src/notice/w_message_box.dart';

class ApiMessageBox extends StatelessWidget {
  const ApiMessageBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WMessageBox'),
      WMessageBox(),
    ]);
  }
}
