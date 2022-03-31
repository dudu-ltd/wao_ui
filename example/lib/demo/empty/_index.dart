import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  emptyBasic;
  emptyDesc;
  emptyImg;
  emptyDefaultSlot;
}

var emptyBasic = Demo(
  'emptyBasic',
  WEmpty(),
  r'''
  WEmpty()
  ''',
);

var emptyDesc = Demo(
  'emptyDesc',
  WEmpty()..$props.description = '暂无数据',
  r'''
WEmpty()..$props.description = '暂无数据'
  ''',
);

var emptyImg = Demo(
  'emptyImg',
  WEmpty()..$props.image = 'assets:assets/image/wth.jpg',
  r'''
WEmpty()..$props.image = 'assets:assets/image/wth.jpg'
  ''',
);

var emptyDefaultSlot = Demo(
  'emptyDefaultSlot',
  WEmpty()
    ..$props.description = '暂无数据，请点击跳转'
    ..$slots.$ = (WButton()
      ..$props.type = 'primary'
      ..$slots.$ = '跳转'),
  r'''
  WEmpty()
    ..$props.description = '暂无数据，请点击跳转'
    ..$slots.$ = (WButton()
      ..$props.type = 'primary'
      ..$slots.$ = '跳转'),
  ''',
);
