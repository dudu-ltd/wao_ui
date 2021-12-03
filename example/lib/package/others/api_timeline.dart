import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_timeline.dart';

class ApiTimeline extends StatelessWidget {
  const ApiTimeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WTimeline'),
      WTimeline(),
    ]);
  }
}
