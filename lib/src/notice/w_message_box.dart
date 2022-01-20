import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WMessageBox extends StatelessWidget
    implements
        BaseWidget<WMessageBoxOn, WMessageBoxProp, WMessageBoxSlot,
            WMessageBoxStyle> {
  @override
  late final WMessageBoxOn $on;
  @override
  late final WMessageBoxProp $props;
  @override
  late final WMessageBoxSlot $slots;
  @override
  late WMessageBoxStyle $style;

  WMessageBox({
    Key? key,
    WMessageBoxOn? on,
    WMessageBoxProp? props,
    WMessageBoxSlot? slots,
    WMessageBoxStyle? style,
  }) : super(key: key) {
    $on = on ?? WMessageBoxOn();
    $props = props ?? WMessageBoxProp();
    $slots = slots ?? WMessageBoxSlot(null);
    $style = style ?? WMessageBoxStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WMessageBoxOn extends BaseOn {}

class WMessageBoxProp extends BaseProp {}

class WMessageBoxSlot extends BaseSlot {
  WMessageBoxSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
