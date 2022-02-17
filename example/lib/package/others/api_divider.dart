import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_divider.dart';

class ApiDivider extends StatelessWidget {
  const ApiDivider({Key? key}) : super(key: key);

  final Widget ____________________________________ = const SizedBox(
    height: 10,
    width: 1,
  );

  Widget get basic {
    return Column(
      children: [
        Text('青春是一个短暂的美梦, 当你醒来时, 它早已消失无踪'),
        WDivider(),
        Text('少量的邪恶足以抵消全部高贵的品质, 害得人声名狼藉'),
      ],
    );
  }

  Widget get content {
    return Column(
      children: [
        Text('头上一片晴天，心中一个想念'),
        WDivider(
          props: WDividerProp(contentPosition: Alignment.centerLeft),
          slots: WDividerSlot(Text('少年包青天')),
        ),
        Text('饿了别叫妈, 叫饿了么'),
        WDivider(
          props: WDividerProp(contentPosition: Alignment.centerLeft),
          slots: WDividerSlot(Icon(Icons.mobile_friendly)),
        ),
        Text('为了无法计算的价值'),
        WDivider(
          props: WDividerProp(contentPosition: Alignment.centerRight),
          slots: WDividerSlot(Text('阿里云')),
        ),
      ],
    );
  }

  Widget get split {
    return Row(
      children: [
        Text('雨纷纷'),
        WDivider(
          props: WDividerProp(direction: Axis.vertical),
        ),
        Text('旧故里'),
        WDivider(
          props: WDividerProp(direction: Axis.vertical),
        ),
        Text('草木深'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WDivider'),
      ____________________________________,
      const Text('基本用法'),
      ____________________________________,
      basic,
      const Text('设置文案'),
      ____________________________________,
      content,
      const Text('垂直分割'),
      ____________________________________,
      split,
    ]);
  }
}
