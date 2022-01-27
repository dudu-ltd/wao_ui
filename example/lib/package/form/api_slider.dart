import 'package:flutter/material.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/src/form/w_slider.dart';

class ApiSlider extends StatelessWidget {
  const ApiSlider({Key? key}) : super(key: key);

  Widget get basic {
    return Wrap(
      spacing: 10,
      children: [
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('默认'),
            ),
            Expanded(
              flex: 5,
              child: WSlider(
                props: WSliderProp(
                  value: 0,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('自定义初始值'),
            ),
            Expanded(
              flex: 5,
              child: WSlider(
                props: WSliderProp(
                  min: 0,
                  value: 50,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('隐藏 Tooltip'),
            ),
            Expanded(
              flex: 5,
              child: WSlider(
                props: WSliderProp(
                  value: 36,
                  showTooltip: false,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('格式化 Tooltip'),
            ),
            Expanded(
              flex: 5,
              child: WSlider(
                props: WSliderProp(
                  value: 48,
                  formatTooltip: (v) => '${v / 100}',
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('禁用'),
            ),
            Expanded(
              flex: 5,
              child: WSlider(
                props: WSliderProp(
                  value: 42,
                  disabled: true,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget get step {
    return Wrap(
      spacing: 10,
      children: [
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('不显示间断点'),
            ),
            Expanded(
              flex: 5,
              child: WSlider(
                props: WSliderProp(
                  value: 0,
                  step: 10,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('显示间断点'),
            ),
            Expanded(
              flex: 5,
              child: WSlider(
                props: WSliderProp(
                  value: 0,
                  step: 10,
                  showStops: true,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget get withInput {
    return WSlider(
      props: WSliderProp(
        value: 0,
        showInput: true,
      ),
    );
  }

  Widget get range {
    return WSlider(
      props: WSliderProp(
        value: [0.0, 0.0],
        range: true,
        showStops: true,
        max: 10,
      ),
    );
  }

  Widget get vertical {
    return WSlider(
      props: WSliderProp(
        value: 0,
        vertical: true,
        height: 200,
      ),
    );
  }

  Widget get marks {
    return WSlider(
      props: WSliderProp(
        value: [20.0, 50.0],
        range: true,
        marks: {
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text('WSlider'),
        const Text('基本用法'),
        basic,
        const Text('离散值'),
        step,
        const Text('带有输入框'),
        withInput,
        const Text('范围选择'),
        range,
        const Text('竖向模式'),
        vertical,
        const Text('展示标记'),
        marks,
      ],
    );
  }
}
