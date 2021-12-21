import 'package:flutter/material.dart';
import 'package:wao_ui/src/basic/w_button.dart';
import 'package:wao_ui/src/data/w_descriptions.dart';

class ApiDescriptions extends StatelessWidget {
  const ApiDescriptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    var borderDesc = WDescriptions(
      props: WDescriptionsProp(
        fields: fields,
        title: '带边框列表',
        border: true,
      ),
      slots: WDescriptionsSlot(
        data,
        extra: WButton(
            slots: WButtonSlot('操作'),
            props: WButtonProp(type: 'info', size: 'mini')),
      ),
    );
    var noBorderDesc = WDescriptions(
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
    );
    var vBorderDesc = WDescriptions(
      slots: WDescriptionsSlot(
        data,
        title: const Text('垂直带边框列表',
            style: TextStyle(fontWeight: FontWeight.w600)),
      ),
      props: WDescriptionsProp(
          fields: fields, direction: 'vertical', border: true),
    );
    var vNoBorderDesc = WDescriptions(
      slots: WDescriptionsSlot(
        data,
        title: const Text('垂直无边框列表',
            style: TextStyle(fontWeight: FontWeight.w600)),
      ),
      props: WDescriptionsProp(
          fields: fields, direction: 'vertical', border: false),
    );

    return Column(children: [
      const Text('WDescriptions'),
      borderDesc,
      noBorderDesc,
      vBorderDesc,
      vNoBorderDesc,
    ]);
  }
}
