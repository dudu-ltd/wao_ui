import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_image.dart';

class ApiImage extends StatelessWidget {
  const ApiImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WImage'),
      WImage(),
    ]);
  }
}
