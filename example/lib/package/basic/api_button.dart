import 'package:example/main2.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/src/basic/w_button.dart';

import '../../main.dart';

class ApiButton extends StatelessWidget {
  const ApiButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultBtnGroup = [
      WButton(
        slots: WButtonSlot('默认按钮'),
        props: WButtonProp(type: 'text'),
        on: WButtonOn(click: () {
          main2();
        }),
      ),
      WButton(
          slots: WButtonSlot(
            '主要按钮',
          ),
          props: WButtonProp(type: 'primary')),
      WButton(
          slots: WButtonSlot(
            '成功按钮',
          ),
          props: WButtonProp(type: 'success')),
      WButton(
          slots: WButtonSlot(
            '警告按钮',
          ),
          props: WButtonProp(type: 'warning')),
      WButton(
          slots: WButtonSlot(
            '危险按钮',
          ),
          props: WButtonProp(type: 'danger')),
      WButton(
          slots: WButtonSlot(
            '信息按钮',
          ),
          props: WButtonProp(type: 'info')),
    ];

    var plainBtnGroup = [
      WButton(
          slots: WButtonSlot(
            '默认按钮',
          ),
          props: WButtonProp(plain: true, type: 'text')),
      WButton(
          slots: WButtonSlot(
            '主要按钮',
          ),
          props: WButtonProp(plain: true, type: 'primary')),
      WButton(
          slots: WButtonSlot(
            '成功按钮',
          ),
          props: WButtonProp(plain: true, type: 'success')),
      WButton(
          slots: WButtonSlot(
            '警告按钮',
          ),
          props: WButtonProp(plain: true, type: 'warning')),
      WButton(
          slots: WButtonSlot(
            '危险按钮',
          ),
          props: WButtonProp(plain: true, type: 'danger')),
      WButton(
          slots: WButtonSlot(
            '信息按钮',
          ),
          props: WButtonProp(plain: true, type: 'info')),
    ];

    var roundBtnGroup = [
      WButton(
          slots: WButtonSlot(
            '默认按钮',
          ),
          props: WButtonProp(round: true, type: 'text')),
      WButton(
          slots: WButtonSlot(
            '主要按钮',
          ),
          props: WButtonProp(round: true, type: 'primary')),
      WButton(
          slots: WButtonSlot(
            '成功按钮',
          ),
          props: WButtonProp(round: true, type: 'success')),
      WButton(
          slots: WButtonSlot(
            '警告按钮',
          ),
          props: WButtonProp(round: true, type: 'warning')),
      WButton(
          slots: WButtonSlot(
            '危险按钮',
          ),
          props: WButtonProp(round: true, type: 'danger')),
      WButton(
          slots: WButtonSlot(
            '信息按钮',
          ),
          props: WButtonProp(round: true, type: 'info')),
    ];

    var iconBtnGroup = [
      WButton(
        slots: WButtonSlot(
          Icons.search,
        ),
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'text'),
      ),
      WButton(
        slots: WButtonSlot(
          Icons.edit,
        ),
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'primary'),
      ),
      WButton(
        slots: WButtonSlot(
          Icons.check,
        ),
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'success'),
      ),
      WButton(
        slots: WButtonSlot(
          Icons.message,
        ),
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'info'),
      ),
      WButton(
        slots: WButtonSlot(
          Icons.star,
        ),
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'warning'),
      ),
      WButton(
        slots: WButtonSlot(
          Icons.delete,
        ),
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'danger'),
      ),
    ];
    var iconTextBtnGroup = [
      WButton(
        slots: WButtonSlot(
          '搜索',
        ),
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'text'),
      ),
      WButton(
        slots: WButtonSlot(
          Icons.edit,
        ),
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'primary'),
      ),
      WButton(
        slots: WButtonSlot(
          Icons.check,
        ),
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'success'),
      ),
      WButton(
        slots: WButtonSlot(
          Icons.message,
        ),
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'info'),
      ),
      WButton(
        slots: WButtonSlot(
          Icons.star,
        ),
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'warning'),
      ),
      WButton(
        slots: WButtonSlot(
          Icons.delete,
        ),
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'danger'),
      ),
    ];

    var sizeBtnGroup = [
      WButton(
          slots: WButtonSlot(
            'mini',
          ),
          props: WButtonProp(size: 'mini')),
      WButton(
          slots: WButtonSlot(
            'small',
          ),
          props: WButtonProp(size: 'small')),
      WButton(
          slots: WButtonSlot(
            'medium',
          ),
          props: WButtonProp(size: 'medium')),
      WButton(
          slots: WButtonSlot(
            'large',
          ),
          props: WButtonProp(size: 'large')),
    ];

    var result = ListView(
      children: [
        Row(
          children: defaultBtnGroup,
        ),
        Row(
          children: plainBtnGroup,
        ),
        Row(
          children: roundBtnGroup,
        ),
        Row(
          children: iconBtnGroup,
        ),
        Row(
          children: sizeBtnGroup,
        ),
      ],
    );
    return result;
  }
}
