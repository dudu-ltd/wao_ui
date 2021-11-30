import 'package:example/package/ApiContainerLayout.dart';
import 'package:example/package/Index.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/src/layout/container_layout.dart';
import 'package:wao_ui/src/tree/tree.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);
  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late BuildContext navContext;

  static const Map<String, Widget> _route = {
    'ContainerLayout': ApiContainerLayout(),
  };

  RoutePageBuilder getNext(String routeName) {
    return (BuildContext nContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      navContext = nContext;
      return _route[routeName] ?? const Index();
    };
  }

  Navigator createNav() {
    return Navigator(
      // Navigator
      initialRoute: 'Index',
      onGenerateRoute: (val) {
        RoutePageBuilder builder = getNext(val.name!);
        return PageRouteBuilder(
          pageBuilder: builder,
          // transitionDuration: const Duration(milliseconds: 0),
        );
      },
      onUnknownRoute: (val) {
        print(val);
      },
      observers: <NavigatorObserver>[],
    );
  }

  @override
  Widget build(BuildContext context) {
    Navigator nav = createNav();
    return Scaffold(
      body: ContainerLayout(
        nav,
        slots: ContainerLayoutSlot(
          asideLeft: PlainTree(
            on: PlainTreeOn(
              nodeClick: (ctx, node) {
                return () {
                  Navigator.pushNamed(navContext, node.text);
                };
              },
            ),
            props: PlainTreeProp(
              data: [
                {
                  "id": '1',
                  "text": '布局',
                  'children': [
                    {'id': '3', 'text': 'ContainerLayout'}
                  ]
                },
                {
                  "id": '2',
                  "text": '树',
                  'children': [
                    {'id': '4', 'text': 'PlainTree'}
                  ]
                },
              ],
            ),
          ),
        ),
        props: ContainerLayoutProp(
          leftJudge: true,
          asideLeftMinWidth: 200.0,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
