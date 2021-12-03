import 'package:flutter/material.dart';
import 'package:wao_ui/src/data/w_skeleton.dart';

class ApiSkeleton extends StatelessWidget {
  const ApiSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WSkeleton'),
      WSkeleton(),
    ]);
  }
}
