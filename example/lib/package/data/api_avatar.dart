import 'package:flutter/material.dart';
import 'package:wao_ui/src/data/w_avatar.dart';

class ApiAvatar extends StatelessWidget {
  const ApiAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WAvatar'),
      WAvatar(),
    ]);
  }
}
