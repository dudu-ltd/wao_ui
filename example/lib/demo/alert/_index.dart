import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  var alertBasic1 = Demo(
    'alertBasic1',
    WAlert()..$props.title = '普通的信息提示',
    r'''
    WAlert()
      ..$props.title = '普通的信息提示'
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
      ..$props.title = '操作成功！'
      ..$props.type = 'success',
    r'''
    WAlert()
      ..$props.title = '操作成功！'
      ..$props.type = 'success', ''',
  );

  var alertBasic4 = Demo(
    'alertBasic4',
    WAlert()
      ..$props.title = '温馨提示：地球是咱家，一起保护她！'
      ..$props.type = 'warning',
    r'''
    WAlert()
      ..$props.title = '温馨提示：地球是咱家，一起保护她！'
      ..$props.type = 'warning',''',
  );

  var alertBasic5 = Demo(
    'alertBasic5',
    WAlert()
      ..$props.title = '请下载国家反诈App，谨防上当！'
      ..$props.type = 'danger',
    r'''
    WAlert()
      ..$props.title = '请下载国家反诈App，谨防上当！'
      ..$props.type = 'danger', ''',
  );

  var alertBasicDark1 = Demo(
    'alertBasicDark1',
    WAlert()
      ..$props.title = '操作成功！'
      ..$props.effect = 'dark',
    r'''
    WAlert()
      ..$props.title = '操作成功！'
      ..$props.effect = 'dark',
    ''',
  );

  var alertBasicDark2 = Demo(
    'alertBasicDark2',
    WAlert()
      ..$props.title = '操作成功！'
      ..$props.type = 'primary'
      ..$props.effect = 'dark',
    r'''
    WAlert()
      ..$props.title = '操作成功！'
      ..$props.type = 'primary'
      ..$props.effect = 'dark',  ''',
  );

  var alertBasicDark3 = Demo(
    'alertBasicDark3',
    WAlert()
      ..$props.title = '操作成功！'
      ..$props.type = 'success'
      ..$props.effect = 'dark',
    r'''
    WAlert()
      ..$props.title = '操作成功！'
      ..$props.type = 'success'
      ..$props.effect = 'dark', ''',
  );

  var alertBasicDark4 = Demo(
    'alertBasicDark4',
    WAlert()
      ..$props.title = '温馨提示：地球是咱家，一起保护她！'
      ..$props.type = 'warning'
      ..$props.effect = 'dark',
    r'''
    WAlert()
      ..$props.title = '温馨提示：地球是咱家，一起保护她！'
      ..$props.type = 'warning'
      ..$props.effect = 'dark', ''',
  );

  var alertBasicDark5 = Demo(
    'alertBasicDark5',
    WAlert()
      ..$props.title = '请下载国家反诈App，谨防上当！'
      ..$props.type = 'danger'
      ..$props.effect = 'dark',
    r'''
    WAlert()
      ..$props.title = '请下载国家反诈App，谨防上当！'
      ..$props.type = 'danger'
      ..$props.effect = 'dark', ''',
  );

  var alertDescription = Demo(
    'alertDescription',
    WAlert()
      ..$props.title = '主标题'
      ..$props.description = '辅助文本',
    r'''
    WAlert()
      ..$props.title = '主标题'
      ..$props.description = '辅助文本',
    ''',
  );

  var alertClosable1 = Demo(
    'alertClosable1',
    WAlert()
      ..$props.title = '可关闭的普通信息提示'
      ..$props.closable = true,
    r'''
    WAlert()
      ..$props.title = '可关闭的普通信息提示'
      ..$props.closable = true,
    ''',
  );

  var alertClosable2 = Demo(
    'alertClosable2',
    WAlert()
      ..$props.title = '不可关闭的普通信息提示'
      ..$props.closable = false,
    r'''
    WAlert()
      ..$props.title = '不可关闭的普通信息提示'
      ..$props.closable = false,
    ''',
  );

  var alertCenter1 = Demo(
    'alertCenter1',
    WAlert()
      ..$props.title = '默认的居左信息提示'
      ..$props.center = false,
    r'''
    WAlert()
      ..$props.title = '默认的居左信息提示'
      ..$props.center = false, ''',
  );

  var alertCenter2 = Demo(
    'alertCenter2',
    WAlert()
      ..$props.title = '居中的信息提示'
      ..$props.center = true,
    r'''
    WAlert()
      ..$props.title = '居中的信息提示'
      ..$props.center = true, ''',
  );

  var alertCloseText1 = Demo(
    'alertCloseText1',
    WAlert()..$props.title = '默认的信息提示',
    r'''

    WAlert()
      ..$props.title = '默认的信息提示',
    ''',
  );

  var alertCloseText2 = Demo(
    'alertCloseText2',
    WAlert()
      ..$props.title = '修改关闭的信息提示'
      ..$props.closeText = '收到',
    r'''
    WAlert()
      ..$props.title = '修改关闭的信息提示'
      ..$props.closeText = '收到',
    ''',
  );

  var alertShowIcon1 = Demo(
    'alertShowIcon1',
    WAlert()..$props.title = '默认的信息提示',
    r'''

    WAlert()..$props.title = '默认的信息提示',
    ''',
  );

  var alertShowIcon2 = Demo(
    'alertShowIcon2',
    WAlert()
      ..$props.title = '默认的信息提示'
      ..$props.showIcon = true,
    r'''
    WAlert()
      ..$props.title = '显示 icon 的信息提示'
      ..$props.showIcon = true ''',
  );
}
