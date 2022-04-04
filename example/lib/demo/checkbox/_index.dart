import 'package:flutter/cupertino.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  var checkboxBasic = Demo(
    'checkboxBasic',
    WCheckbox()
      ..$props.value = ValueNotifier(true)
      ..$slots.$ = '备选项',
    r'''
    WCheckbox()
      ..$props.value = ValueNotifier(true)
      ..$slots.$ = '备选项',
    ''',
  );

  var checkboxDisabled = Demo(
    'checkboxDisabled',
    Row(
      children: [
        WCheckbox()
          ..$props.value = ValueNotifier(false)
          ..$props.disabled = true
          ..$slots.$ = '备选项',
        WCheckbox()
          ..$props.value = ValueNotifier(true)
          ..$props.disabled = true
          ..$slots.$ = '备选项',
      ],
    ),
    r'''
    Row(
      children: [
        WCheckbox()
          ..$props.value = ValueNotifier(false)
          ..$props.disabled = true
          ..$slots.$ = '备选项',
        WCheckbox()
          ..$props.value = ValueNotifier(true)
          ..$props.disabled = true
          ..$slots.$ = '备选项',
      ],
    )
    ''',
  );

  var checkboxMultiGroup = Demo(
    'checkboxMultiGroup',
    WCheckboxGroup()
      ..$props.value = ValueNotifier(['选中且禁用', '复选框 A'])
      ..$slots.$ = [
        WCheckbox()..$props.label = '复选框A',
        WCheckbox()..$props.label = '复选框B',
        WCheckbox()..$props.label = '复选框C',
        WCheckbox()
          ..$props.label = '禁用'
          ..$props.disabled = true,
        WCheckbox()
          ..$props.label = '选中且禁用'
          ..$props.disabled = true,
      ],
    r'''
    WCheckboxGroup()
      ..$props.value = ValueNotifier(['选中且禁用', '复选框 A'])
      ..$slots.$ = [
        WCheckbox()..$props.label = '复选框A',
        WCheckbox()..$props.label = '复选框B',
        WCheckbox()..$props.label = '复选框C',
        WCheckbox()
          ..$props.label = '禁用'
          ..$props.disabled = true,
        WCheckbox()
          ..$props.label = '选中且禁用'
          ..$props.disabled = true,
      ],
    ''',
  );

  List<String> cityOptions = ['上海', '北京', '广州', '深圳'];
  var checkAll = ValueNotifier(false);
  var checkedCities = ValueNotifier(['上海', '北京']);
  var selectAllProp = WCheckboxProp(
    value: checkAll,
    indeterminate: true,
  );
  var checkboxIndeterminate = Demo(
    'checkboxIndeterminate',
    Column(children: [
      WCheckbox(props: selectAllProp)
        ..$slots.$ = '全选'
        ..$on.change = (val) {
          checkedCities.value = val ? cityOptions.sublist(0) : [];
          selectAllProp.indeterminate = false;
        },
      WCheckboxGroup()
        ..$props.value = checkedCities
        ..$slots.$ = List.generate(
          cityOptions.length,
          (index) => WCheckbox()
            ..$props.label = cityOptions[index]
            ..$slots.$ = cityOptions[index],
        )
        ..$on.change = (val) {
          var checkedCount = val.length;
          checkAll.value = checkedCount == cityOptions.length;
          selectAllProp.indeterminate =
              checkedCount > 0 && checkedCount < cityOptions.length;
        },
    ]),
    r'''
    List<String> cityOptions = ['上海', '北京', '广州', '深圳'];
    var checkAll = ValueNotifier(false);
    var checkedCities = ValueNotifier(['上海', '北京']);
    var selectAllProp = WCheckboxProp(
      value: checkAll,
      indeterminate: true,
    );
    Column(children: [
      WCheckbox()
        ..$props.value = ValueNotifier(false)
        ..$on.change = (val) {
          checkedCities.value = val ? cityOptions.sublist(0) : [];
          selectAllProp.indeterminate = false;
        },
      WCheckboxGroup()
        ..$props.value = checkedCities
        ..$slots.$ = List.generate(
          cityOptions.length,
          (index) => WCheckbox()
            ..$props.label = cityOptions[index]
            ..$slots.$ = cityOptions[index],
        )
        ..$on.change = (val) {
          var checkedCount = val.length;
          checkAll.value = checkedCount == cityOptions.length;
          selectAllProp.indeterminate =
              checkedCount > 0 && checkedCount < cityOptions.length;
        },
    ]),
    ''',
  );

  var checkboxSizeLimit = Demo(
    'checkboxSizeLimit',
    WCheckboxGroup()
      ..$props.value = checkedCities
      ..$props.min = 1
      ..$props.max = 3
      ..$slots.$ = List.generate(
        cityOptions.length,
        (index) {
          var city = cityOptions[index];
          return WCheckbox(
            props: WCheckboxProp(label: city),
            slots: WCheckboxSlot(city),
          );
        },
      ),
    r'''
    List<String> cityOptions = ['上海', '北京', '广州', '深圳'];
    var checkedCities = ValueNotifier(['上海', '北京']);
  
    WCheckboxGroup()
      ..$props.value = checkedCities
      ..$props.min = 1
      ..$props.max = 2
      ..$slots.$ = List.generate(
        cityOptions.length,
        (index) {
          var city = cityOptions[index];
          return WCheckbox(
            props: WCheckboxProp(label: city),
            slots: WCheckboxSlot(city),
          );
        },
      ),
    ''',
  );

  var checkedCities1 = ValueNotifier(['上海']);
  var checkboxButton1 = Demo(
    'checkboxButton1',
    WCheckboxGroup()
      ..$props.value = checkedCities1
      ..$slots.$ = List.generate(cityOptions.length, (index) {
        var city = cityOptions[index];
        return WCheckboxButton()
          ..$props.label = city
          ..$slots.$ = city;
      }),
    r'''
    var checkedCities1 = ValueNotifier(['上海']);
  
    WCheckboxGroup()
      ..$props.value = checkedCities1
      ..$slots.$ = List.generate(cityOptions.length, (index) {
        var city = cityOptions[index];
        return WCheckboxButton()
          ..$props.label = city
          ..$slots.$ = city;
      }),
    ''',
  );

  var checkedCities2 = ValueNotifier(['上海']);
  var checkboxButton2 = Demo(
    'checkboxButton2',
    WCheckboxGroup()
      ..$props.value = checkedCities2
      ..$props.size = 'medium'
      ..$slots.$ = List.generate(cityOptions.length, (index) {
        var city = cityOptions[index];
        return WCheckboxButton()
          ..$props.label = city
          ..$slots.$ = city;
      }),
    r'''
    var checkedCities2 = ValueNotifier(['上海']);

    WCheckboxGroup()
      ..$props.value = checkedCities1
      ..$props.size = 'medium'
      ..$slots.$ = List.generate(cityOptions.length, (index) {
        var city = cityOptions[index];
        return WCheckboxButton()
          ..$props.label = city
          ..$slots.$ = city;
      })
    ''',
  );

  var checkedCities3 = ValueNotifier(['上海']);
  var checkboxButton3 = Demo(
    'checkboxButton3',
    WCheckboxGroup()
      ..$props.value = checkedCities3
      ..$props.size = 'small'
      ..$slots.$ = List.generate(cityOptions.length, (index) {
        var city = cityOptions[index];
        return WCheckboxButton()
          ..$props.label = city
          ..$slots.$ = city;
      }),
    r'''
    var checkedCities3 = ValueNotifier(['上海']);

    WCheckboxGroup()
      ..$props.value = checkedCities3
      ..$props.size = 'small'
      ..$slots.$ = List.generate(cityOptions.length, (index) {
        var city = cityOptions[index];
        return WCheckboxButton()
          ..$props.label = city
          ..$slots.$ = city;
      }),
    ''',
  );

  var checkedCities4 = ValueNotifier(['上海']);
  var checkboxButton4 = Demo(
    'checkboxButton4',
    WCheckboxGroup()
      ..$props.value = checkedCities4
      ..$props.size = 'mini'
      ..$slots.$ = List.generate(cityOptions.length, (index) {
        var city = cityOptions[index];
        return WCheckboxButton()
          ..$props.label = city
          ..$slots.$ = city;
      }),
    r'''
    var checkedCities4 = ValueNotifier(['上海']);

    WCheckboxGroup()
      ..$props.value = checkedCities4
      ..$props.size = 'mini'
      ..$slots.$ = List.generate(cityOptions.length, (index) {
        var city = cityOptions[index];
        return WCheckboxButton()
          ..$props.label = city
          ..$slots.$ = city;
      }),
    ''',
  );

  var checkboxBorder1 = Demo(
    'checkboxBorder1',
    WCheckboxGroup()
      ..$props.value = checkedCities1
      ..$slots.$ = List.generate(cityOptions.length, (index) {
        var city = cityOptions[index];
        return WCheckbox()
          ..$props.label = city
          ..$props.border = true
          ..$slots.$ = city;
      }),
    r'''
    var checkedCities1 = ValueNotifier(['上海']);
  
    WCheckboxGroup()
      ..$props.value = checkedCities1
      ..$slots.$ = List.generate(cityOptions.length, (index) {
        var city = cityOptions[index];
        return WCheckbox()
          ..$props.label = city
          ..$props.border = true
          ..$slots.$ = city;
      }),
    ''',
  );

  var checkboxBorder2 = Demo(
    'checkboxBorder2',
    WCheckboxGroup()
      ..$props.value = checkedCities2
      ..$props.size = 'medium'
      ..$slots.$ = List.generate(cityOptions.length, (index) {
        var city = cityOptions[index];
        return WCheckbox()
          ..$props.label = city
          ..$props.border = true
          ..$slots.$ = city;
      }),
    r'''
    var checkedCities2 = ValueNotifier(['上海']);
  
    WCheckboxGroup()
      ..$props.value = checkedCities2
      ..$props.size = 'medium'
      ..$slots.$ = List.generate(cityOptions.length, (index) {
        var city = cityOptions[index];
        return WCheckbox()
          ..$props.label = city
          ..$props.border = true
          ..$slots.$ = city;
      }),
    ''',
  );

  var checkboxBorder3 = Demo(
    'checkboxBorder3',
    WCheckboxGroup()
      ..$props.value = checkedCities3
      ..$props.size = 'small'
      ..$slots.$ = List.generate(cityOptions.length, (index) {
        var city = cityOptions[index];
        return WCheckbox()
          ..$props.label = city
          ..$props.border = true
          ..$slots.$ = city;
      }),
    r'''
    var checkedCities3 = ValueNotifier(['上海']);
  
    WCheckboxGroup()
      ..$props.value = checkedCities3
      ..$props.size = 'small'
      ..$slots.$ = List.generate(cityOptions.length, (index) {
        var city = cityOptions[index];
        return WCheckbox()
          ..$props.label = city
          ..$props.border = true
          ..$slots.$ = city;
      }),
    ''',
  );
  var checkboxBorder4 = Demo(
    'checkboxBorder4',
    WCheckboxGroup()
      ..$props.value = checkedCities4
      ..$props.size = 'mini'
      ..$slots.$ = List.generate(cityOptions.length, (index) {
        var city = cityOptions[index];
        return WCheckbox()
          ..$props.label = city
          ..$props.border = true
          ..$slots.$ = city;
      }),
    r'''
    var checkedCities4 = ValueNotifier(['上海']);
  
    WCheckboxGroup()
      ..$props.value = checkedCities4
      ..$props.size = 'mini'
      ..$slots.$ = List.generate(cityOptions.length, (index) {
        var city = cityOptions[index];
        return WCheckbox()
          ..$props.label = city
          ..$props.border = true
          ..$slots.$ = city;
      }),
    ''',
  );
}
