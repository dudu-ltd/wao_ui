import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_upload.dart';

class ApiUpload extends StatelessWidget {
  const ApiUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WUpload'),
      WUpload(),
    ]);
  }
}
