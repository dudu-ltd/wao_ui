import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_collapse.dart';

class ApiCollapse extends StatelessWidget {
  const ApiCollapse({Key? key}) : super(key: key);

  // Widget get basic {
  //   return WCollapse(
  //       props: WCollapseProp({
  //     activeName: ['']
  //   }));
  // }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WCollapse'),
      WCollapse(),
    ]);
  }
}
