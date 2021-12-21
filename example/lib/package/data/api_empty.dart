import 'package:flutter/material.dart';
import 'package:wao_ui/src/data/w_empty.dart';
import 'package:wao_ui/src/basic/w_button.dart';

class ApiEmpty extends StatelessWidget {
  const ApiEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('WEmpty'),
        WEmpty(
          WButton(
            slots: WButtonSlot('按钮'),
            props: WButtonProp(size: 'mini'),
          ),
          props: WEmptyProp(description: '内容是空的呦~'),
        ),
      ],
    );
  }
}
