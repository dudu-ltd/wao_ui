import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_checkbox.dart';

class ApiCheckbox extends StatelessWidget {
  ApiCheckbox({Key? key}) : super(key: key);

  WCheckbox get basic {
    return WCheckbox(
      props: WCheckboxProp(value: ValueNotifier(true)),
      slots: WCheckboxSlot('备选项'),
    );
  }

  Row get disabled {
    return Row(
      children: [
        WCheckbox(
          props: WCheckboxProp(value: ValueNotifier(false), disabled: true),
          slots: WCheckboxSlot('备选项'),
        ),
        WCheckbox(
          props: WCheckboxProp(value: ValueNotifier(true), disabled: true),
          slots: WCheckboxSlot('备选项'),
        )
      ],
    );
  }

  WCheckboxGroup get multiCheckGroup {
    return WCheckboxGroup(
      props: WCheckboxGroupProp(
        value: ValueNotifier(['选中且禁用', '复选框 A']),
      ),
      slots: WCheckboxGroupSlot([
        WCheckbox(
          props: WCheckboxProp(label: '复选框 A'),
        ),
        WCheckbox(
          props: WCheckboxProp(label: '复选框 B'),
        ),
        WCheckbox(
          props: WCheckboxProp(label: '复选框 C'),
        ),
        WCheckbox(
          props: WCheckboxProp(label: '禁用', disabled: true),
        ),
        WCheckbox(
          props: WCheckboxProp(label: '选中且禁用', disabled: true),
        )
      ]),
    );
  }

  List<String> cityOptions = ['上海', '北京', '广州', '深圳'];
  Widget get indeterminate {
    var checkAll = ValueNotifier(false);
    var checkedCities = ValueNotifier(['上海', '北京']);
    var selectAllProp = WCheckboxProp(
      value: checkAll,
      indeterminate: true,
    );
    return Column(
      children: [
        WCheckbox(
          props: selectAllProp,
          slots: WCheckboxSlot('全选'),
          on: WCheckboxOn(
            change: (val) {
              checkedCities.value = val ? cityOptions.sublist(0) : [];
              selectAllProp.indeterminate = false;
            },
          ),
        ),
        WCheckboxGroup(
          props: WCheckboxGroupProp(
            value: checkedCities,
          ),
          slots: WCheckboxGroupSlot(
            List.generate(cityOptions.length, (index) {
              var city = cityOptions[index];
              return WCheckbox(
                props: WCheckboxProp(label: city),
                slots: WCheckboxSlot(city),
              );
            }),
          ),
          on: WCheckboxGroupOn(
            change: (val) {
              var checkedCount = val.length;
              checkAll.value = checkedCount == cityOptions.length;
              selectAllProp.indeterminate =
                  checkedCount > 0 && checkedCount < cityOptions.length;
            },
          ),
        ),
      ],
    );
  }

  Widget get sizeLimit {
    var checkedCities = ValueNotifier(['上海', '北京']);
    return WCheckboxGroup(
      props: WCheckboxGroupProp(
        value: checkedCities,
        min: 1,
        max: 2,
      ),
      slots: WCheckboxGroupSlot(
        List.generate(cityOptions.length, (index) {
          var city = cityOptions[index];
          return WCheckbox(
            props: WCheckboxProp(label: city),
            slots: WCheckboxSlot(city),
          );
        }),
      ),
    );
  }

  Widget get button {
    var checkedCities1 = ValueNotifier(['上海']);
    var checkedCities2 = ValueNotifier(['上海']);
    var checkedCities3 = ValueNotifier(['上海']);
    var checkedCities4 = ValueNotifier(['上海']);
    return Column(
      children: [
        WCheckboxGroup(
          props: WCheckboxGroupProp(
            value: checkedCities1,
            min: 1,
            max: 3,
          ),
          slots: WCheckboxGroupSlot(
            List.generate(cityOptions.length, (index) {
              var city = cityOptions[index];
              return WCheckboxButton(
                props: WCheckboxButtonProp(label: city),
                slots: WCheckboxButtonSlot(city),
              );
            }),
          ),
        ),
        WCheckboxGroup(
          props: WCheckboxGroupProp(
            value: checkedCities2,
            size: "medium",
          ),
          slots: WCheckboxGroupSlot(
            List.generate(cityOptions.length, (index) {
              var city = cityOptions[index];
              return WCheckboxButton(
                props: WCheckboxButtonProp(label: city),
                slots: WCheckboxButtonSlot(city),
              );
            }),
          ),
        ),
        WCheckboxGroup(
          props: WCheckboxGroupProp(
            value: checkedCities3,
            size: 'small',
          ),
          slots: WCheckboxGroupSlot(
            List.generate(cityOptions.length, (index) {
              var city = cityOptions[index];
              return WCheckboxButton(
                props: WCheckboxButtonProp(label: city, disabled: city == '北京'),
                slots: WCheckboxButtonSlot(city),
              );
            }),
          ),
        ),
        WCheckboxGroup(
          props: WCheckboxGroupProp(
            value: checkedCities4,
            disabled: true,
            size: 'mini',
          ),
          slots: WCheckboxGroupSlot(
            List.generate(cityOptions.length, (index) {
              var city = cityOptions[index];
              return WCheckboxButton(
                props: WCheckboxButtonProp(label: city),
                slots: WCheckboxButtonSlot(city),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget get border {
    var checkedCities1 = ValueNotifier(['上海']);
    var checkedCities2 = ValueNotifier(['上海']);
    var checkedCities3 = ValueNotifier(['上海']);
    var checkedCities4 = ValueNotifier(['上海']);
    return Column(
      children: [
        WCheckboxGroup(
          props: WCheckboxGroupProp(
            value: checkedCities1,
          ),
          slots: WCheckboxGroupSlot(
            List.generate(cityOptions.length, (index) {
              var city = cityOptions[index];
              return WCheckbox(
                props: WCheckboxProp(label: city, border: true),
                slots: WCheckboxSlot(city),
              );
            }),
          ),
        ),
        WCheckboxGroup(
          props: WCheckboxGroupProp(
            value: checkedCities2,
            size: "medium",
          ),
          slots: WCheckboxGroupSlot(
            List.generate(cityOptions.length, (index) {
              var city = cityOptions[index];
              return WCheckbox(
                props: WCheckboxProp(label: city, border: true),
                slots: WCheckboxSlot(city),
              );
            }),
          ),
        ),
        WCheckboxGroup(
          props: WCheckboxGroupProp(
            value: checkedCities3,
            size: 'small',
          ),
          slots: WCheckboxGroupSlot(
            List.generate(cityOptions.length, (index) {
              var city = cityOptions[index];
              return WCheckbox(
                props: WCheckboxProp(
                  label: city,
                  disabled: city == '北京',
                  border: true,
                ),
                slots: WCheckboxSlot(city),
              );
            }),
          ),
        ),
        WCheckboxGroup(
          props: WCheckboxGroupProp(
            value: checkedCities4,
            disabled: true,
            size: 'mini',
          ),
          slots: WCheckboxGroupSlot(
            List.generate(cityOptions.length, (index) {
              var city = cityOptions[index];
              return WCheckbox(
                props: WCheckboxProp(label: city, border: true),
                slots: WCheckboxSlot(city),
              );
            }),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WCheckbox'),
      const Text('原生Checkbox'),
      Row(
        children: [
          Checkbox(value: true, onChanged: (e) {}),
          Text('北京'),
          Checkbox(value: true, onChanged: (e) {}),
          Text('北京')
        ],
      ),
      const Text('基本用法'),
      basic,
      const Text('禁用'),
      disabled,
      const Text('多选'),
      multiCheckGroup,
      const Text('半选'),
      indeterminate,
      const Text('min max 数量限制'),
      sizeLimit,
      const Text('按钮样式'),
      button,
      const Text('边框'),
      border,
    ]);
  }
}
