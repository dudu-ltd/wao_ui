// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

class ApiSelect extends StatelessWidget {
  ApiSelect({Key? key}) : super(key: key);

  final Widget ____________________________________ = const SizedBox(
    height: 10,
    width: 1,
  );

  List<Map> option = [
    {'value': '选项1', 'label': '黄金糕'},
    {'value': '选项2', 'label': '双皮奶'},
    {'value': '选项3', 'label': '蚵仔煎'},
    {'value': '选项4', 'label': '龙须面'},
    {'value': '选项5', 'label': '北京烤鸭'}
  ];

  List<Map> cities = [
    {'value': 'Beijing', 'label': '北京'},
    {'value': 'Shanghai', 'label': '上海'},
    {'value': 'Nanjing', 'label': '南京'},
    {'value': 'Chengdu', 'label': '成都'},
    {'value': 'Shenzhen', 'label': '深圳'},
    {'value': 'Guangzhou', 'label': '广州'}
  ];

  var cityTree = [
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

  Widget get basic {
    return WSelect(
      props: WSelectProp(placeholder: '请选择', value: '选项1'),
      slots: WSelectSlot(
        List.generate(
          option.length,
          (index) => WOption(
            props: WOptionProp(
              label: option[index]['label'],
              value: option[index]['value'],
            ),
          ),
        ),
      ),
    );
  }

  Widget get itemDisabled {
    return WSelect(
      props: WSelectProp(placeholder: '请选择', value: '选项1'),
      slots: WSelectSlot(
        List.generate(
          option.length,
          (index) => WOption(
            props: WOptionProp(
              label: option[index]['label'],
              value: option[index]['value'],
              disabled: index == 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget get disabled {
    return WSelect(
      props: WSelectProp(value: '选项1', disabled: true),
      slots: WSelectSlot(
        List.generate(
          option.length,
          (index) => WOption(
            props: WOptionProp(
              label: option[index]['label'],
              value: option[index]['value'],
            ),
          ),
        ),
      ),
    );
  }

  Widget get singleClear {
    return WSelect(
      props: WSelectProp(clearable: true, value: '选项1'),
      slots: WSelectSlot(
        List.generate(
          option.length,
          (index) => WOption(
            props: WOptionProp(
              label: option[index]['label'],
              value: option[index]['value'],
            ),
          ),
        ),
      ),
    );
  }

  Widget get basicMulti {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        WSelect(
          props: WSelectProp(
            clearable: true,
            value: ['选项1'],
            multiple: true,
          ),
          slots: WSelectSlot(
            List.generate(
              option.length,
              (index) => WOption(
                props: WOptionProp(
                  label: option[index]['label'],
                  value: option[index]['value'],
                ),
              ),
            ),
          ),
        ),
        WSelect(
          props: WSelectProp(
            clearable: true,
            value: ['选项1'],
            multiple: true,
            collapseTags: true,
          ),
          slots: WSelectSlot(
            List.generate(
              option.length,
              (index) => WOption(
                props: WOptionProp(
                  label: option[index]['label'],
                  value: option[index]['value'],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget get customTpl {
    return WSelect(
      props: WSelectProp(
        clearable: true,
        value: ['选项1'],
        multiple: true,
      ),
      slots: WSelectSlot(
        List.generate(
          option.length,
          (index) => WOption(
            props: WOptionProp(
              label: option[index]['label'],
              value: option[index]['value'],
            ),
            slots: WOptionSlot(Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(option[index]['label']),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(option[index]['value']),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }

  Widget get group {
    return WSelect(
      props:
          WSelectProp(placeholder: '请选择', value: ['Shanghai'], multiple: true),
      slots: WSelectSlot(
        List.generate(
          cityTree.length,
          (index) {
            var city = cityTree[index];
            var cityList = city['options'] as List;
            return WOptionGroup(
              props: WOptionGroupProp(label: city['label'].toString()),
              slots: WOptionGroupSlot(
                List.generate(
                  cityList.length,
                  (index) {
                    var c = cityList[index];
                    return WOption(
                      props: WOptionProp(label: c['label'], value: c['value']),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget get search {
    return WSelect(
      props: WSelectProp(placeholder: '请选择', value: '选项1', filterable: true),
      slots: WSelectSlot(
        List.generate(
          option.length,
          (index) => WOption(
            props: WOptionProp(
              label: option[index]['label'],
              value: option[index]['value'],
            ),
          ),
        ),
      ),
    );
  }

  Widget get remote {
    return WSelect(
      props: WSelectProp(
        placeholder: '请选择',
        value: ['选项1'],
        multiple: true,
        filterable: true,
        remote: true,
        reserveKeyword: true,
        remoteMethod: () {},
        loading: false,
      ),
      slots: WSelectSlot(
        List.generate(
          option.length,
          (index) => WOption(
            props: WOptionProp(
              label: option[index]['label'],
              value: option[index]['value'],
            ),
          ),
        ),
      ),
    );
  }

  Widget get creatable {
    return WSelect(
      props: WSelectProp(
        placeholder: '请选择文章标签',
        value: [],
        multiple: true,
        filterable: true,
        allowCreate: true,
        defaultFirstOption: true,
      ),
      slots: WSelectSlot(
        List.generate(
          option.length,
          (index) => WOption(
            props: WOptionProp(
              label: option[index]['label'],
              value: option[index]['value'],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('WSelect'),
          ____________________________________,
          const Text('基础用法'),
          ____________________________________,
          basic,
          ____________________________________,
          const Text('有禁用选项'),
          ____________________________________,
          itemDisabled,
          ____________________________________,
          const Text('禁用状态'),
          disabled,
          ____________________________________,
          const Text('可清空单选'),
          ____________________________________,
          singleClear,
          ____________________________________,
          const Text('基础多选'),
          ____________________________________,
          basicMulti,
          ____________________________________,
          const Text('自定义模板'),
          ____________________________________,
          customTpl,
          ____________________________________,
          const Text('分组'),
          ____________________________________,
          group,
          ____________________________________,
          const Text('可搜索'),
          ____________________________________,
          search,
          ____________________________________,
          const Text('远程搜索'),
          ____________________________________,
          remote,
          ____________________________________,
          const Text('创建条目'),
          ____________________________________,
          creatable,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          ____________________________________,
        ]),
      ],
    );
  }
}
