import 'package:flutter/cupertino.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  var selectOption1 = [
    {'value': '选项1', 'label': '黄金糕'},
    {'value': '选项2', 'label': '双皮奶'},
    {'value': '选项3', 'label': '蚵仔煎'},
    {'value': '选项4', 'label': '龙须面'},
    {'value': '选项5', 'label': '北京烤鸭'}
  ];

  var selectOption2 = [
    {'value': 'Beijing', 'label': '北京'},
    {'value': 'Shanghai', 'label': '上海'},
    {'value': 'Nanjing', 'label': '南京'},
    {'value': 'Chengdu', 'label': '成都'},
    {'value': 'Shenzhen', 'label': '深圳'},
    {'value': 'Guangzhou', 'label': '广州'}
  ];

  var selectOption3 = [
    {
      'label': '热门城市',
      'options': [
        {'value': 'Shanghai', 'label': '上海'},
        {'value': 'Beijing', 'label': '北京'}
      ]
    },
    {
      'label': '城市名',
      'options': [
        {'value': 'Chengdu', 'label': '成都'},
        {'value': 'Shenzhen', 'label': '深圳'},
        {'value': 'Guangzhou', 'label': '广州'},
        {'value': 'Dalian', 'label': '大连'}
      ]
    }
  ];

  var selectOption1w = Demo(
    'selectOption1',
    Container(),
    r'''
  [
    {'value': '选项1', 'label': '黄金糕'},
    {'value': '选项2', 'label': '双皮奶'},
    {'value': '选项3', 'label': '蚵仔煎'},
    {'value': '选项4', 'label': '龙须面'},
    {'value': '选项5', 'label': '北京烤鸭'}
  ]
  ''',
  );

  var selectOption2w = Demo(
    'selectOption2',
    Container(),
    r'''
  [
    {'value': 'Beijing', 'label': '北京'},
    {'value': 'Shanghai', 'label': '上海'},
    {'value': 'Nanjing', 'label': '南京'},
    {'value': 'Chengdu', 'label': '成都'},
    {'value': 'Shenzhen', 'label': '深圳'},
    {'value': 'Guangzhou', 'label': '广州'}
  ]
  ''',
  );

  var selectOption3w = Demo(
    'selectOption3',
    Container(),
    r'''
  [
    {
      'label': '热门城市',
      'options': [
        {'value': 'Shanghai', 'label': '上海'},
        {'value': 'Beijing', 'label': '北京'}
      ]
    },
    {
      'label': '城市名',
      'options': [
        {'value': 'Chengdu', 'label': '成都'},
        {'value': 'Shenzhen', 'label': '深圳'},
        {'value': 'Guangzhou', 'label': '广州'},
        {'value': 'Dalian', 'label': '大连'}
      ]
    }
  ]
  ''',
  );

  var selectBasic = Demo(
    'selectBasic',
    WSelect()
      ..$props.placeholder = '请选择'
      ..$props.model = '选项1'
      ..$slots.$ = List.generate(
        selectOption1.length,
        (index) => WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value'],
      ),
    r'''
    WSelect()
      ..$props.placeholder = '请选择'
      ..$props.value = '选项1'
      ..$slots.$ = List.generate(
        selectOption1.length,
        (index) => WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value'],
      )
    ''',
  );

  var selectItemDisabled = Demo(
    'selectItemDisabled',
    WSelect()
      ..$props.placeholder = '请选择'
      ..$props.model = '选项1'
      ..$slots.$ = List.generate(
        selectOption1.length,
        (index) => WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value']
          ..$props.disabled = index == 1,
      ),
    r'''
    WSelect()
      ..$props.placeholder = '请选择'
      ..$props.value = '选项1'
      ..$slots.$ = List.generate(
        selectOption1.length,
        (index) => WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value']
          ..$props.disabled = index == 1,
      )
    ''',
  );

  var selectDisabled = Demo(
    'selectDisabled',
    WSelect()
      ..$props.placeholder = '请选择'
      ..$props.model = '选项1'
      ..$props.disabled = true
      ..$slots.$ = List.generate(
        selectOption1.length,
        (index) => WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value'],
      ),
    r'''
    WSelect()
      ..$props.placeholder = '请选择'
      ..$props.value = '选项1'
      ..$props.disabled = true
      ..$slots.$ = List.generate(
        selectOption1.length,
        (index) => WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value'],
      )
    ''',
  );

  var selectSingleClear = Demo(
    'selectSingleClear',
    WSelect()
      ..$props.clearable = true
      ..$props.model = '选项1'
      ..$slots.$ = List.generate(
        selectOption1.length,
        (index) => WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value'],
      ),
    r'''
    WSelect()
      ..$props.clearable = true
      ..$props.value = '选项1'
      ..$slots.$ = List.generate(
        selectOption1.length,
        (index) => WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value'],
      )
    ''',
  );

  var selectBasicMulti1 = Demo(
    'selectBasicMulti1',
    WSelect()
      ..$props.clearable = true
      ..$props.model = ['选项1']
      ..$props.multiple = true
      ..$slots.$ = List.generate(
        selectOption1.length,
        (index) => WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value'],
      ),
    r'''
    WSelect()
      ..$props.clearable = true
      ..$props.value = ['选项1']
      ..$props.multiple = true
      ..$slots.$ = List.generate(
        selectOption1.length,
        (index) => WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value'],
      )
    ''',
  );
  var selectBasicMulti2 = Demo(
    'selectBasicMulti2',
    WSelect()
      ..$props.clearable = true
      ..$props.model = ['选项1']
      ..$props.multiple = true
      ..$props.collapseTags = true
      ..$slots.$ = List.generate(
        selectOption1.length,
        (index) => WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value'],
      ),
    r'''
    WSelect()
      ..$props.clearable = true
      ..$props.value = ['选项1']
      ..$props.multiple = true
      ..$slots.$ = List.generate(
        selectOption1.length,
        (index) => WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value'],
      )
    ''',
  );

  var selectCustomTpl = Demo(
    'selectCustomTpl',
    WSelect()
      ..$props.model = ['选项1']
      ..$props.clearable = true
      ..$props.multiple = true
      ..$slots.$ = List.generate(selectOption1.length, (index) {
        return WOption()
          ..$props.label = selectOption1[index]['label']
          ..$slots.$ = Row(
            children: [
              Row(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(selectOption1[index]['label'] ?? ''),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(selectOption1[index]['label'] ?? ''),
                ),
              ])
            ],
          );
      }),
    r'''
    WSelect()
      ..$props.value = ['选项1']
      ..$props.clearable = true
      ..$props.multiple = true
      ..$slots.$ = List.generate(selectOption1.length, (index) {
        return WOption()
          ..$props.label = selectOption1[index]['label']
          ..$slots.$ = Row(
            children: [
              Row(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(selectOption1[index]['label'] ?? ''),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(selectOption1[index]['label'] ?? ''),
                ),
              ])
            ],
          );
      })
    ''',
  );

  var selectGroup = Demo(
    'selectGroup',
    WSelect()
      ..$props.placeholder = '请选择'
      ..$props.model = ['Shanghai']
      ..$props.multiple = true
      ..$slots.$ = List.generate(selectOption3.length, (index) {
        var city = selectOption3[index];
        var cityList = city['options'] as List;
        return WOptionGroup()
          ..$props.label = city['label'].toString()
          ..$slots.$ = List.generate(cityList.length, (index) {
            var c = cityList[index];
            return WOption()
              ..$props.label = c['label']
              ..$props.value = c['value'];
          });
      }),
    r'''
    WSelect()
      ..$props.placeholder = '请选择'
      ..$props.value = ['Shanghai']
      ..$props.multiple = true
      ..$slots.$ = List.generate(selectOption3.length, (index) {
        var city = selectOption3[index];
        var cityList = city['options'] as List;
        return WOptionGroup()
          ..$props.label = city['label'].toString()
          ..$slots.$ = List.generate(cityList.length, (index) {
            var c = cityList[index];
            return WOption()
              ..$props.label = c['label']
              ..$props.value = c['value'];
          });
      })
    ''',
  );

  var selectSearch = Demo(
    'selectSearch',
    WSelect()
      ..$props.placeholder = '请选择'
      ..$props.model = '选项1'
      ..$props.filterable = true
      ..$slots.$ = List.generate(selectOption1.length, (index) {
        return WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value'];
      }),
    r'''
    WSelect()
      ..$props.placeholder = '请选择'
      ..$props.value = '选项1'
      ..$props.filterable = true
      ..$slots.$ = List.generate(selectOption1.length, (index) {
        WOption()..$props.label =  selectOption1[index]['label']..$props.value = selectOption1[index]['value'],
      })
    ''',
  );

  var selectRemote = Demo(
    'selectRemote',
    WSelect()
      ..$props.placeholder = '请选择'
      ..$props.model = ['选项1']
      ..$props.multiple = true
      ..$props.filterable = true
      ..$props.remote = true
      ..$props.reserveKeyword = true
      ..$props.remoteMethod = (() {})
      ..$props.loading = true
      ..$slots.$ = List.generate(selectOption1.length, (index) {
        return WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value'];
      }),
    r'''
  
    WSelect()
      ..$props.placeholder = '请选择'
      ..$props.value = ['选项1']
      ..$props.multiple = true
      ..$props.filterable = true
      ..$slots.$ = List.generate(selectOption1.length, (index) {
        return WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value'];
      })
    ''',
  );

  var selectCreatable = Demo(
    'selectCreatable',
    WSelect()
      ..$props.placeholder = '请选择文章标签'
      ..$props.model = []
      ..$props.multiple = true
      ..$props.filterable = true
      ..$props.allowCreate = true
      ..$props.defaultFirstOption = true
      ..$slots.$ = List.generate(selectOption1.length, (index) {
        return WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value'];
      }),
    r'''
    WSelect()
      ..$props.placeholder = '请选择文章标签'
      ..$props.value = []
      ..$props.multiple = true
      ..$props.filterable = true
      ..$props.allowCreate = true
      ..$props.defaultFirstOption = true
      ..$slots.$ = List.generate(selectOption1.length, (index) {
        return WOption()
          ..$props.label = selectOption1[index]['label']
          ..$props.value = selectOption1[index]['value'];
      })
    ''',
  );
}
