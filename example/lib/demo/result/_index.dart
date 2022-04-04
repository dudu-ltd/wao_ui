import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  var resultBasic = Demo(
    'resultBasic',
    WResult(),
    r'''
    WResult()
    ''',
  );

  var resultBasicSuccess = Demo(
    'resultBasicSuccess',
    WResult()..$props.icon = 'success',
    r'''
    WResult()..$props.icon = 'success',
    ''',
  );

  var resultBasicWarning = Demo(
    'resultBasicWarning',
    WResult()..$props.icon = 'warning',
    r'''
    WResult()..$props.icon = 'warning',
    ''',
  );

  var resultBasicError = Demo(
    'resultBasicError',
    WResult()..$props.icon = 'error',
    r'''
    WResult()..$props.icon = 'error',
    ''',
  );

  var resultTitle = Demo(
    'resultTitle',
    WResult()..$props.title = '提示',
    r'''
    WResult()..$props.title = '提示',
    ''',
  );

  var resultTitleSuccess = Demo(
    'resultTitleSuccess',
    WResult()
      ..$props.icon = 'success'
      ..$props.title = '提示',
    r'''
    WResult()
      ..$props.icon = 'success'
      ..$props.title = '提示',
    ''',
  );

  var resultTitleWarning = Demo(
    'resultTitleWarning',
    WResult()
      ..$props.icon = 'warning'
      ..$props.title = '提示',
    r'''
    WResult()
      ..$props.icon = 'warning'
      ..$props.title = '提示',
    ''',
  );

  var resultTitleError = Demo(
    'resultTitleError',
    WResult()
      ..$props.icon = 'error'
      ..$props.title = '提示',
    r'''
    WResult()
      ..$props.icon = 'error'
      ..$props.title = '提示',
    ''',
  );

  var resultSuccess = Demo(
    'resultSuccess',
    WResult()
      ..$props.icon = 'success'
      ..$props.title = '提示'
      ..$props.subTitle = '请根据提示进行操作'
      ..$slots.extra = SizedBox(
        width: 80,
        child: WButton()
          ..$props.type = 'primary'
          ..$props.size = 'mini'
          ..$slots.$ = '返回',
      ),
    r'''
    WResult()
      ..$props.icon = 'success'
      ..$props.title = '提示'
      ..$props.subTitle = '请根据提示进行操作'
      ..$slots.extra = SizedBox(
        width: 80,
        child: WButton()
          ..$props.type = 'primary'
          ..$props.size = 'mini'
          ..$slots.$ = '返回',
      )
    ''',
  );

  var resultWarning = Demo(
    'resultWarning',
    WResult()
      ..$props.icon = 'warning'
      ..$props.title = '提示'
      ..$props.subTitle = '请根据提示进行操作'
      ..$slots.extra = SizedBox(
        width: 80,
        child: WButton()
          ..$props.type = 'primary'
          ..$props.size = 'mini'
          ..$slots.$ = '返回',
      ),
    r'''
    WResult()
      ..$props.icon = 'warning'
      ..$props.title = '提示'
      ..$props.subTitle = '请根据提示进行操作'
      ..$slots.extra = SizedBox(
        width: 80,
        child: WButton()
          ..$props.type = 'primary'
          ..$props.size = 'mini'
          ..$slots.$ = '返回',
      )
    ''',
  );

  var resultError = Demo(
    'resultError',
    WResult()
      ..$props.icon = 'error'
      ..$props.title = '提示'
      ..$props.subTitle = '请根据提示进行操作'
      ..$slots.extra = SizedBox(
        width: 80,
        child: WButton()
          ..$props.type = 'primary'
          ..$props.size = 'mini'
          ..$slots.$ = '返回',
      ),
    r'''
    WResult()
      ..$props.icon = 'error'
      ..$props.title = '提示'
      ..$props.subTitle = '请根据提示进行操作'
      ..$slots.extra = SizedBox(
        width: 80,
        child: WButton()
          ..$props.type = 'primary'
          ..$props.size = 'mini'
          ..$slots.$ = '返回',
      )
    ''',
  );

  var resultInfo = Demo(
    'resultInfo',
    WResult()
      ..$props.icon = 'info'
      ..$props.title = '提示'
      ..$props.subTitle = '请根据提示进行操作'
      ..$slots.extra = SizedBox(
        width: 80,
        child: WButton()
          ..$props.type = 'primary'
          ..$props.size = 'mini'
          ..$slots.$ = '返回',
      ),
    r'''
    WResult()
      ..$props.icon = 'info'
      ..$props.title = '提示'
      ..$props.subTitle = '请根据提示进行操作'
      ..$slots.extra = SizedBox(
        width: 80,
        child: WButton()
          ..$props.type = 'primary'
          ..$props.size = 'mini'
          ..$slots.$ = '返回',
      )
    ''',
  );
}
