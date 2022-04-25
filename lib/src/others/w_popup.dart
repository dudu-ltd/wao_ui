import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:wao_ui/src/routes/w_popup_route.dart';
import '../../core/base_mixins.dart';
import '../../core/base_style.dart';

class WPopup
    extends WStatefulWidget<WPopupOn, WPopupProp, WPopupSlot, WPopupStyle> {
  WPopup({
    Key? key,
    WPopupOn? on,
    WPopupProp? props,
    WPopupSlot? slots,
    WPopupStyle? style,
  }) : super(key: key) {
    $on = on ?? WPopupOn();
    $props = props ?? WPopupProp();
    $slots = slots ?? WPopupSlot(null);
    $style = style ?? WPopupStyle();
    init();
  }

  @override
  State<StatefulWidget> createState() => _WPopupState();
}

class _WPopupState extends WState<WPopup> {
  @override
  Widget wbuild(BuildContext context) {
    return Container();
  }
}

class WPopupOn extends BaseOn {}

class WPopupProp extends BaseProp {}

class WPopupSlot extends BaseSlot {
  WPopupSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WPopupStyle extends BaseStyle {}

Future<T?> popup<T>({
  required BuildContext context,
  required RelativeRect position,
  required Widget child,
  bool useRootNavigator = false,
  Duration duration = const Duration(milliseconds: 300),
}) {
  final NavigatorState navigator =
      Navigator.of(context, rootNavigator: useRootNavigator);
  return navigator
      .push(WPopupRoute(transitionDuration: duration, child: child));
}
