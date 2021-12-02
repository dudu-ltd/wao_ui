import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WProgress extends StatelessWidget
    implements BaseWidget<WProgressOn, WProgressProp, WProgressSlot> {
  @override
  late final WProgressOn $on;

  @override
  late final WProgressProp $props;

  @override
  late final WProgressSlot $slots;

  WProgress({
    Key? key,
    WProgressOn? on,
    WProgressProp? props,
    WProgressSlot? slots,
  }) : super(key: key) {
    $on = on ?? WProgressOn();
    $props = props ?? WProgressProp();
    $slots = slots ?? WProgressSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WProgressOn extends BaseOn {}

class WProgressProp extends BaseProp {}

class WProgressSlot extends BaseSlot {}
