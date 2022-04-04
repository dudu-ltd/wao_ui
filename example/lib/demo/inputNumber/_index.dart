import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  var inputNumberBasic = Demo(
    'inputNumberBasic',
    WInputNumber()
      ..$props.value = 1
      ..$on.change = (v) => print(v),
    r'''
    WInputNumber()
      ..$props.value = 1
      ..$on.change = (v) => print(v),
    ''',
  );

  var inputNumberDisabled = Demo(
    'inputNumberDisabled',
    WInputNumber()
      ..$props.value = 1
      ..$props.disabled = true,
    r'''
    WInputNumber()
      ..$props.value = 1
      ..$props.disabled = true
    ''',
  );

  var inputNumberStep = Demo(
    'inputNumberStep',
    WInputNumber()
      ..$props.value = 1
      ..$props.step = 5,
    r'''
    WInputNumber()
      ..$props.value = 1
      ..$props.step = 5
    ''',
  );

  var inputNumberStepStrictly = Demo(
    'inputNumberStepStrictly',
    WInputNumber()
      ..$props.value = 1
      ..$props.step = 2
      ..$props.stepStrictly = true,
    r'''
    WInputNumber()
      ..$props.value = 1
      ..$props.step = 2
      ..$props.stepStrictly = true
    ''',
  );

  var inputNumberPrecision = Demo(
    'inputNumberPrecision',
    WInputNumber()
      ..$props.value = 1
      ..$props.step = 0.1
      ..$props.precision = 2
      ..$props.max = 10,
    r'''
    WInputNumber()
      ..$props.value = 1
      ..$props.step = 0.1
      ..$props.precision = 2
      ..$props.max = 10
    ''',
  );

  var inputNumberSize1 = Demo(
    'inputNumberSize1',
    WInputNumber()..$props.value = 1,
    r'''
    WInputNumber()..$props.value = 1
    ''',
  );

  var inputNumberSize2 = Demo(
    'inputNumberSize2',
    WInputNumber()
      ..$props.value = 1
      ..$props.size = 'medium',
    r'''
    WInputNumber()
      ..$props.value = 1
      ..$props.size = 'medium'
    ''',
  );

  var inputNumberSize3 = Demo(
    'inputNumberSize3',
    WInputNumber()
      ..$props.value = 1
      ..$props.size = 'small',
    r'''
    WInputNumber()
      ..$props.value = 1
      ..$props.size = 'small'
    ''',
  );

  var inputNumberSize4 = Demo(
    'inputNumberSize4',
    WInputNumber()
      ..$props.value = 1
      ..$props.size = 'mini',
    r'''
    WInputNumber()
      ..$props.value = 1
      ..$props.size = 'mini'
    ''',
  );

  var inputNumberBtnPosition = Demo(
    'inputNumberBtnPosition',
    WInputNumber()
      ..$props.value = 1
      ..$props.controlsPosition = 'right'
      ..$on.change = (v) => print(v),
    r'''
    WInputNumber()
      ..$props.value = 1
      ..$props.controlsPosition = 'right'
      ..$on.change = (v) => print(v)
    ''',
  );
}
