import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  var alertBasic1 = Demo(
    'alertBasic1',
    WAlert()..$props.title = '普通的信息提示',
    r'''
    WAlert()..$props.title = '普通的信息提示'
    ''',
  );
  var alertBasic2 = Demo(
    'alertBasic2',
    WAlert()
      ..$props.title = '醒目的信息提示'
      ..$props.type = 'primary',
    r'''
    WAlert()
      ..$props.title = '醒目的信息提示'
      ..$props.type = 'primary',''',
  );

  var alertBasic3 = Demo(
    'alertBasic3',
    WAlert()
      ..$props.title = '该操作可能会出错的提示'
      ..$props.type = 'warning',
    r'''
    WAlert()
      ..$props.title = '该操作可能会出错的提示'
      ..$props.type = 'warning',''',
  );
  var alertBasic4 = Demo(
    'alertBasic4',
    WAlert()
      ..$props.title = '操作成功！'
      ..$props.type = 'success',
    r'''
    WAlert()
      ..$props.title = '操作成功！'
      ..$props.type = 'success', ''',
  );

  var alertBasic5 = Demo(
    'alertBasic5',
    WAlert()
      ..$props.title = '程序出错！'
      ..$props.type = 'danger',
    r'''
    WAlert()
      ..$props.title = '程序出错！'
      ..$props.type = 'danger',
    ''',
  );
  var alertBasic6 = Demo(
    'alertBasic6',
    WAlert()
      ..$props.title = '操作成功！'
      ..$props.type = 'danger',
    r'''
    WAlert()..$props.title = '操作成功！'
    ''',
  );

  var alertBasicDark1 = Demo(
    'alertBasicDark1',
    WAlert()
      ..$props.title = '操作成功！'
      ..$props.effect = 'dark',
    r'''
    WAlert()..$props.title = '操作成功！'
    ''',
  );
  var alertBasicDark2 = Demo(
    'alertBasicDark2',
    WAlert()
      ..$props.title = '操作成功！'
      ..$props.type = 'primary'
      ..$props.effect = 'dark',
    r'''
    WAlert()..$props.title = '操作成功！'
    ''',
  );

  var alertBasicDark3 = Demo(
    'alertBasicDark3',
    WAlert()
      ..$props.title = '操作成功！'
      ..$props.type = 'warning'
      ..$props.effect = 'dark',
    r'''
    WAlert()..$props.title = '操作成功！'
    ''',
  );
  var alertBasicDark4 = Demo(
    'alertBasicDark4',
    WAlert()
      ..$props.title = '操作成功！'
      ..$props.type = 'success'
      ..$props.effect = 'dark',
    r'''
    WAlert()..$props.title = '操作成功！'
    ''',
  );

  var alertBasicDark5 = Demo(
    'alertBasicDark5',
    WAlert()
      ..$props.title = '操作成功！'
      ..$props.type = 'danger'
      ..$props.effect = 'dark',
    r'''
    WAlert()..$props.title = '操作成功！'
    ''',
  );
  var alertBasicDark6 = Demo(
    'alertBasicDark6',
    WAlert()
      ..$props.title = '操作成功！'
      ..$props.type = 'danger'
      ..$props.effect = 'dark',
    r'''
    WAlert()..$props.title = '操作成功！'
    ''',
  );
}
