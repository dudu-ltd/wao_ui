import 'package:flutter/material.dart';
import 'package:wao_ui/core/states/global_states.dart';

typedef Widget NestedRouteBuilder(Widget child);

class NestedRoute {
  final Map<String, NestedRoute>? subRoutes;
  final NestedRouteBuilder builder;

  NestedRoute({this.subRoutes, required this.builder});

  Route buildRoute(List<String> paths, int index) {
    return MaterialPageRoute(
      builder: (_) => _build(paths, index),
    );
  }

  Widget _build(List<String> paths, int index) {
    if (index >= paths.length) {
      final child = subRoutes != null ? subRoutes!['/'] : null;
      return builder(child?.builder(Container()) ?? Container());
    }
    return builder(
        subRoutes?[paths[index]]?._build(paths, index + 1) ?? Container());
  }
}

RouteFactory buildNestedRoutes(Map<String, NestedRoute> routes) {
  return (RouteSettings settings) {
    List<String> paths = [];
    settings.name?.split('/').forEach((element) {
      if (element != '') paths.add(element);
    });
    if (paths.isEmpty) {
      return routes['/']?.buildRoute([], 1);
    }
    routeTime.value = DateTime.now();
    return routes[paths[0]]?.buildRoute(paths, 1);
  };
}

// 作者：今天你摸鱼了吗
// 链接：https://juejin.cn/post/6911890832555524110
// 来源：稀土掘金
// 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。