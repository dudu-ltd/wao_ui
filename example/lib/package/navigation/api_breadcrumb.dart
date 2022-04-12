import 'package:flutter/material.dart';
import 'package:wao_ui/src/navigation/w_breadcrumb.dart';

class ApiBreadcrumb extends StatelessWidget {
  const ApiBreadcrumb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Row(children: basicGroup),
    ]);
  }

  List<Widget> get basicGroup {
    return [
      WBreadcrumb(
        props: WBreadcrumbProp(separator: '>'),
        slots: WBreadcrumbSlot(const [
          {'text': 'tttt1', 'icon': Icons.edit},
          {'text': 'tttt2', 'icon': Icons.flutter_dash},
          {'text': 'tttt3', 'icon': Icons.edit},
          {'text': 'tttt4', 'icon': Icons.edit},
          {'text': 'tttt5', 'icon': Icons.edit},
          {'text': 'tttt6', 'icon': Icons.edit},
          {'text': 'tttt7', 'icon': Icons.edit},
        ]),
      )
    ];
  }
}
