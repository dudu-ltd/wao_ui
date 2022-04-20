import 'package:flutter/material.dart';

import '../../core/utils/layout_util.dart';
import '../../core/utils/wrapper.dart';
import '../basic/cfg_global.dart';

mixin HasOverlayMixin<T extends StatefulWidget> on TickerProviderStateMixin<T> {
  Function(void Function())? panelSetState;
  BuildContext? panelContext;
  late Offset panelOffset = const Offset(0, 0);
  late AnimationController panelController;
  late Animation<double> panelHeightAnimation;
  late Animation<double> panelOpacity;

  double panelHeight = 700;

  late OverlayEntry? panelOverlay = null;

  Widget get panel {
    return StatefulBuilder(builder: (context, setState) {
      panelSetState = setState;
      panelContext = context;

      // 在控件渲染完成后执行的回调
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _updatePanel(context, setState);
      });
      // var offset = panelOffset;
      return Positioned(
        top: panelOffset.dy,
        left: panelOffset.dx,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: panelHeightAnimation.value,
            maxWidth: panelMinWidth,
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(panelOpacity.value ~/ 1, 255, 255, 255),
          ),
          //  TODO 为下拉框添加角标，child: angleWrapper(panelOutside),
          child: panelOutside,
        ),
      );
    });
  }

  Widget get panelOutside {
    return shadowWrapper(borderWrapper(
      Padding(
        padding: EdgeInsets.zero,
        child: panelInside,
      ),
      panelBorder,
      true,
    ));
  }

  OverlayEntry? overlayEntry;
  showPanelAction() {
    print('----show panel action---------');
    overlayEntry ??= OverlayEntry(
        builder: (context) {
          return panel;
        },
        maintainState: false);
    if (panelOverlay == null) {
      panelOverlay = overlayEntry;
      Overlay.of(context)?.insert(overlayEntry!);
    }
    panelController.forward();
  }

  hidePanelAction() {
    panelController.reverse().whenComplete(() {
      overlayEntry?.remove();
      overlayEntry = null;
    });
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
    setState(() {});
    panelSetState?.call(() {});
  }

  Widget get panelInside {
    throw Exception('No implements');
  }

  Border get panelBorder {
    return Border.all(width: 10, color: CfgGlobal.primaryColor);
  }

  double get panelMinWidth {
    return 280;
  }

  GlobalKey get triggerWidgetKey {
    throw Exception('no implements');
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
      try {
        var win = MediaQuery.of(context).size;
        var screenWidth = win.width;
        var screenHeight = win.height;
        if (itemRect.left + panelRect.width >
            MediaQuery.of(context).size.width) {
          dx = screenWidth - panelRect.width;
        }

        if (dy + selectRect.height > screenHeight) {
          dy = dy - panelRect.height - selectRect.height;
        }
        panelOffset = Offset(dx, dy);
      } catch (e) {
        print('has overlay mixin   error: $e');
      }
    });
  }
}
