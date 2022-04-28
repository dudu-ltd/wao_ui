import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_radio.dart';

class ApiRadio extends StatelessWidget {
  late ValueNotifier textEditingController = ValueNotifier(1);

  ApiRadio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WRadio'),
      Row(
        children: [
          Radio(
            value: 1,
            groupValue: textEditingController.value,
            onChanged: (e) {
              textEditingController.value = 1;
            },
          ),
          Text('备选项1'),
          Radio(
              value: 2,
              groupValue: textEditingController.value,
              onChanged: (e) {
                textEditingController.value = 2;
              }),
          Text('备选项1'),
        ],
      ),
      Row(children: basicGroup),
      Row(children: disabledGroup),
      group,
      buttonGroup,
      borderGroup,
    ]);
  }

  List<WRadio> get basicGroup {
    var value = ValueNotifier<dynamic>(null);
    return [
      WRadio(
        props: WRadioProp(
          $model: value,
          label: '1',
        ),
        slots: WRadioSlot('备选项1'),
      ),
      WRadio(
        props: WRadioProp(
          $model: value,
          label: '2',
        ),
        slots: WRadioSlot('备选项1'),
      ),
    ];
  }

  List<WRadio> get disabledGroup {
    var value = ValueNotifier('选中且禁用');
    return [
      WRadio(
        props: WRadioProp(
          $model: value,
          disabled: true,
          label: '禁用',
        ),
        slots: WRadioSlot('备选项1'),
      ),
      WRadio(
        props: WRadioProp(
          $model: value,
          disabled: true,
          label: '选中且禁用',
        ),
        slots: WRadioSlot('备选项1'),
      ),
    ];
  }

  WRadioGroup get group {
    var value = ValueNotifier('3');
    return WRadioGroup(
      slots: WRadioGroupSlot([
        WRadio(
          props: WRadioProp(label: '3'),
          slots: WRadioSlot('备选项3'),
        ),
        WRadio(
          props: WRadioProp(label: '6'),
          slots: WRadioSlot('备选项6'),
        ),
        WRadio(
          props: WRadioProp(label: '9'),
          slots: WRadioSlot('备选项9'),
        ),
      ]),
    );
  }

  Widget get buttonGroup {
    var value1 = ValueNotifier('上海');
    var value2 = ValueNotifier('上海');
    var value3 = ValueNotifier('上海');
    var value4 = ValueNotifier('上海');
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: WRadioGroup(
            props: WRadioGroupProp($model: value1),
            slots: WRadioGroupSlot([
              WRadioButton(
                  props: WRadioButtonProp(label: '上海'),
                  slots: WRadioButtonSlot('上海')),
              WRadioButton(
                  props: WRadioButtonProp(label: '北京'),
                  slots: WRadioButtonSlot('北京')),
              WRadioButton(
                  props: WRadioButtonProp(label: '广州'),
                  slots: WRadioButtonSlot('广州')),
              WRadioButton(
                  props: WRadioButtonProp(label: '深圳'),
                  slots: WRadioButtonSlot('深圳')),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: WRadioGroup(
            props: WRadioGroupProp($model: value2, size: 'medium'),
            slots: WRadioGroupSlot([
              WRadioButton(
                  props: WRadioButtonProp(label: '上海'),
                  slots: WRadioButtonSlot('上海')),
              WRadioButton(
                  props: WRadioButtonProp(label: '北京'),
                  slots: WRadioButtonSlot('北京')),
              WRadioButton(
                  props: WRadioButtonProp(label: '广州'),
                  slots: WRadioButtonSlot('广州')),
              WRadioButton(
                  props: WRadioButtonProp(label: '深圳'),
                  slots: WRadioButtonSlot('深圳')),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: WRadioGroup(
            props: WRadioGroupProp($model: value3, size: 'small'),
            slots: WRadioGroupSlot([
              WRadioButton(
                  props: WRadioButtonProp(label: '上海'),
                  slots: WRadioButtonSlot('上海')),
              WRadioButton(
                  props: WRadioButtonProp(label: '北京', disabled: true),
                  slots: WRadioButtonSlot('北京')),
              WRadioButton(
                  props: WRadioButtonProp(label: '广州'),
                  slots: WRadioButtonSlot('广州')),
              WRadioButton(
                  props: WRadioButtonProp(label: '深圳'),
                  slots: WRadioButtonSlot('深圳')),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: WRadioGroup(
            props:
                WRadioGroupProp($model: value4, size: 'mini', disabled: true),
            slots: WRadioGroupSlot([
              WRadioButton(
                  props: WRadioButtonProp(label: '上海'),
                  slots: WRadioButtonSlot('上海')),
              WRadioButton(
                  props: WRadioButtonProp(label: '北京'),
                  slots: WRadioButtonSlot('北京')),
              WRadioButton(
                  props: WRadioButtonProp(label: '广州'),
                  slots: WRadioButtonSlot('广州')),
              WRadioButton(
                  props: WRadioButtonProp(label: '深圳'),
                  slots: WRadioButtonSlot('深圳')),
            ]),
          ),
        ),
      ],
    );
  }

  Widget get borderGroup {
    var value1 = ValueNotifier<dynamic>('1');
    var value2 = ValueNotifier<dynamic>('1');
    var value3 = ValueNotifier<dynamic>('1');
    var value4 = ValueNotifier<dynamic>('1');
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          WRadio(
            props: WRadioProp($model: value1, label: '1', border: true),
            slots: WRadioSlot('备选项1'),
          ),
          WRadio(
            props: WRadioProp($model: value1, label: '2', border: true),
            slots: WRadioSlot('备选项2'),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          WRadio(
            props: WRadioProp(
                $model: value2, label: '1', size: 'medium', border: true),
            slots: WRadioSlot('备选项1'),
          ),
          WRadio(
            props: WRadioProp(
                $model: value2, label: '2', size: 'medium', border: true),
            slots: WRadioSlot('备选项2'),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: WRadioGroup(
          props: WRadioGroupProp($model: value3, size: 'medium'),
          slots: WRadioGroupSlot([
            WRadio(
              props: WRadioProp(label: '1', border: true),
              slots: WRadioSlot('备选项1'),
            ),
            WRadio(
              props: WRadioProp(label: '2', border: true),
              slots: WRadioSlot('备选项2'),
            ),
          ]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: WRadioGroup(
          props: WRadioGroupProp($model: value4, size: 'mini', disabled: true),
          slots: WRadioGroupSlot([
            WRadio(
              props: WRadioProp(label: '1', border: true),
              slots: WRadioSlot('备选项1'),
            ),
            WRadio(
              props: WRadioProp(label: '2', border: true),
              slots: WRadioSlot('备选项2'),
            ),
          ]),
        ),
      )
    ]);
  }
}
