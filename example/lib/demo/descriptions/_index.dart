import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_style.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  descriptionsBorder;
  descriptionsNoBorder;
  descriptionsVBorder;
  descriptionsVNoBorder;
}

var data = const {
  'name': 'CorvusY',
  'mobile': '187****1167',
  'living': '福建省厦门市XX区XX路XX号 XXX室',
  'remark': '自习室',
  'contactAddr': '福建省厦门市XX区XX路XX号',
};
var fields = [
  {
    'label': '用户名',
    'field': 'name',
  },
  {
    'label': '手机号',
    'field': 'mobile',
  },
  {
    'label': '居住地',
    'field': 'living',
  },
  {
    'label': '备注',
    'field': 'remark',
  },
  {
    'label': '联系地址',
    'field': 'contactAddr',
  },
];

var descriptionsBorder = Demo(
  'descriptionsBorder',
  WDescriptions()
    ..$props.fields = fields
    ..$props.title = '带边框列表'
    ..$props.border = true
    ..$slots.$ = data
    ..$slots.extra = (WButton()
      ..$slots.$ = '操作'
      ..$props.type = 'info'
      ..$props.size = 'small'),
  r'''
  WDescriptions()
    ..$props.fields = fields
    ..$props.title = '带边框列表'
    ..$props.border = true
    ..$slots.$ = data
    ..$slots.extra = (WButton()
      ..$slots.$ = '操作'
      ..$props.type = 'info'
      ..$props.size = 'small'),
  )
  ''',
);

var descriptionsNoBorder = Demo(
  'descriptionsNoBorder',
  WDescriptions(
    slots: WDescriptionsSlot(
      data,
      title: const Text(
        '无边框列表',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      extra: WButton(
        slots: WButtonSlot('操作'),
        props: WButtonProp(type: 'info', size: 'mini'),
      ),
    ),
    props: WDescriptionsProp(
      fields: fields,
      border: false,
    ),
  ),
  r'''
  WDescriptions(
    slots: WDescriptionsSlot(
      data,
      title: const Text(
        '无边框列表',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      extra: WButton(
          slots: WButtonSlot('操作'),
          props: WButtonProp(type: 'info', size: 'mini')),
    ),
    props: WDescriptionsProp(
      fields: fields,
      border: false,
    ),
  )
  ''',
);

// descriptionsVBorder;

var descriptionsVBorder = Demo(
  'descriptionsVBorder',
  WDescriptions(
    slots: WDescriptionsSlot(
      data,
      title:
          const Text('垂直带边框列表', style: TextStyle(fontWeight: FontWeight.w600)),
    ),
    props:
        WDescriptionsProp(fields: fields, direction: 'vertical', border: true),
  ),
  r'''
  WDescriptions(
      slots: WDescriptionsSlot(
        data,
        title: const Text('垂直带边框列表',
            style: TextStyle(fontWeight: FontWeight.w600)),
      ),
      props: WDescriptionsProp(
          fields: fields, direction: 'vertical', border: true),
    )
    ''',
);
// descriptionsVNoBorder;
var descriptionsVNoBorder = Demo(
  'descriptionsVNoBorder',
  WDescriptions(
    slots: WDescriptionsSlot(
      data,
      title:
          const Text('垂直无边框列表', style: TextStyle(fontWeight: FontWeight.w600)),
    ),
    props:
        WDescriptionsProp(fields: fields, direction: 'vertical', border: false),
  ),
  r'''
  
   WDescriptions(
      slots: WDescriptionsSlot(
        data,
        title: const Text('垂直无边框列表',
            style: TextStyle(fontWeight: FontWeight.w600)),
      ),
      props: WDescriptionsProp(
          fields: fields, direction: 'vertical', border: false),
    ) 
    ''',
);
