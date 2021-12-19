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
        '默认按钮',
        props: WButtonProp(type: 'text'),
        on: WButtonOn(click: () {
          main2();
        }),
      ),
      WButton('主要按钮', props: WButtonProp(type: 'primary')),
      WButton('成功按钮', props: WButtonProp(type: 'success')),
      WButton('警告按钮', props: WButtonProp(type: 'warning')),
      WButton('危险按钮', props: WButtonProp(type: 'danger')),
      WButton('信息按钮', props: WButtonProp(type: 'info')),
    ];

    var plainBtnGroup = [
      WButton('默认按钮', props: WButtonProp(plain: true, type: 'text')),
      WButton('主要按钮', props: WButtonProp(plain: true, type: 'primary')),
      WButton('成功按钮', props: WButtonProp(plain: true, type: 'success')),
      WButton('警告按钮', props: WButtonProp(plain: true, type: 'warning')),
      WButton('危险按钮', props: WButtonProp(plain: true, type: 'danger')),
      WButton('信息按钮', props: WButtonProp(plain: true, type: 'info')),
    ];

    var roundBtnGroup = [
      WButton('默认按钮', props: WButtonProp(round: true, type: 'text')),
      WButton('主要按钮', props: WButtonProp(round: true, type: 'primary')),
      WButton('成功按钮', props: WButtonProp(round: true, type: 'success')),
      WButton('警告按钮', props: WButtonProp(round: true, type: 'warning')),
      WButton('危险按钮', props: WButtonProp(round: true, type: 'danger')),
      WButton('信息按钮', props: WButtonProp(round: true, type: 'info')),
    ];

    var iconBtnGroup = [
      WButton(
        Icons.search,
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'text'),
      ),
      WButton(
        Icons.edit,
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'primary'),
      ),
      WButton(
        Icons.check,
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'success'),
      ),
      WButton(
        Icons.message,
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'info'),
      ),
      WButton(
        Icons.star,
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'warning'),
      ),
      WButton(
        Icons.delete,
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'danger'),
      ),
    ];
    var iconTextBtnGroup = [
      WButton(
        '搜索',
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'text'),
      ),
      WButton(
        Icons.edit,
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'primary'),
      ),
      WButton(
        Icons.check,
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'success'),
      ),
      WButton(
        Icons.message,
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'info'),
      ),
      WButton(
        Icons.star,
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'warning'),
      ),
      WButton(
        Icons.delete,
        props: WButtonProp(circle: true, icon: Icons.edit, type: 'danger'),
      ),
    ];

    var sizeBtnGroup = [
      WButton('mini', props: WButtonProp(size: 'mini')),
      WButton('small', props: WButtonProp(size: 'small')),
      WButton('medium', props: WButtonProp(size: 'medium')),
      WButton('large', props: WButtonProp(size: 'large')),
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
