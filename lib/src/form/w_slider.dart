import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WSlider extends StatelessWidget
    implements BaseWidget<WSliderOn, WSliderProp, WSliderSlot> {
  @override
  late final WSliderOn $on;

  @override
  late final WSliderProp $props;

  @override
  late final WSliderSlot $slots;

  WSlider({
    Key? key,
    WSliderOn? on,
    WSliderProp? props,
    WSliderSlot? slots,
  }) : super(key: key) {
    $on = on ?? WSliderOn();
    $props = props ?? WSliderProp();
    $slots = slots ?? WSliderSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WSliderOn extends BaseOn {}

class WSliderProp extends BaseProp {}

class WSliderSlot extends BaseSlot {}
