import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WTimeline extends StatelessWidget
    implements BaseWidget<WTimelineOn, WTimelineProp, WTimelineSlot> {
  @override
  late final WTimelineOn $on;

  @override
  late final WTimelineProp $props;

  @override
  late final WTimelineSlot $slots;

  WTimeline({
    Key? key,
    WTimelineOn? on,
    WTimelineProp? props,
    WTimelineSlot? slots,
  }) : super(key: key) {
    $on = on ?? WTimelineOn();
    $props = props ?? WTimelineProp();
    $slots = slots ?? WTimelineSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTimelineOn extends BaseOn {}

class WTimelineProp extends BaseProp {}

class WTimelineSlot extends BaseSlot {
  WTimelineSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
