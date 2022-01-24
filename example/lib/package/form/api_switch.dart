import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_switch.dart';

class ApiSwitch extends StatelessWidget {
  const ApiSwitch({Key? key}) : super(key: key);

  final Widget ____________________________________ = const SizedBox(
    height: 10,
    width: 1,
  );

  Widget get basic {
    return WSwitch(
      props: WSwitchProp(
        value: true,
        activeColor: '#13ce66',
        inactiveColor: '#ff4949',
      ),
    );
  }

  Widget get textDescribe {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        WSwitch(
          // flutterStyle: true,
          props: WSwitchProp(
            value: true,
            activeText: '按月付费',
            inactiveText: '按年付费',
          ),
        ),
        WSwitch(
          props: WSwitchProp(
            value: true,
            activeColor: '#13ce66',
            inactiveColor: '#ff4949',
            activeText: '按月付费',
            inactiveText: '按年付费',
          ),
          on: WSwitchOn(change: (v) => print(v)),
        ),
      ],
    );
  }

  Widget get valutRuntimeType {
    return WSwitch(
      props: WSwitchProp(
        value: 100,
        activeColor: '#13ce66',
        inactiveColor: '#ff4949',
        activeValue: 100,
        inactiveValue: 0,
      ),
      on: WSwitchOn(change: (v) => print(v)),
    );
  }

  Widget get disabled {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        WSwitch(
          props: WSwitchProp(
            value: true,
            disabled: true,
          ),
        ),
        WSwitch(
          props: WSwitchProp(
            value: false,
            disabled: true,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var check = false;
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('原生'),
        ____________________________________,
        StatefulBuilder(builder: (context, setState) {
          return Switch(
            value: check,
            onChanged: (e) {
              check = !check;
              setState((() => {}));
            },
          );
        }),
        ____________________________________,
        const Text('WSwitch'),
        ____________________________________,
        const Text('基本用法'),
        ____________________________________,
        basic,
        ____________________________________,
        const Text('文字描述'),
        textDescribe,
        ____________________________________,
        const Text('扩展的 value 类型'),
        valutRuntimeType,
        ____________________________________,
        const Text('禁用状态'),
        disabled,
      ]),
    );
  }
}
