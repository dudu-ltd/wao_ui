import 'package:flutter/material.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/src/form/w_input_number.dart';

class ApiInputNumber extends StatelessWidget {
  const ApiInputNumber({Key? key}) : super(key: key);

  Widget get basic {
    return WInputNumber(
      props: WInputNumberProp(value: 1),
      on: WInputNumberOn(
        change: (v) {
          print(v);
        },
      ),
    );
  }

  Widget get disabled {
    return WInputNumber(
      props: WInputNumberProp(value: 1, disabled: true),
    );
  }

  Widget get step {
    return WInputNumber(
      props: WInputNumberProp(value: 1, step: 5),
    );
  }

  Widget get stepStrictly {
    return WInputNumber(
      props: WInputNumberProp(value: 1, step: 2, stepStrictly: true),
    );
  }

  Widget get precision {
    return WInputNumber(
      props: WInputNumberProp(value: 1, step: 0.1, precision: 2, max: 10),
    );
  }

  Widget get size {
    return Row(
      children: [
        WInputNumber(
          props: WInputNumberProp(value: 1),
        ),
        WInputNumber(
          props: WInputNumberProp(value: 1, size: 'medium'),
        ),
        WInputNumber(
          props: WInputNumberProp(value: 1, size: 'small'),
        ),
        WInputNumber(
          props: WInputNumberProp(value: 1, size: 'mini'),
        ),
      ],
    );
  }

  Widget get btnPosition {
    return WInputNumber(
      props: WInputNumberProp(value: 1, controlsPosition: 'right'),
      on: WInputNumberOn(
        change: (v) {
          print(v);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('WInputNumber'),
          paddingWrapper(const Text('基本用法'),
              const EdgeInsets.fromLTRB(0, 10, 0, 10), true),
          basic,
          paddingWrapper(const Text('禁用状态'),
              const EdgeInsets.fromLTRB(0, 10, 0, 10), true),
          disabled,
          paddingWrapper(
              const Text('步数'), const EdgeInsets.fromLTRB(0, 10, 0, 10), true),
          step,
          paddingWrapper(const Text('严格步数'),
              const EdgeInsets.fromLTRB(0, 10, 0, 10), true),
          stepStrictly,
          paddingWrapper(
              const Text('精度'), const EdgeInsets.fromLTRB(0, 10, 0, 10), true),
          precision,
          paddingWrapper(
              const Text('尺寸'), const EdgeInsets.fromLTRB(0, 10, 0, 10), true),
          size,
          paddingWrapper(const Text('按钮位置'),
              const EdgeInsets.fromLTRB(0, 10, 0, 10), true),
          btnPosition,
        ],
      )
    ]);
  }
}
