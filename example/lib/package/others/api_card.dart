import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

class ApiCard extends StatelessWidget {
  const ApiCard({Key? key}) : super(key: key);

  Widget get basic {
    return WCard(
      slots: WCardSlot(
        Column(
          children: List.generate(
            4,
            (index) => Text('列表内容$index'),
          ),
        ),
        header: Row(
          children: [
            const Expanded(
              child: Text('卡片名称'),
            ),
            WButton(
              props: WButtonProp(type: 'primary'),
              slots: WButtonSlot('操作按钮'),
            ),
          ],
        ),
      ),
    );
  }

  Widget get simple {
    return WCard(
      slots: WCardSlot(
        Column(
          children: List.generate(
            4,
            (index) => Text('列表内容$index'),
          ),
        ),
      ),
    );
  }

  Widget get picture {
    return Wrap(
      spacing: 8,
      children: List.generate(2, (index) {
        return WCard(
          slots: WCardSlot([
            Image.network(
                'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png'),
            Container(
              padding: EdgeInsets.all(14),
              child: Column(
                children: [
                  Text('好吃的汉堡'),
                  Row(
                    children: [
                      Expanded(
                        child: Text(DateTime.now().toString()),
                      ),
                      WButton(
                        props: WButtonProp(type: 'primary'),
                        slots: WButtonSlot('操作按钮'),
                      ),
                    ],
                  )
                ],
              ),
            )
          ]),
        );
      }),
    );
  }

  Widget get shadow {
    return Wrap(
      spacing: 8,
      children: [
        WCard(
            props: WCardProp(shadow: 'always'), slots: WCardSlot(Text('总是显示'))),
        WCard(
            props: WCardProp(shadow: 'hover'),
            slots: WCardSlot(Text('鼠标悬浮时显示'))),
        WCard(
            props: WCardProp(shadow: 'never'), slots: WCardSlot(Text('从不显示'))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WCard'),
      const Text('基本用法'),
      basic,
      const Text('简单卡片'),
      simple,
      const Text('带图片'),
      picture,
      const Text('卡片阴影'),
      shadow,
    ]);
  }
}
