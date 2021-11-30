import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WTimeline extends StatelessWidget
    implements BaseWidget<WTimelineOn, WTimelineProp, WTimelineSlot> {
  @override
  late WTimelineOn $on;

  @override
  late WTimelineProp $props;

  @override
  late WTimelineSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTimelineOn extends BaseOn {}

class WTimelineProp extends BaseProp {}

class WTimelineSlot extends BaseSlot {}
