import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WPopconfirm extends StatelessWidget
    implements
        BaseWidget<WPopconfirmOn, WPopconfirmProp, WPopconfirmSlot,
            WPopconfirmStyle> {
  @override
  late final WPopconfirmOn $on;
  @override
  late final WPopconfirmProp $props;
  @override
  late final WPopconfirmSlot $slots;
  @override
  late WPopconfirmStyle $style;

  WPopconfirm({
    Key? key,
    WPopconfirmOn? on,
    WPopconfirmProp? props,
    WPopconfirmSlot? slots,
    WPopconfirmStyle? style,
  }) : super(key: key) {
    $on = on ?? WPopconfirmOn();
    $props = props ?? WPopconfirmProp();
    $slots = slots ?? WPopconfirmSlot(null);
    $style = style ?? WPopconfirmStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WPopconfirmOn extends BaseOn {}

class WPopconfirmProp extends BaseProp {}

class WPopconfirmSlot extends BaseSlot {
  WPopconfirmSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
