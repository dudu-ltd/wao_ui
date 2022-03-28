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
        props: num,
      )..$slots.$ = WButton(
          slots: WButtonSlot('评论'),
          props: WButtonProp(type: 'info'),
          on: WButtonOn(click: () {
            num.value++;
          }),
        ),
      WBadge(
        props: WBadgeProp(value: 3, max: 10),
      )..$slots.$ =
          WButton(slots: WButtonSlot('回复'), props: WButtonProp(type: 'info')),
      WBadge(
        props: WBadgeProp(value: 1, max: 10, type: 'primary'),
      )..$slots.$ =
          WButton(slots: WButtonSlot('评论'), props: WButtonProp(type: 'info')),
      WBadge(
        props: WBadgeProp(value: 2, max: 10, type: 'warning'),
      )..$slots.$ =
          WButton(slots: WButtonSlot('回复'), props: WButtonProp(type: 'info')),
      WBadge(
        props: WBadgeProp(value: 1, max: 10, type: 'warning', isDot: true),
      )..$slots.$ =
          WButton(slots: WButtonSlot('红点'), props: WButtonProp(type: 'info')),
    ];

    var customGroup = [
      WBadge(
        props: WBadgeProp(value: 'new', max: 10, type: 'danger'),
      )..$slots.$ =
          WButton(slots: WButtonSlot('红点'), props: WButtonProp(type: 'info')),
    ];

    return ListView(children: [
      Row(children: basicGroup),
      Row(children: customGroup),
    ]);
  }
}
