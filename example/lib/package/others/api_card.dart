import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_card.dart';

class ApiCard extends StatelessWidget {
  const ApiCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WCard'),
      WCard(),
    ]);
  }
}
