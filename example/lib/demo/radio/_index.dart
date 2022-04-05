import 'package:flutter/cupertino.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  var value = ValueNotifier<dynamic>(null);
  var radioBasic = Demo(
    'radioBasic',
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        WRadio()
          ..$props.value = value
          ..$props.label = '1'
          ..$slots.$ = '选项1',
        WRadio()
          ..$props.value = value
          ..$props.label = '2'
          ..$slots.$ = '选项2'
      ],
    ),
    r'''
    var value = ValueNotifier<dynamic>(null);

    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        WRadio()
          ..$props.value
          ..$props.label = '1'
          ..$slots.$ = '选项1',
        WRadio()
          ..$props.value
          ..$props.label = '2'
          ..$slots.$ = '选项2'
      ],
    )
    ''',
  );

  var valueDisabled = ValueNotifier('选中且禁用');
  var radioDisabled = Demo(
    'radioDisabled',
    Row(
      children: [
        WRadio()
          ..$props.value = valueDisabled
          ..$props.disabled = true
          ..$props.label = '禁用'
          ..$slots.$ = '选项1',
        WRadio()
          ..$props.value = valueDisabled
          ..$props.disabled = true
          ..$props.label = '选中且禁用'
          ..$slots.$ = '选项2',
      ],
    ),
    r'''
    var valueDisabled = ValueNotifier('选中且禁用');

    Row(
      children: [
        WRadio()
          ..$props.value = valueDisabled
          ..$props.disabled = true
          ..$props.label = '禁用'
          ..$slots.$ = '选项1',
        WRadio()
          ..$props.value = valueDisabled
          ..$props.disabled = true
          ..$props.label = '选中且禁用'
          ..$slots.$ = '选项2',
      ],
    )
    ''',
  );

  var valueGroup = ValueNotifier('3');
  var radioGroup = Demo(
    'radioGroup',
    WRadioGroup()
      ..$slots.$ = [
        WRadio()
          ..$props.label = '1'
          ..$slots.$ = '选项1',
        WRadio()
          ..$props.label = '2'
          ..$slots.$ = '选项3',
        WRadio()
          ..$props.label = '3'
          ..$slots.$ = '选项3',
      ],
    r'''
    var valueGroup = ValueNotifier('3');

    WRadioGroup()
      ..$slots.$ = [
        WRadio()
          ..$props.label = '1'
          ..$slots.$ = '选项1',
        WRadio()
          ..$props.label = '2'
          ..$slots.$ = '选项3',
        WRadio()
          ..$props.label = '3'
          ..$slots.$ = '选项3',
      ]
    ''',
  );

  var valueButtonSize1 = ValueNotifier('上海');
  var radioButtonGroupSize1 = Demo(
    'radioButtonGroupSize1',
    WRadioGroup()
      ..$props.value = valueButtonSize1
      ..$slots.$ = [
        WRadioButton()
          ..$props.label = '上海'
          ..$slots.$ = '上海',
        WRadioButton()
          ..$props.label = '北京'
          ..$slots.$ = '北京',
        WRadioButton()
          ..$props.label = '广州'
          ..$slots.$ = '广州',
        WRadioButton()
          ..$props.label = '深圳'
          ..$slots.$ = '深圳',
      ],
    r'''
    var valueButtonSize1 = ValueNotifier('上海');

    WRadioGroup()
      ..$props.value = valueButtonSize1
      ..$slots.$ = [
        WRadioButton()
          ..$props.label = '上海'
          ..$slots.$ = '上海',
        WRadioButton()
          ..$props.label = '北京'
          ..$slots.$ = '北京',
        WRadioButton()
          ..$props.label = '广州'
          ..$slots.$ = '广州',
        WRadioButton()
          ..$props.label = '深圳'
          ..$slots.$ = '深圳',
      ],
    ''',
  );

  var valueButtonSize2 = ValueNotifier('上海');
  var radioButtonGroupSize2 = Demo(
    'radioButtonGroupSize2',
    WRadioGroup()
      ..$props.value = valueButtonSize2
      ..$props.size = 'medium'
      ..$slots.$ = [
        WRadioButton()
          ..$props.label = '上海'
          ..$slots.$ = '上海',
        WRadioButton()
          ..$props.label = '北京'
          ..$slots.$ = '北京',
        WRadioButton()
          ..$props.label = '广州'
          ..$slots.$ = '广州',
        WRadioButton()
          ..$props.label = '深圳'
          ..$slots.$ = '深圳',
      ],
    r'''
    var valueButtonSize2 = ValueNotifier('上海');

    WRadioGroup()
      ..$props.value = valueButtonSize2
      ..$props.size = 'medium'
      ..$slots.$ = [
        WRadioButton()
          ..$props.label = '上海'
          ..$slots.$ = '上海',
        WRadioButton()
          ..$props.label = '北京'
          ..$slots.$ = '北京',
        WRadioButton()
          ..$props.label = '广州'
          ..$slots.$ = '广州',
        WRadioButton()
          ..$props.label = '深圳'
          ..$slots.$ = '深圳',
      ]
    ''',
  );
  var valueButtonSize3 = ValueNotifier('上海');
  var radioButtonGroupSize3 = Demo(
    'radioButtonGroupSize3',
    WRadioGroup()
      ..$props.value = valueButtonSize3
      ..$props.size = 'small'
      ..$slots.$ = [
        WRadioButton()
          ..$props.label = '上海'
          ..$slots.$ = '上海',
        WRadioButton()
          ..$props.label = '北京'
          ..$slots.$ = '北京',
        WRadioButton()
          ..$props.label = '广州'
          ..$slots.$ = '广州',
        WRadioButton()
          ..$props.label = '深圳'
          ..$slots.$ = '深圳',
      ],
    r'''
    var valueButtonSize3 = ValueNotifier('上海');

    WRadioGroup()
      ..$props.value = valueButtonSize3
      ..$props.size = 'small'
      ..$slots.$ = [
        WRadioButton()
          ..$props.label = '上海'
          ..$slots.$ = '上海',
        WRadioButton()
          ..$props.label = '北京'
          ..$slots.$ = '北京',
        WRadioButton()
          ..$props.label = '广州'
          ..$slots.$ = '广州',
        WRadioButton()
          ..$props.label = '深圳'
          ..$slots.$ = '深圳'
    ''',
  );

  var valueButtonSize4 = ValueNotifier('上海');
  var radioButtonGroupSize4 = Demo(
    'radioButtonGroupSize4',
    WRadioGroup()
      ..$props.value = valueButtonSize4
      ..$props.size = 'mini'
      ..$slots.$ = [
        WRadioButton()
          ..$props.label = '上海'
          ..$slots.$ = '上海',
        WRadioButton()
          ..$props.label = '北京'
          ..$slots.$ = '北京',
        WRadioButton()
          ..$props.label = '广州'
          ..$slots.$ = '广州',
        WRadioButton()
          ..$props.label = '深圳'
          ..$slots.$ = '深圳',
      ],
    r'''
    var valueButtonSize4 = ValueNotifier('上海');

    WRadioGroup()
      ..$props.value = valueButtonSize4
      ..$props.size = 'mini'
      ..$slots.$ = [
        WRadioButton()
          ..$props.label = '上海'
          ..$slots.$ = '上海',
        WRadioButton()
          ..$props.label = '北京'
          ..$slots.$ = '北京',
        WRadioButton()
          ..$props.label = '广州'
          ..$slots.$ = '广州',
        WRadioButton()
          ..$props.label = '深圳'
          ..$slots.$ = '深圳',
      ]
    ''',
  );

  var value1 = ValueNotifier<dynamic>('3');
  var radioBorderGroupSize1 = Demo(
    'radioBorderGroupSize1',
    Row(
      children: [
        WRadio()
          ..$props.value = value1
          ..$props.label = '1'
          ..$props.border = true
          ..$slots.$ = 'A',
        WRadio()
          ..$props.value = value1
          ..$props.label = '2'
          ..$props.border = true
          ..$slots.$ = 'B',
        WRadio()
          ..$props.value = value1
          ..$props.label = '3'
          ..$props.border = true
          ..$slots.$ = '钝角'
      ],
    ),
    r'''
    Row(
      children: [
        WRadio()
          ..$props.value = value1
          ..$props.label = '1'
          ..$props.border = true
          ..$slots.$ = 'A',
        WRadio()
          ..$props.value = value1
          ..$props.label = '2'
          ..$props.border = true
          ..$slots.$ = 'B',
        WRadio()
          ..$props.value = value1
          ..$props.label = '3'
          ..$props.border = true
          ..$slots.$ = '钝角'
      ],
    )
    ''',
  );

  var value2 = ValueNotifier<dynamic>('3');
  var radioBorderGroupSize2 = Demo(
    'radioBorderGroupSize2',
    Row(
      children: [
        WRadio()
          ..$props.value = value2
          ..$props.label = '1'
          ..$props.border = true
          ..$props.size = 'medium'
          ..$slots.$ = 'A',
        WRadio()
          ..$props.value = value2
          ..$props.label = '2'
          ..$props.border = true
          ..$props.size = 'medium'
          ..$slots.$ = 'B',
        WRadio()
          ..$props.value = value2
          ..$props.label = '3'
          ..$props.border = true
          ..$props.size = 'medium'
          ..$slots.$ = '钝角'
      ],
    ),
    r'''
    Row(
      children: [
        WRadio()
          ..$props.value = value2
          ..$props.label = '1'
          ..$props.border = true
          ..$props.size = 'medium'
          ..$slots.$ = 'A',
        WRadio()
          ..$props.value = value2
          ..$props.label = '2'
          ..$props.border = true
          ..$props.size = 'medium'
          ..$slots.$ = 'B',
        WRadio()
          ..$props.value = value2
          ..$props.label = '3'
          ..$props.border = true
          ..$props.size = 'medium'
          ..$slots.$ = '钝角'
      ],
    )
    ''',
  );

  var value3 = ValueNotifier<dynamic>('3');
  var radioBorderGroupSize3 = Demo(
    'radioBorderGroupSize3',
    Row(
      children: [
        WRadio()
          ..$props.value = value3
          ..$props.label = '1'
          ..$props.border = true
          ..$props.size = 'small'
          ..$slots.$ = 'A',
        WRadio()
          ..$props.value = value3
          ..$props.label = '2'
          ..$props.border = true
          ..$props.size = 'small'
          ..$slots.$ = 'B',
        WRadio()
          ..$props.value = value3
          ..$props.label = '3'
          ..$props.border = true
          ..$props.size = 'small'
          ..$slots.$ = '钝角'
      ],
    ),
    r'''
    var value3 = ValueNotifier<dynamic>('3');

    Row(
      children: [
        WRadio()
          ..$props.value = value3
          ..$props.label = '1'
          ..$props.border = true
          ..$props.size = 'small'
          ..$slots.$ = 'A',
        WRadio()
          ..$props.value = value3
          ..$props.label = '2'
          ..$props.border = true
          ..$props.size = 'small'
          ..$slots.$ = 'B',
        WRadio()
          ..$props.value = value3
          ..$props.label = '3'
          ..$props.border = true
          ..$props.size = 'small'
          ..$slots.$ = '钝角'
      ],
    )
    ''',
  );

  var value4 = ValueNotifier<dynamic>('3');
  var radioBorderGroupSize4 = Demo(
    'radioBorderGroupSize4',
    Row(
      children: [
        WRadio()
          ..$props.value = value4
          ..$props.label = '1'
          ..$props.border = true
          ..$props.size = 'mini'
          ..$slots.$ = 'A',
        WRadio()
          ..$props.value = value4
          ..$props.label = '2'
          ..$props.border = true
          ..$props.size = 'small'
          ..$slots.$ = 'B',
        WRadio()
          ..$props.value = value4
          ..$props.label = '3'
          ..$props.border = true
          ..$props.size = 'small'
          ..$slots.$ = '钝角'
      ],
    ),
    r'''
    var value4 = ValueNotifier<dynamic>('3');

    Row(
      children: [
        WRadio()
          ..$props.value = value4
          ..$props.label = '1'
          ..$props.border = true
          ..$props.size = 'mini'
          ..$slots.$ = 'A',
        WRadio()
          ..$props.value = value4
          ..$props.label = '2'
          ..$props.border = true
          ..$props.size = 'small'
          ..$slots.$ = 'B',
        WRadio()
          ..$props.value = value4
          ..$props.label = '3'
          ..$props.border = true
          ..$props.size = 'small'
          ..$slots.$ = '钝角'
      ],
    )
    ''',
  );
}
