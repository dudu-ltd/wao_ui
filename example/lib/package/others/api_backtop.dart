import 'package:flutter/material.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/src/others/w_backtop.dart';

class ApiBacktop extends StatelessWidget {
  const ApiBacktop({Key? key}) : super(key: key);

  Widget get basic {
    return Column(
      children: [
        const Text('Scroll down to see the bottom-right button.'),
        WBacktop(
          props: WBacktopProp(target: ''),
        ),
      ],
    );
  }

  Widget get custom {
    return Column(
      children: [
        const Text('Scroll down to see the bottom-right button.'),
        WBacktop(
          props: WBacktopProp(bottom: 100, target: ''),
          slots: WBacktopSlot(
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorUtil.hexToColor('#F2F5F6'),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, .12),
                    spreadRadius: 6,
                  )
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                'UP',
                style: TextStyle(
                  fontSize: 40,
                  color: ColorUtil.hexToColor('#1989fa'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WBacktop'),
      const Text('基本用法'),
      basic,
      const Text('自定义显示内容'),
      custom,
    ]);
  }
}
