import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  var tagBasic1 = Demo(
    'tagBasic1',
    WTag()
      ..$slots.$ = '标签一'
      ..$props.type = 'primary',
    r'''
    WTag()
      ..$slots.$ = '标签一'
      ..$props.type = 'primary'
    ''',
  );

  var tagBasic2 = Demo(
    'tagBasic2',
    WTag()
      ..$slots.$ = '标签二'
      ..$props.type = 'success',
    r'''
    WTag()
    ..$slots.$ = '标签二'
    ..$props.type = 'success'
    ''',
  );
  var tagBasic3 = Demo(
    'tagBasic3',
    WTag()
      ..$slots.$ = '标签三'
      ..$props.type = 'info',
    r'''
    WTag()
      ..$slots.$ = '标签三'
      ..$props.type = 'info'
    ''',
  );

  var tagBasic4 = Demo(
    'tagBasic4',
    WTag()
      ..$slots.$ = '标签四'
      ..$props.type = 'warning',
    r'''
    WTag()
      ..$slots.$ = '标签四'
      ..$props.type = 'warning',
    ''',
  );

  var tagBasic5 = Demo(
    'tagBasic5',
    WTag()
      ..$slots.$ = '标签五'
      ..$props.type = 'danger',
    r'''
    WTag()
      ..$slots.$ = '标签五'
      ..$props.type = 'danger'
    ''',
  );
  var tagBasic6 = Demo(
    'tagBasic6',
    WTag()
      ..$slots.$ = '标签六'
      ..$props.type = 'text',
    r'''
    WTag()
      ..$slots.$ = '标签六'
      ..$props.type = 'text'
    ''',
  );

  var tagRemovabled1 = Demo(
    'tagRemovabled1',
    WTag()
      ..$slots.$ = '标签一'
      ..$props.closable = true
      ..$props.type = 'primary',
    r'''
    WTag()
      ..$slots.$ = '标签一'
      ..$props.closable = true
      ..$props.type = 'primary'
    ''',
  );

  var tagRemovabled2 = Demo(
    'tagRemovabled2',
    WTag()
      ..$slots.$ = '标签二'
      ..$props.closable = true
      ..$props.type = 'success',
    r'''
    WTag()
    ..$slots.$ = '标签二'
    ..$props.closable = true
    ..$props.type = 'success'
    ''',
  );

  var tagRemovabled3 = Demo(
    'tagRemovabled3',
    WTag()
      ..$slots.$ = '标签三'
      ..$props.closable = true
      ..$props.type = 'info',
    r'''
    WTag()
    ..$slots.$ = '标签三'
    ..$props.closable = true
    ..$props.type = 'info'
    ''',
  );

  var tagRemovabled4 = Demo(
    'tagRemovabled4',
    WTag()
      ..$slots.$ = '标签四'
      ..$props.closable = true
      ..$props.type = 'warning',
    r'''
    WTag()
      ..$slots.$ = '标签四'
      ..$props.closable = true
      ..$props.type = 'warning'
    ''',
  );

  var tagRemovabled5 = Demo(
    'tagRemovabled5',
    WTag()
      ..$slots.$ = '标签五'
      ..$props.closable = true
      ..$props.type = 'danger',
    r'''
    WTag()
      ..$slots.$ = '标签五'
      ..$props.closable = true
      ..$props.type = 'danger'
    ''',
  );

  var tagRemovabled6 = Demo(
    'tagRemovabled6',
    WTag()
      ..$slots.$ = '标签六'
      ..$props.closable = true
      ..$props.type = 'text',
    r'''
    WTag()
      ..$slots.$ = '标签六'
      ..$props.closable = true
      ..$props.type = 'text',
    ''',
  );

  var tagSize1 = Demo(
    'tagSize1',
    WTag()..$slots.$ = '默认标签',
    r'''
    WTag()..$slots.$ = '默认标签'
    ''',
  );

  var tagSize2 = Demo(
    'tagSize2',
    WTag()
      ..$slots.$ = '中等标签'
      ..$props.size = 'medium',
    r'''
    WTag()
      ..$slots.$ = '中等标签'
      ..$props.size = 'medium' ''',
  );

  var tagSize3 = Demo(
    'tagSize3',
    WTag()
      ..$slots.$ = '小型标签'
      ..$props.size = 'small',
    r'''
    WTag()
      ..$slots.$ = '小型标签'
      ..$props.size = 'small'
    ''',
  );

  var tagSize4 = Demo(
    'tagSize4',
    WTag()
      ..$slots.$ = '超小标签'
      ..$props.size = 'mini',
    r'''
    WTag()
      ..$slots.$ = '超小标签'
      ..$props.size = 'mini'
    ''',
  );

  var tagDark1 = Demo(
    'tagDark1',
    WTag()
      ..$slots.$ = '标签一'
      ..$props.effect = 'dark'
      ..$props.closable = true,
    r'''
    WTag()
      ..$slots.$ = '标签一'
      ..$props.effect = 'dark'
      ..$props.closable = true
    ''',
  );

  var tagDark2 = Demo(
    'tagDark2',
    WTag()
      ..$slots.$ = '标签二'
      ..$props.effect = 'dark'
      ..$props.type = 'success'
      ..$props.closable = true,
    r'''
    WTag()
      ..$slots.$ = '标签二'
      ..$props.effect = 'dark'
      ..$props.type = 'success'
      ..$props.closable = true
    ''',
  );

  var tagDark3 = Demo(
    'tagDark3',
    WTag()
      ..$slots.$ = '标签三'
      ..$props.effect = 'dark'
      ..$props.type = 'info'
      ..$props.closable = true,
    r'''
    WTag()
      ..$slots.$ = '标签三'
      ..$props.effect = 'dark'
      ..$props.type = 'info'
      ..$props.closable = true
    ''',
  );

  var tagDark4 = Demo(
    'tagDark4',
    WTag()
      ..$slots.$ = '标签四'
      ..$props.effect = 'dark'
      ..$props.type = 'warning'
      ..$props.closable = true,
    r'''
    WTag()
      ..$slots.$ = '标签四'
      ..$props.effect = 'dark'
      ..$props.type = 'warning'
      ..$props.closable = true
    ''',
  );

  var tagDark5 = Demo(
    'tagDark5',
    WTag()
      ..$slots.$ = '标签五'
      ..$props.effect = 'dark'
      ..$props.type = 'danger'
      ..$props.closable = true,
    r'''
    WTag()
      ..$slots.$ = '标签五'
      ..$props.effect = 'dark'
      ..$props.type = 'danger'
      ..$props.closable = true
    ''',
  );

  var tagDark6 = Demo(
    'tagDark6',
    WTag()
      ..$slots.$ = '标签六'
      ..$props.effect = 'dark'
      ..$props.type = 'text'
      ..$props.closable = true,
    r'''
    WTag()
      ..$slots.$ = '标签六'
      ..$props.effect = 'dark'
      ..$props.type = 'text'
      ..$props.closable = true
    ''',
  );

  var tagPlain1 = Demo(
    'tagPlain1',
    WTag()
      ..$slots.$ = '标签一'
      ..$props.effect = 'plain'
      ..$props.closable = true,
    r'''
    WTag()
      ..$slots.$ = '标签一'
      ..$props.effect = 'plain'
      ..$props.closable = true
    ''',
  );

  var tagPlain2 = Demo(
    'tagPlain2',
    WTag()
      ..$slots.$ = '标签二'
      ..$props.effect = 'plain'
      ..$props.type = 'success'
      ..$props.closable = true,
    r'''
    WTag()
      ..$slots.$ = '标签二'
      ..$props.effect = 'plain'
      ..$props.type = 'success'
      ..$props.closable = true
    ''',
  );

  var tagPlain3 = Demo(
    'tagPlain3',
    WTag()
      ..$slots.$ = '标签三'
      ..$props.effect = 'plain'
      ..$props.type = 'info'
      ..$props.closable = true,
    r'''
    WTag()
      ..$slots.$ = '标签三'
      ..$props.effect = 'plain'
      ..$props.type = 'info'
      ..$props.closable = true
    ''',
  );

  var tagPlain4 = Demo(
    'tagPlain4',
    WTag()
      ..$slots.$ = '标签四'
      ..$props.effect = 'plain'
      ..$props.type = 'warning'
      ..$props.closable = true,
    r'''
    WTag()
      ..$slots.$ = '标签四'
      ..$props.effect = 'plain'
      ..$props.type = 'warning'
      ..$props.closable = true
    ''',
  );

  var tagPlain5 = Demo(
    'tagPlain5',
    WTag()
      ..$slots.$ = '标签五'
      ..$props.effect = 'plain'
      ..$props.type = 'danger'
      ..$props.closable = true,
    r'''
    WTag()
    ..$slots.$ = '标签五'
    ..$props.effect = 'plain'
    ..$props.type = 'danger'
    ..$props.closable = true
    ''',
  );

  var tagPlain6 = Demo(
    'tagPlain6',
    WTag()
      ..$slots.$ = '标签六'
      ..$props.effect = 'plain'
      ..$props.type = 'text'
      ..$props.closable = true,
    r'''
    WTag()
      ..$slots.$ = '标签六'
      ..$props.effect = 'plain'
      ..$props.type = 'text'
      ..$props.closable = true
    ''',
  );
}
