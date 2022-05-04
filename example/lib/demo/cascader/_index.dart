import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  var options = [
    {
      'value': 'zhinan',
      'label': '指南',
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
  var cascaderOptions = Demo(
    'cascaderOptions',
    const Text('以下示例代码的 options 均使用下面的数据'),
    r'''
  [
    {
      'value': 'zhinan',
      'label': '指南',
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
  ]
    ''',
  );

  var cascaderBasic = Demo(
    'cascaderBasic',
    WCascader()
      ..$props.options = options
      ..$on.change = (value) => print('handleChange , value = $value'),
    r'''
    WCascader()
      ..$props.options = options
      ..$on.change = (value) => print('handleChange , value = $value'),
    ''',
  );

  var cascaderDisabled = Demo(
    'cascaderDisabled',
    WCascader()..$props.options = options,
    r'''
    WCascader()
      ..$props.options = options
    ''',
  );

  var cascaderClear = Demo(
    'cascaderClear',
    WCascader()
      ..$props.options = options
      ..$props.clearable = true,
    r'''
    WCascader()
      ..$props.options = options
      ..$props.clearable = true,
    ''',
  );

  var cascaderLastOne = Demo(
    'cascaderLastOne',
    WCascader()
      ..$props.options = options
      ..$props.showAllLevels = false,
    r'''
    WCascader()
      ..$props.options = options
      ..$props.showAllLevels = false,
    ''',
  );

  var value = [];
  var multiProps = PanelPropDetail(multiple: true);
  var cascaderMultiSelect1 = Demo(
    'cascaderMultiSelect1',
    WCascader()
      ..$props.options = options
      ..$props.clearable = true
      ..$props.props = multiProps
      ..$props.model = value
      ..$on.change = (value) => print('handleChange , value = $value'),
    r'''
    var value = [];
    var multiProps = PanelPropDetail(multiple: true);
    WCascader()
      ..$props.options = options
      ..$props.clearable = true
      ..$props.props = multiProps
      ..$props.value = value
      ..$on.change = (value) => print('handleChange , value = $value'),
    ''',
  );
  var cascaderMultiSelect2 = Demo(
    'cascaderMultiSelect2',
    WCascader()
      ..$props.options = options
      ..$props.clearable = true
      ..$props.collapseTags = true
      ..$props.props = multiProps
      ..$props.model = value
      ..$on.change = (value) => print('handleChange , value = $value'),
    r'''
    var value = [];
    var multiProps = PanelPropDetail(multiple: true);
    WCascader()
      ..$props.options = options
      ..$props.clearable = true
      ..$props.collapseTags = true
      ..$props.props = multiProps
      ..$props.value = value
      ..$on.change = (value) => print('handleChange , value = $value'),
    ''',
  );

  var cascaderAnyOne1 = Demo(
    'cascaderAnyOne1',
    WCascader()
      ..$props.props = PanelPropDetail(checkStrictly: true)
      ..$props.options = options
      ..$on.change = (value) => print('handleChange , value = $value'),
    r'''
    WCascader()
      ..$props.props = PanelPropDetail(checkStrictly: true)
      ..$props.options = options
      ..$on.change = (value) => print('handleChange , value = $value'),
    ''',
  );

  var cascaderAnyOne2 = Demo(
    'cascaderAnyOne2',
    WCascader()
      ..$props.props = PanelPropDetail(checkStrictly: true, multiple: true)
      ..$props.options = options
      ..$on.change = (value) => print('handleChange , value = $value'),
    r'''
    WCascader()
      ..$props.props = PanelPropDetail(checkStrictly: true, multiple: true)
      ..$props.options = options
      ..$on.change = (value) => print('handleChange , value = $value'),
    ''',
  );

  var cascaderDynamicLoad = Demo(
    'cascaderDynamicLoad',
    WCascader()
      ..$props.collapseTags = true
      ..$props.options = options
      ..$props.props = (PanelPropDetail()
        ..lazy = true
        ..lazyLoad = ((node, resolve) {
          var level = node.level;
          print(level);
          Timer(const Duration(seconds: 1), () {
            var nodes = [];
            resolve(nodes);
          });
        })),
    r'''
    WCascader()
      ..$props.collapseTags = true
      ..$props.options = options
      ..$props.props = (PanelPropDetail()
        ..lazy = true
        ..lazyLoad = ((node, resolve) {
          var level = node.level;
          print(level);
          Timer(const Duration(seconds: 1), () {
            var nodes = [];
            resolve(nodes);
          });
        })),
    ''',
  );

  var cascaderSeach1 = Demo(
    'cascaderSeach1',
    WCascader()
      ..$props.placeholder = '试试搜索：指南'
      ..$props.options = options
      ..$props.filterable = true
      ..$on.change = (value) => print('handleChange , value = $value'),
    r'''
    WCascader()
      ..$props.placeholder = '试试搜索：指南'
      ..$props.options = options
      ..$props.filterable = true
      ..$on.change = (value) => print('handleChange , value = $value'),
    ''',
  );

  var cascaderSeach2 = Demo(
    'cascaderSeach2',
    WCascader()
      ..$props.model = value
      ..$props.placeholder = '试试搜索：指南'
      ..$props.options = options
      ..$props.filterable = true
      ..$props.props = (PanelPropDetail()..multiple = true)
      ..$on.change = (value) => print('handleChange , value = $value'),
    r'''
    var value = [];
    WCascader()
      ..$props.value = value
      ..$props.placeholder = '试试搜索：指南'
      ..$props.options = options
      ..$props.filterable = true
      ..$props.props = (PanelPropDetail()..multiple = true)
      ..$on.change = (value) => print('handleChange , value = $value'),
    ''',
  );

  var cascaderCustomNode = Demo(
    'cascaderCustomNode',
    WCascader()
      ..$props.options = options
      ..$slots.$ = ((node, data) {
        return Row(
          children: [
            Text(data.label),
            if (!node.isLeaf) Text(data.children.length),
          ],
        );
      }),
    r'''
    WCascader()
      ..$props.options = options
      ..$slots.$ = ((node, data) {
        return Row(
          children: [
            Text(data.label),
            if (!node.isLeaf) Text(data.children.length),
          ],
        );
      }),
    ''',
  );

  var cascaderPanel = Demo(
    'cascaderPanel',
    WCascaderPanel()
      ..$props.options = options
      ..$props.props = (PanelPropDetail()..expandTrigger = 'hover'),
    r'''
    WCascaderPanel()
      ..$props.options = options
      ..$props.props = (PanelPropDetail()..expandTrigger = 'hover'),
    ''',
  );
}
