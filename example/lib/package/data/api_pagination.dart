import 'package:flutter/material.dart';
import 'package:wao_ui/src/data/w_pagination.dart';

class ApiPagination extends StatelessWidget {
  const ApiPagination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WPagination'),
      WPagination(),
    ]);
  }
}
