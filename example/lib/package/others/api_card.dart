import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

class ApiCard extends StatelessWidget {
  const ApiCard({Key? key}) : super(key: key);

  Widget get basic {
    return WCard(
      style: WCardStyle(width: 480),
      slots: WCardSlot(
        List.generate(
          4,
          (index) => Text('列表内容${index + 1}'),
        ),
        header: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Expanded(
              child: Text(
                '卡片名称',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            WButton(
              props: WButtonProp(type: 'text', size: 'mini'),
              slots: WButtonSlot(Text(
                '操作按钮',
                style: TextStyle(color: CfgGlobal.primaryColor),
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget get simple {
    return WCard(
        style: WCardStyle(width: 480),
        slots: WCardSlot(
          List.generate(
            4,
            (index) => Text('列表内容${index + 1}'),
          ),
        ));
  }

  Widget get picture {
    return Wrap(
      spacing: 20,
      children: List.generate(2, (index) {
        return WCard(
          style: WCardStyle(
            padding: EdgeInsets.zero,
            spacing: 0,
          ),
          props: WCardProp(shadow: 'hover'),
          slots: WCardSlot([
            Image.network(
                'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png'),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 235.5),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('好吃的汉堡'),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            DateTime.now().toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        WButton(
                          props: WButtonProp(type: 'text', size: 'mini'),
                          on: WButtonOn(click: () {
                            print('eeee');
                          }),
                          slots: WButtonSlot(Text(
                            '操作按钮',
                            style: TextStyle(color: CfgGlobal.primaryColor),
                          )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ]),
        );
      }),
    );
  }

  Widget get shadow {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: WCard(
              props: WCardProp(shadow: 'always'),
              slots: WCardSlot(Text('总是显示')),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: WCard(
              props: WCardProp(shadow: 'hover'),
              slots: WCardSlot(Text('鼠标悬浮时显示')),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: WCard(
              props: WCardProp(shadow: 'never'),
              slots: WCardSlot(Text('从不显示')),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('WCard'),
            ____________________________________,
            const Text('基本用法'),
            ____________________________________,
            basic,
            ____________________________________,
            const Text('简单卡片'),
            ____________________________________,
            simple,
            ____________________________________,
            const Text('带图片'),
            ____________________________________,
            picture,
            ____________________________________,
            const Text('卡片阴影'),
            ____________________________________,
            shadow,
            ____________________________________,
          ],
        ),
      ),
    );
  }

  final Widget ____________________________________ = const SizedBox(
    height: 10,
    width: 1,
  );
}
