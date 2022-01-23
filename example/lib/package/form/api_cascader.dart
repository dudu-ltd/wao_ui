import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

class ApiCascader extends StatelessWidget {
  ApiCascader({Key? key}) : super(key: key);

  static const List<Map<String, dynamic>> options = [
    {
      'value': 'zhinan',
      'label': '指南',
      'disabled': true,
      'children': [
        {
          'value': 'shejiyuanze',
          'label': '设计原则',
          'children': [
            {'value': 'yizhi', 'label': '一致'},
            {'value': 'fankui', 'label': '反馈'},
            {'value': 'xiaolv', 'label': '效率'},
            {'value': 'kekong', 'label': '可控'}
          ]
        },
        {
          'value': 'daohang',
          'label': '导航',
          'children': [
            {'value': 'cexiangdaohang', 'label': '侧向导航'},
            {'value': 'dingbudaohang', 'label': '顶部导航'}
          ]
        }
      ]
    },
    {
      'value': 'zujian',
      'label': '组件',
      'children': [
        {
          'value': 'basic',
          'label': 'Basic',
          'children': [
            {'value': 'layout', 'label': 'Layout 布局'},
            {'value': 'color', 'label': 'Color 色彩'},
            {'value': 'typography', 'label': 'Typography 字体'},
            {'value': 'icon', 'label': 'Icon 图标'},
            {'value': 'button', 'label': 'Button 按钮'}
          ]
        },
        {
          'value': 'form',
          'label': 'Form',
          'children': [
            {'value': 'radio', 'label': 'Radio 单选框'},
            {'value': 'checkbox', 'label': 'Checkbox 多选框'},
            {'value': 'input', 'label': 'Input 输入框'},
            {'value': 'input-number', 'label': 'InputNumber 计数器'},
            {'value': 'select', 'label': 'Select 选择器'},
            {'value': 'cascader', 'label': 'Cascader 级联选择器'},
            {'value': 'switch', 'label': 'Switch 开关'},
            {'value': 'slider', 'label': 'Slider 滑块'},
            {'value': 'time-picker', 'label': 'TimePicker 时间选择器'},
            {'value': 'date-picker', 'label': 'DatePicker 日期选择器'},
            {'value': 'datetime-picker', 'label': 'DateTimePicker 日期时间选择器'},
            {'value': 'upload', 'label': 'Upload 上传'},
            {'value': 'rate', 'label': 'Rate 评分'},
            {'value': 'form', 'label': 'Form 表单'}
          ]
        },
        {
          'value': 'data',
          'label': 'Data',
          'children': [
            {'value': 'table', 'label': 'Table 表格'},
            {'value': 'tag', 'label': 'Tag 标签'},
            {'value': 'progress', 'label': 'Progress 进度条'},
            {'value': 'tree', 'label': 'Tree 树形控件'},
            {'value': 'pagination', 'label': 'Pagination 分页'},
            {'value': 'badge', 'label': 'Badge 标记'}
          ]
        },
        {
          'value': 'notice',
          'label': 'Notice',
          'children': [
            {'value': 'alert', 'label': 'Alert 警告'},
            {'value': 'loading', 'label': 'Loading 加载'},
            {'value': 'message', 'label': 'Message 消息提示'},
            {'value': 'message-box', 'label': 'MessageBox 弹框'},
            {'value': 'notification', 'label': 'Notification 通知'}
          ]
        },
        {
          'value': 'navigation',
          'label': 'Navigation',
          'children': [
            {'value': 'menu', 'label': 'NavMenu 导航菜单'},
            {'value': 'tabs', 'label': 'Tabs 标签页'},
            {'value': 'breadcrumb', 'label': 'Breadcrumb 面包屑'},
            {'value': 'dropdown', 'label': 'Dropdown 下拉菜单'},
            {'value': 'steps', 'label': 'Steps 步骤条'}
          ]
        },
        {
          'value': 'others',
          'label': 'Others',
          'children': [
            {'value': 'dialog', 'label': 'Dialog 对话框'},
            {'value': 'tooltip', 'label': 'Tooltip 文字提示'},
            {'value': 'popover', 'label': 'Popover 弹出框'},
            {'value': 'card', 'label': 'Card 卡片'},
            {'value': 'carousel', 'label': 'Carousel 走马灯'},
            {'value': 'collapse', 'label': 'Collapse 折叠面板'}
          ]
        }
      ]
    },
    {
      'value': 'ziyuan',
      'label': '资源',
      'children': [
        {'value': 'axure', 'label': 'Axure Components'},
        {'value': 'sketch', 'label': 'Sketch Templates'},
        {'value': 'jiaohu', 'label': '组件交互文档'}
      ]
    }
  ];

  handleChange(value) {
    print(value);
  }

  Widget get basic {
    return Row(
      children: [
        Column(
          children: [
            const Text('默认 click 触发子菜单'),
            WCascader(
              props: WCascaderProp(
                options: options,
              ),
              on: WCascaderOn(change: handleChange),
            ),
          ],
        ),
        Column(
          children: [
            const Text('hover 触发子菜单'),
            WCascader(
              props: WCascaderProp(
                options: options,
                props: PanelPropDetail(expandTrigger: 'hover'),
              ),
              on: WCascaderOn(change: handleChange),
            ),
          ],
        ),
      ],
    );
  }

  var value = [];

  Widget get disabled {
    return WCascader(
      props: WCascaderProp(
        options: options,
      ),
    );
  }

  Widget get clear {
    return WCascader(
      props: WCascaderProp(
        options: options,
        clearable: true,
      ),
    );
  }

  Widget get showLastOne {
    return WCascader(
      props: WCascaderProp(
        options: options,
        showAllLevels: false,
      ),
    );
  }

  var multiProps = PanelPropDetail(multiple: true);

  Widget get multiSelect {
    return Row(
      children: [
        Column(
          children: [
            const Text('默认显示所有Tag'),
            WCascader(
              props: WCascaderProp(
                value: value,
                props: multiProps,
                options: options,
              ),
              on: WCascaderOn(change: handleChange),
            ),
          ],
        ),
        Column(
          children: [
            const Text('折叠展示Tag'),
            WCascader(
              props: WCascaderProp(
                value: value,
                options: options,
                props: multiProps,
                collapseTags: true,
              ),
              on: WCascaderOn(change: handleChange),
            ),
          ],
        ),
      ],
    );
  }

  Widget get anyOne {
    return Row(
      children: [
        Column(
          children: [
            const Text('单选选择任意一级选项'),
            WCascader(
              props: WCascaderProp(
                props: PanelPropDetail(checkStrictly: true),
                options: options,
              ),
              on: WCascaderOn(change: handleChange),
            ),
          ],
        ),
        Column(
          children: [
            const Text('多选选择任意一级选项'),
            WCascader(
              props: WCascaderProp(
                value: value,
                options: options,
                props: PanelPropDetail(multiple: true, checkStrictly: true),
                collapseTags: true,
              ),
              on: WCascaderOn(change: handleChange),
            ),
          ],
        ),
      ],
    );
  }

  Widget get dynamicLoad {
    return WCascader(
      props: WCascaderProp(
        options: options,
        props: PanelPropDetail(
            lazy: true,
            lazyLoad: (node, resolve) {
              var level = node.level;
              print(level);
              Timer(const Duration(seconds: 1), () {
                // nodes = Array.from({ length: level + 1 })
                //   .map(item => ({
                //     value: ++id,
                //     label: `选项${id}`,
                //     leaf: level >= 2
                //   }));
                var nodes = [];
                // 通过调用resolve将子节点数据返回，通知组件数据加载完成
                resolve(nodes);
              });
            }),
        collapseTags: true,
      ),
    );
  }

  Widget get search {
    return Row(
      children: [
        Column(
          children: [
            const Text('单选可搜索'),
            WCascader(
              props: WCascaderProp(
                placeholder: '试试搜索：指南',
                options: options,
                filterable: true,
              ),
              on: WCascaderOn(change: handleChange),
            ),
          ],
        ),
        Column(
          children: [
            const Text('多选可搜索'),
            WCascader(
              props: WCascaderProp(
                value: value,
                placeholder: '试试搜索：指南',
                options: options,
                filterable: true,
                props: PanelPropDetail(multiple: true),
              ),
              on: WCascaderOn(change: handleChange),
            ),
          ],
        ),
      ],
    );
  }

  Widget get customNode {
    return WCascader(
      props: WCascaderProp(
        options: options,
      ),
      slots: WCascaderSlot(
        (node, data) {
          return Row(
            children: [
              Text(data.label),
              if (!node.isLeaf) Text(data.children.length),
            ],
          );
        },
      ),
    );
  }

  Widget get panel {
    return WCascaderPanel(
      props: WCascaderPanelProp(
        options: options,
      ),
    );
  }

  final Widget ____________________________________ = const SizedBox(
    height: 10,
    width: 1,
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('WCascader'),
          ____________________________________,
          const Text('基础用法'),
          ____________________________________,
          basic,
          ____________________________________,
          const Text('禁用状态'),
          disabled,
          ____________________________________,
          const Text('可清空'),
          ____________________________________,
          clear,
          ____________________________________,
          const Text('仅显示最后一级'),
          ____________________________________,
          showLastOne,
          ____________________________________,
          const Text('多选'),
          ____________________________________,
          multiSelect,
          ____________________________________,
          const Text('选择任意一级选项'),
          ____________________________________,
          anyOne,
          ____________________________________,
          const Text('动态加载'),
          ____________________________________,
          dynamicLoad,
          ____________________________________,
          const Text('可搜索'),
          ____________________________________,
          search,
          ____________________________________,
          const Text('自定义节点内容'),
          ____________________________________,
          customNode,
          ____________________________________,
          const Text('级联面板'),
          ____________________________________,
          panel,
        ]),
      ],
    );
  }
}
