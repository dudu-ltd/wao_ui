import 'package:flutter/material.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/src/form/w_input_number.dart';

class ApiInputNumber extends StatelessWidget {
  const ApiInputNumber({Key? key}) : super(key: key);

  Widget get basic {
    return WInputNumber(
      props: WInputNumberProp(model: 1),
      on: WInputNumberOn(
        change: (v) {
          print(v);
        },
      ),
    );
  }

  Widget get disabled {
    return WInputNumber(
      props: WInputNumberProp(model: 1, disabled: true),
    );
  }

  Widget get step {
    return WInputNumber(
      props: WInputNumberProp(model: 1, step: 5),
    );
  }

  Widget get stepStrictly {
    return WInputNumber(
      props: WInputNumberProp(model: 1, step: 2, stepStrictly: true),
    );
  }

  Widget get precision {
    return WInputNumber(
      props: WInputNumberProp(model: 1, step: 0.1, precision: 2, max: 10),
    );
  }

  Widget get size {
    return Row(
      children: [
        WInputNumber(
          props: WInputNumberProp(model: 1),
        ),
        WInputNumber(
          props: WInputNumberProp(model: 1, size: 'medium'),
        ),
        WInputNumber(
          props: WInputNumberProp(model: 1, size: 'small'),
        ),
        WInputNumber(
          props: WInputNumberProp(model: 1, size: 'mini'),
        ),
      ],
    );
  }

  Widget get btnPosition {
    return WInputNumber(
      props: WInputNumberProp(model: 1, controlsPosition: 'right'),
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
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          basic,
          paddingWrapper(const Text('禁用状态'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          disabled,
          paddingWrapper(const Text('步数'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          step,
          paddingWrapper(const Text('严格步数'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          stepStrictly,
          paddingWrapper(const Text('精度'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          precision,
          paddingWrapper(const Text('尺寸'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          size,
          paddingWrapper(const Text('按钮位置'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          btnPosition,
        ],
      )
    ]);
  }
}
