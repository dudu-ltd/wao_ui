import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

import '../../demos.dart';

regist() {
  var switchBasic = Demo(
    'switchBasic',
    WSwitch(),
    r'''
    WSwitch()''',
  );

  var switchBasic2 = Demo(
    'switchBasic2',
    WSwitch()
      ..$props.model = true
      ..$props.activeColor = const Color(0xFF13ce66)
      ..$props.inactiveColor = const Color(0xffff4949),
    r'''
    WSwitch()
      ..$props.value = true
      ..$props.activeColor = const Color(0xFF13ce66)
      ..$props.inactiveColor = const Color(0xffff4949)''',
  );

  var switchText = Demo(
    'switchText',
    WSwitch()
      ..$props.model = true
      ..$props.activeText = '向右走'
      ..$props.inactiveText = '向左走',
    r'''
    WSwitch()
      ..$props.value = true
      ..$props.activeText = '向右走'
      ..$props.inactiveText = '向左走' ''',
  );

  var switchTextColor = Demo(
    'switchTextColor',
    WSwitch()
      ..$props.model = true
      ..$props.activeText = '向右走'
      ..$props.inactiveText = '向左走'
      ..$props.activeColor = CfgGlobal.successColor
      ..$props.inactiveColor = CfgGlobal.dangerColor,
    r'''
    WSwitch()
      ..$props.value = true
      ..$props.activeText = '向右走'
      ..$props.inactiveText = '向左走'
      ..$props.activeColor = CfgGlobal.successColor
      ..$props.inactiveColor = CfgGlobal.dangerColor ''',
  );

  var switchValueType = Demo(
    'switchValueType',
    WSwitch()
      ..$props.model = 100
      ..$props.activeColor = CfgGlobal.successColor
      ..$props.inactiveColor = CfgGlobal.dangerColor
      ..$props.activeValue = 100
      ..$props.inactiveValue = 0,
    r'''
    WSwitch()
      ..$props.value = 100
      ..$props.activeColor = CfgGlobal.successColor
      ..$props.inactiveColor = CfgGlobal.dangerColor
      ..$props.activeValue = 100
      ..$props.inactiveValue = 0 ''',
  );

  var switchDisabled1 = Demo(
    'switchDisabled1',
    WSwitch()
      ..$props.model = true
      ..$props.disabled = true,
    r'''
    WSwitch()
      ..$props.value = true
      ..$props.disabled = true ''',
  );

  var switchDisabled2 = Demo(
    'switchDisabled2',
    WSwitch()
      ..$props.model = false
      ..$props.disabled = true,
    r'''
    WSwitch()
      ..$props.value = false
      ..$props.disabled = true ''',
  );
}
