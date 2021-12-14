import 'package:flutter/material.dart';
import 'package:wao_ui/src/data/w_badge.dart';
import 'package:wao_ui/src/basic/w_button.dart';

class ApiBadge extends StatelessWidget {
  const ApiBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var num = WBadgeProp(value: 7, max: 12);
    var basicGroup = [
      WBadge(
        WButton(
          '评论',
          props: WButtonProp(type: 'text'),
          on: WButtonOn(click: () {
            num.value++;
          }),
        ),
        props: num,
      ),
      WBadge(
        WButton('回复', props: WButtonProp(type: 'text')),
        props: WBadgeProp(value: 3, max: 10),
      ),
      WBadge(
        WButton('评论', props: WButtonProp(type: 'text')),
        props: WBadgeProp(value: 1, max: 10, type: 'primary'),
      ),
      WBadge(
        WButton('回复', props: WButtonProp(type: 'text')),
        props: WBadgeProp(value: 2, max: 10, type: 'warning'),
      ),
      WBadge(
        WButton('红点', props: WButtonProp(type: 'text')),
        props: WBadgeProp(value: 1, max: 10, type: 'warning', isDot: true),
      ),
    ];

    return ListView(children: [
      Row(children: basicGroup),
    ]);
  }
}
