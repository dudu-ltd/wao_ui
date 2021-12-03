import 'package:flutter/material.dart';
import 'package:wao_ui/src/notice/w_loading.dart';

class ApiLoading extends StatelessWidget {
  const ApiLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WLoading'),
      WLoading(),
    ]);
  }
}
