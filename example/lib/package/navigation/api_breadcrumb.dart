import 'package:flutter/material.dart';
import 'package:wao_ui/src/navigation/w_breadcrumb.dart';

class ApiBreadcrumb extends StatelessWidget {
  const ApiBreadcrumb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WBreadcrumb'),
      WBreadcrumb(),
    ]);
  }
}
