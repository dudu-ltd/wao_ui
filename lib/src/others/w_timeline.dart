import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WTimeline extends StatelessWidget
    implements
        BaseWidget<WTimelineOn, WTimelineProp, WTimelineSlot, WTimelineStyle> {
  @override
  late final WTimelineOn $on;
  @override
  late final WTimelineProp $props;
  @override
  late final WTimelineSlot $slots;
  @override
  late WTimelineStyle $style;

  WTimeline({
    Key? key,
    WTimelineOn? on,
    WTimelineProp? props,
    WTimelineSlot? slots,
    WTimelineStyle? style,
  }) : super(key: key) {
    $on = on ?? WTimelineOn();
    $props = props ?? WTimelineProp();
    $slots = slots ?? WTimelineSlot(null);
    $style = style ?? WTimelineStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTimelineOn extends BaseOn {}

class WTimelineProp extends BaseProp {
  late bool reverse;

  WTimelineProp({
    this.reverse = false,
  });
}

class WTimelineSlot extends BaseSlot {
  WTimelineSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WTimelineItem extends StatelessWidget
    implements
        BaseWidget<WTimelineItemOn, WTimelineItemProp, WTimelineItemSlot,
            WTimelineItemStyle> {
  @override
  late final WTimelineItemOn $on;

  @override
  late final WTimelineItemProp $props;

  @override
  late final WTimelineItemSlot $slots;

  @override
  late final WTimelineItemStyle $style;

  WTimelineItem({
    Key? key,
    WTimelineItemOn? on,
    WTimelineItemProp? props,
    WTimelineItemSlot? slots,
    WTimelineItemStyle? style,
  }) : super(key: key) {
    $on = on ?? WTimelineItemOn();
    $props = props ?? WTimelineItemProp();
    $slots = slots ?? WTimelineItemSlot(null);
    $style = style ?? WTimelineItemStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTimelineItemOn extends BaseOn {}

class WTimelineItemProp extends BaseProp {
  late String? timestamp;
  late bool hideTimestamp;
  late String placement;
  late String? type;
  late String? color;
  late String size;
  late IconData? icon;

  WTimelineItemProp({
    this.timestamp,
    this.hideTimestamp = false,
    this.placement = 'bottom',
    this.type,
    this.color,
    this.size = 'normal',
    this.icon,
  });
}

class WTimelineItemSlot extends BaseSlot {
  Widget? dot;
  WTimelineItemSlot(defaultSlotBefore, {this.dot}) : super(defaultSlotBefore);
}
