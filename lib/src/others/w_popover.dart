import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WPopover extends StatelessWidget
    implements
        BaseWidget<WPopoverOn, WPopoverProp, WPopoverSlot, WPopoverStyle> {
  @override
  late final WPopoverOn $on;
  @override
  late final WPopoverProp $props;
  @override
  late final WPopoverSlot $slots;
  @override
  late WPopoverStyle $style;

  WPopover({
    Key? key,
    WPopoverOn? on,
    WPopoverProp? props,
    WPopoverSlot? slots,
    WPopoverStyle? style,
  }) : super(key: key) {
    $on = on ?? WPopoverOn();
    $props = props ?? WPopoverProp();
    $slots = slots ?? WPopoverSlot(null);
    $style = style ?? WPopoverStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WPopoverOn extends BaseOn {
  Function()? show;
  Function()? afterEnter;
  Function()? hide;
  Function()? afterLeave;
}

class WPopoverProp extends BaseProp {
  late String trigger;
  late String? title;
  late String? content;
  late String width;
  late String placement;
  late bool disabled;
  late bool value;
  late double offset;
  late String transition;
  late bool visibleArrow;
  late String popperOptions;
  late String popperClass;
  late int openDelay;
  late int closeDelay;
  late int tabindex;
}

class WPopoverSlot extends BaseSlot {
  Widget? reference;
  WPopoverSlot(defaultSlotBefore, {this.reference}) : super(defaultSlotBefore);
}
