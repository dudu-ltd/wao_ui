import 'package:wao_ui/wao_ui.dart';

import '../../demos.dart';

regist() {
  var tabsBasic = Demo(
    'tabsBasic',
    WTabs()
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
      ],
    r'''
    WTabs()
      ..$on.tabClick = (e) {
        print(e);
      }
      ..$props.value = 'second'
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
      ]
    ''',
  );

  var tabsCard = Demo(
    'tabsCard',
    WTabs()
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
      ],
    r'''
    WTabs()
      ..$on.tabClick = (e) {
        print(e);
      }
      ..$props.value = 'second'
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
      ]
    ''',
  );

  var tabsBorderCard = Demo(
    'tabsBorderCard',
    WTabs()
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
      ],
    r'''
  WTabs()..$props.value = 'second'
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
      ]
    ''',
  );

  var tabsPosition = Demo(
    'tabsPosition',
    WTabs()
      ..$props.model = 'second'
      ..$props.type = 'card'
      ..$props.tabPosition = 'right'
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
      ],
    r'''
    WTabs()
      ..$props.value = 'second'
      ..$props.type = 'card'
      ..$props.tabPosition = 'right'
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
      ]
    ''',
  );
}
