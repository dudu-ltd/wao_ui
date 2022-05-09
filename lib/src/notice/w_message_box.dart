import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

extension Alert on Widget {
  $message([String? content, String? title, Widget? child]) {}
}

class WMessageBox extends WStatelessWidget<WMessageBoxOn, WMessageBoxProp,
    WMessageBoxSlot, WMessageBoxStyle> {
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
    init();
  }

  @override
  Widget wbuild(BuildContext context) {
    return Container();
  }
}

class WMessageBoxOn extends BaseOn {}

class WMessageBoxProp extends BaseProp {}

class WMessageBoxSlot extends BaseSlot {
  WMessageBoxSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
