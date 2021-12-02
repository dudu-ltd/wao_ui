import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WRate extends StatelessWidget
    implements BaseWidget<WRateOn, WRateProp, WRateSlot> {
  @override
  late final WRateOn $on;

  @override
  late final WRateProp $props;

  @override
  late final WRateSlot $slots;

  WRate({
    Key? key,
    WRateOn? on,
    WRateProp? props,
    WRateSlot? slots,
  }) : super(key: key) {
    $on = on ?? WRateOn();
    $props = props ?? WRateProp();
    $slots = slots ?? WRateSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WRateOn extends BaseOn {}

class WRateProp extends BaseProp {}

class WRateSlot extends BaseSlot {}
