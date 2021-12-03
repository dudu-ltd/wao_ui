import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_infinite_scroll.dart';

class ApiInfiniteScroll extends StatelessWidget {
  const ApiInfiniteScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WInfiniteScroll'),
      WInfiniteScroll(),
    ]);
  }
}
