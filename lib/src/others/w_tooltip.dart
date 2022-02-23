import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WTooltip extends StatelessWidget
    with BaseMixins<WTooltipOn, WTooltipProp, WTooltipSlot, WTooltipStyle> {
  WTooltip({
    Key? key,
    WTooltipOn? on,
    WTooltipProp? props,
    WTooltipSlot? slots,
    WTooltipStyle? style,
  }) : super(key: key) {
    $on = on ?? WTooltipOn();
    $props = props ?? WTooltipProp();
    $slots = slots ?? WTooltipSlot(null);
    $style = style ?? WTooltipStyle();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTooltipOn extends BaseOn {}

class WTooltipProp extends BaseProp {
  late String effect;
  late String? content;
  late String placement;
  late bool value;
  late bool disabled;
  late double offset;
  late String transition;
  late bool visibleArrow;
  late Object popperOptions;
  late int openDelay;
  late bool manual;
  late String? popperClass;
  late bool enterable;
  late int hideAfter;
  late int tabindex;
  WTooltipProp({
    this.effect = 'dark',
    this.content,
    this.placement = 'bottom',
    this.value = false,
    this.disabled = false,
    this.offset = 0.0,
    this.transition = 'fade-in-linear',
    this.visibleArrow = true,
    this.popperOptions = const {
      'boundariesElement': 'body',
      'gpuAcceleration': false
    },
    this.openDelay = 0,
    this.manual = false,
    this.popperClass,
    this.enterable = true,
    this.hideAfter = 0,
    this.tabindex = 0,
  });
}

class WTooltipSlot extends BaseSlot {
  WTooltipSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
