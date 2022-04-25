import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/states/global_states.dart';
import '../../core/utils/layout_util.dart';
import '../../core/utils/wrapper.dart';
import '../basic/cfg_global.dart';

extension CanRemoveOverlay on OverlayState {
  void removeAll() {}
}

mixin HasOverlayMixin<T extends StatefulWidget> on TickerProviderStateMixin<T> {
  Function(void Function())? panelSetState;
  BuildContext? panelContext;
  Offset? lastOffset = null;
  late Offset panelOffset = const Offset(0, 0);
  late AnimationController panelController;
  late Animation<double> panelHeightAnimation;
  late Animation<double> panelOpacity;

  bool _isHover = false;

  double panelHeight = 800;

  OverlayEntry? panelOverlay = null;

  Widget get panel {
    return Stack(
      children: [
        GestureDetector(onTap: () => hidePanelAction()),
        StatefulBuilder(builder: (context, setState) {
          Navigator.of(context)
              .userGestureInProgressNotifier
              .addListener(removePanel);
          panelSetState = setState;
          panelContext = context;

          // 在控件渲染完成后执行的回调
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _updatePanel(context, setState);
            // debugPrint('${Navigator.of(context).widget.pages.length}');
            // TODO ，当路由切换时，通过重新渲染来触发面板隐藏
            if (lastOffset != null && lastOffset!.dy != panelOffset.dy) {
              hidePanelAction();
            }
          });
          // var offset = panelOffset;
          return Positioned(
            top: panelOffset.dy,
            left: panelOffset.dx,
            child: MouseRegion(
              onEnter: (e) => _isHover = true,
              onExit: (e) => _isHover = false,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: panelHeightAnimation.value,
                  maxWidth: panelMinWidth,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(panelOpacity.value ~/ 1, 255, 255, 255),
                ),
                child: panelOutside,
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget get panelOutside {
    return shadowWrapper(borderWrapper(
      ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(panelContext!).size.height),
        child: Padding(
          padding: EdgeInsets.zero,
          child: SingleChildScrollView(child: panelInside),
        ),
      ),
      panelBorder,
      true,
    ));
  }

  showPanelAction() {
    lastOffset = null;
    panelOffset = const Offset(0, 0);
    if (kDebugMode) {
      print('----show panel action---------');
    }
    panelOverlay ??=
        OverlayEntry(builder: (context) => panel, maintainState: false);

    panelOverlay = panelOverlay;
    Navigator.of(context).overlay?.insert(panelOverlay!);

    panelController.forward();
  }

  hidePanelAction() {
    Navigator.of(context)
        .userGestureInProgressNotifier
        .removeListener(removePanel);
    if (kDebugMode) {
      print('----hide panel action---------');
    }
    panelController.reverse().whenComplete(removePanel);
  }

  removePanel() {
    debugPrint('----remove panel action---------');
    panelOverlay?.remove();
    panelOverlay = null;
    routeTime.removeListener(removePanel);
  }

  setAnimationWhenInit() {
    panelController =
        AnimationController(duration: CfgGlobal.duration, vsync: this);

    panelOpacity = Tween(begin: 0.0, end: 255.0).animate(panelController);

    panelHeightAnimation = Tween(begin: 0.0, end: panelHeight)
        .animate(panelController)
      ..addListener(updatePanel);
  }

  updatePanel() {
    debugPrint('updatePanel------------------------');
    setState(() {});
    panelSetState?.call(() {});
  }

  GlobalKey get triggerWidgetKey => throw UnimplementedError();

  Widget get panelInside => throw UnimplementedError();

  Border get panelBorder {
    return Border.all(width: 10, color: CfgGlobal.primaryColor);
  }

  double get panelMinWidth {
    return 280;
  }

  _updatePanel(BuildContext panelContext, panelSetState) {
    var itemRect = getPosition(context);
    Rect selectRect = getPosition(triggerWidgetKey.currentContext!);
    var panelRect = getPosition(panelContext);

    panelSetState(() {
      var dx = itemRect.left - panelBorder.left.width;
      var dy = itemRect.top + selectRect.height;
      if (dx < 0) {
        dx = 0;
      }

      var win = MediaQuery.of(context).size;
      var screenWidth = win.width;
      var screenHeight = win.height;
      if (itemRect.left + panelRect.width > screenWidth) {
        dx = MediaQuery.of(context).size.width - panelRect.width;
      }

      if (dy + panelHeight > screenHeight && 2 * dy > screenHeight) {
        dy = dy - panelRect.height - selectRect.height;
      }
      if (panelOffset != Offset.zero) lastOffset = panelOffset;
      panelOffset = Offset(dx, dy);
    });
  }
}
