import 'package:flutter/material.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

class ApiTabs extends StatelessWidget {
  const ApiTabs({Key? key}) : super(key: key);

  Widget get basic {
    var tabs = WTabs();
    tabs
      ..$on.tabClick = (e) {
        print(e);
      }
      ..$props.model = 'second'
      ..$slots.$ = [
        WTabPane()
          ..$props.label = '用户管理'
          ..$props.name = 'first'
          ..$slots.$ = [
            WButton()
              ..$slots.$ = '测试'
              ..$on.click = () {
                print('ceui');
              },
          ],
        WTabPane()
          ..$props.label = '配置管理'
          ..$props.name = 'second'
          ..$slots.$ = '配置管理',
        WTabPane()
          ..$props.label = '角色管理'
          ..$props.name = 'third'
          ..$slots.$ = '角色管理',
        WTabPane()
          ..$props.label = '定时任务补偿'
          ..$props.name = 'fourth'
          ..$slots.$ = '定时任务补偿',
      ];

    return tabs;
  }

  Widget get card {
    var tabs = WTabs();
    tabs
      ..$on.tabClick = (e) {
        print(e);
      }
      ..$props.model = 'second'
      ..$props.type = 'card'
      ..$slots.$ = [
        WTabPane()
          ..$props.label = '用户管理'
          ..$props.name = 'first'
          ..$slots.$ = '用户管理',
        WTabPane()
          ..$props.label = '配置管理'
          ..$props.name = 'second'
          ..$slots.$ = '配置管理',
        WTabPane()
          ..$props.label = '角色管理'
          ..$props.name = 'third'
          ..$slots.$ = '角色管理',
        WTabPane()
          ..$props.label = '定时任务补偿'
          ..$props.name = 'fourth'
          ..$slots.$ = '定时任务补偿',
      ];
    return tabs;
  }

  Widget get borderCard {
    var tabs = WTabs();
    tabs
      ..$props.model = 'second'
      ..$props.type = 'border-card'
      ..$slots.$ = [
        WTabPane()
          ..$props.label = '用户管理'
          ..$props.name = 'first'
          ..$slots.$ = '用户管理',
        WTabPane()
          ..$props.label = '配置管理'
          ..$props.name = 'second'
          ..$slots.$ = '配置管理',
        WTabPane()
          ..$props.label = '角色管理'
          ..$props.name = 'third'
          ..$slots.$ = '角色管理',
        WTabPane()
          ..$props.label = '定时任务补偿'
          ..$props.name = 'fourth'
          ..$slots.$ = '定时任务补偿',
      ];
    return tabs;
  }

  Widget get position {
    var position = ValueNotifier('right');
    var tabs = StatefulBuilder(
      builder: (BuildContext context, setState) {
        position.addListener(() {
          print(1);
          setState(() {});
        });
        return WTabs()
          ..$props.model = 'second'
          ..$props.type = 'card'
          ..$props.tabPosition = position.value
          ..$slots.$ = [
            WTabPane()
              ..$props.label = '用户管理'
              ..$props.name = 'first'
              ..$slots.$ = '用户管理',
            WTabPane()
              ..$props.label = '配置管理'
              ..$props.name = 'second'
              ..$slots.$ = '配置管理',
            WTabPane()
              ..$props.label = '角色管理'
              ..$props.name = 'third'
              ..$slots.$ = '角色管理',
            WTabPane()
              ..$props.label = '定时任务补偿'
              ..$props.name = 'fourth'
              ..$slots.$ = '定时任务补偿',
          ];
      },
    );
    return Column(
      children: [
        WRadioGroup()
          ..$props.value = position
          ..$slots.$ = [
            WRadioButton()
              ..$props.label = 'top'
              ..$slots.$ = 'top',
            WRadioButton()
              ..$props.label = 'right'
              ..$slots.$ = 'right',
            WRadioButton()
              ..$props.label = 'bottom'
              ..$slots.$ = 'bottom',
            WRadioButton()
              ..$props.label = 'left'
              ..$slots.$ = 'left',
          ],
        tabs,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('WTabs'),
          ____________________________________,
          const Text('基本使用'),
          ____________________________________,
          paddingWrapper(basic),
          ____________________________________,
          const Text('选项卡样式'),
          ____________________________________,
          paddingWrapper(card),
          ____________________________________,
          const Text('卡片化'),
          ____________________________________,
          paddingWrapper(borderCard),
          ____________________________________,
          const Text('位置'),
          ____________________________________,
          paddingWrapper(position),
          ____________________________________,
        ],
      ),
    );
  }

  final Widget ____________________________________ = const SizedBox(
    height: 10,
    width: 1,
  );
}
