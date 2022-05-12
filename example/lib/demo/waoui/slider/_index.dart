import 'package:flutter/material.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/wao_ui.dart';

import '../../demos.dart';

regist() {
  var sliderBasic = Demo(
    'sliderBasic',
    WSlider()..$props.model = 0,
    r'''
    WSlider()..$props.value = 0
    ''',
  );

  var sliderDisabled = Demo(
    'sliderDisabled',
    WSlider()
      ..$props.model = 42
      ..$props.disabled = true,
    r'''
    WSlider()
      ..$props.value = 42
      ..$props.disabled = true
    ''',
  );

  var sliderValue = Demo(
    'sliderValue',
    WSlider()
      ..$props.min = 0
      ..$props.model = 50,
    r'''
    WSlider()
      ..$props.min = 0
      ..$props.value = 50
    ''',
  );

  var sliderNoTooltip = Demo(
    'sliderNoTooltip',
    WSlider()
      ..$props.model = 42
      ..$props.showTooltip = false,
    r'''
    WSlider()
      ..$props.value = 42
      ..$props.showTooltip = false
    ''',
  );

  var sliderFormatTooltip = Demo(
    'sliderFormatTooltip',
    WSlider()
      ..$props.model = 48
      ..$props.formatTooltip = (v) => '${v / 100}',
    r'''
    WSlider()
      ..$props.value = 48
      ..$props.formatTooltip = (v) => '${v / 100}'
    ''',
  );

  var sliderStep = Demo(
    'sliderStep',
    WSlider()
      ..$props.step = 10
      ..$props.model = 0,
    r'''
    WSlider()
      ..$props.step = 10
      ..$props.value = 0
    ''',
  );

  var sliderNoStep = Demo(
    'sliderNoStep',
    WSlider()
      ..$props.step = 10
      ..$props.model = 0
      ..$props.showStops = true,
    r'''
    WSlider()
      ..$props.step = 10
      ..$props.value = 0
      ..$props.showStops = true
    ''',
  );

  var sliderWithInput = Demo(
    'sliderWithInput',
    WSlider()
      ..$props.model = 0
      ..$props.showInput = true,
    r'''
    WSlider()
      ..$props.value = 0
      ..$props.showInput = true
    ''',
  );

  var sliderRange = Demo(
    'sliderRange',
    WSlider()
      ..$props.model = [0.0, 0.0]
      ..$props.range = true
      ..$props.showStops = true
      ..$props.max = 10,
    r'''
    WSlider()
      ..$props.value = [0.0, 0.0]
      ..$props.range = true
      ..$props.showStops = true
      ..$props.max = 10
    ''',
  );

  var sliderVertical = Demo(
    'sliderVertical',
    WSlider()
      ..$props.model = 0
      ..$props.vertical = true
      ..$props.height = 200,
    r'''
    WSlider()
      ..$props.value = 0
      ..$props.vertical = true
      ..$props.height = 200
    ''',
  );

  var sliderMarks = Demo(
    'sliderMarks',
    WSlider()
      ..$props.model = [20.0, 50.0]
      ..$props.range = true
      ..$props.marks = {
        0: '0°C',
        8: '8°C',
        37: '37°C',
        50: SliderMark(
          const TextStyle(
            color: Color(0xFF1989FA),
            fontWeight: FontWeight.w700,
          ),
          (v) => '$v°C',
        ),
      },
    r'''
    WSlider()
      ..$props.value = [20.0, 50.0]
      ..$props.range = true
      ..$props.marks = {
        0: '0°C',
        8: '8°C',
        37: '37°C',
        50: SliderMark(
            TextStyle(
              color: ColorUtil.hexToColor('#1989FA'),
              fontWeight: FontWeight.w700,
            ),
            (v) => '$v°C'),
      },
    ''',
  );
}
