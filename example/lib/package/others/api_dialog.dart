import 'package:flutter/material.dart';

import 'package:wao_ui/src/others/w_dialog.dart';

class ApiDialog extends StatelessWidget {
  late WDialog baseDialog = WDialog(
    const Text('无标题弹窗'),
    props: WDialogProp(btn: '无标题弹窗', top: '20vh'),
  );

  late WDialog titleDialog = WDialog(
    const Text('标题弹窗'),
    slots: WDialogSlot(
        title: Row(
      children: const [
        Icon(Icons.flutter_dash),
        Text('我是标题'),
      ],
    )),
    props: WDialogProp(btn: '标题弹窗', top: '400px'),
  );

  late WDialog customBtnDialog = WDialog(
    const Text('自定义按钮弹窗'),
    slots: WDialogSlot(btn: const Icon(Icons.ac_unit)),
  );
  late WDialog nestedBtnDialog = WDialog(
    const Text('自定义按钮弹窗'),
    props: WDialogProp(title: "我是标题", appendToBody: true),
    slots: WDialogSlot(
      btn: const Icon(Icons.edit_location_rounded),
      footer: [
        TextButton(
          child: const Text('取消'),
          onPressed: () {},
        ),
        titleDialog
      ],
    ),
  );

  ApiDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late WDialog customActionDialog;
    customActionDialog = WDialog(
      const Text('自定义按钮弹窗'),
      slots: WDialogSlot(
        btn: const Icon(Icons.ac_unit),
        footer: [
          TextButton(
            child: const Text('取消'),
            onPressed: () {},
          )
        ],
      ),
    );
    return Column(children: [
      baseDialog,
      titleDialog,
      customBtnDialog,
      customActionDialog,
      nestedBtnDialog
    ]);
  }
}
