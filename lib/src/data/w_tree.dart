import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WTree extends StatelessWidget
    implements BaseWidget<WTreeOn, WTreeProp, WTreeSlot, WTreeStyle> {
  @override
  late final WTreeOn $on;
  @override
  late final WTreeProp $props;
  @override
  late final WTreeSlot $slots;
  @override
  late WTreeStyle $style;

  WTree({
    Key? key,
    WTreeOn? on,
    WTreeProp? props,
    WTreeSlot? slots,
    WTreeStyle? style,
  }) : super(key: key) {
    $on = on ?? WTreeOn();
    $props = props ?? WTreeProp();
    $slots = slots ?? WTreeSlot(null);
    $style = style ?? WTreeStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTreeOn extends BaseOn {}

class WTreeProp extends BaseProp {}

class WTreeSlot extends BaseSlot {
  WTreeSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
