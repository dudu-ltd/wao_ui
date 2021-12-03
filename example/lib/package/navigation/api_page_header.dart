import 'package:flutter/material.dart';
import 'package:wao_ui/src/navigation/w_page_header.dart';

class ApiPageHeader extends StatelessWidget {
  const ApiPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WPageHeader'),
      WPageHeader(),
    ]);
  }
}
