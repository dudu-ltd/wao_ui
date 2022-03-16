import 'package:example/views/index.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WButton()
          ..$slots.$ = '学习'
          ..$on.click = () {
            Navigator.pushNamed(
              context,
              '/index',
              arguments: MaterialPageRoute(
                settings: RouteSettings(name: 'learn', arguments: {'id': '3'}),
                builder: (context) {
                  return IndexPage();
                },
              ),
            );
          },
      ],
    );
  }
}
