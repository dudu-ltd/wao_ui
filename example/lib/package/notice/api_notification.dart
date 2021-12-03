import 'package:flutter/material.dart';
import 'package:wao_ui/src/notice/w_notification.dart';

class ApiNotification extends StatelessWidget {
  const ApiNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WNotification'),
      WNotification(),
    ]);
  }
}
