import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_popconfirm.dart';
import 'package:wao_ui/wao_ui.dart';

class ApiPopconfirm extends StatelessWidget {
  const ApiPopconfirm({Key? key}) : super(key: key);

  Widget get basic {
    return WPopconfirm(
      props: WPopconfirmProp(title: '这是一段内容确定删除吗？'),
      slots: WPopconfirmSlot(
        null,
        reference: WButton(
          slots: WButtonSlot(const Text('删除')),
        ),
      ),
    );
  }

  Widget get custom {
    return WPopconfirm(
      props: WPopconfirmProp(
        confirmButtonText: '好的',
        cancelButtonText: '不用了',
        icon: Icons.info,
        iconColor: '#009900',
        title: '这是一段内容确定删除吗？',
      ),
      slots: WPopconfirmSlot(
        null,
        reference: WButton(
          slots: WButtonSlot(const Text('删除')),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WPopconfirm'),
      const Text('基本用法'),
      ____________________________________,
      basic,
      ____________________________________,
      const Text('自定义'),
      ____________________________________,
      custom,
    ]);
  }

  final Widget ____________________________________ = const SizedBox(
    height: 10,
    width: 1,
  );
}
