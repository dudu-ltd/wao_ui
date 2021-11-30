import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WSlider extends StatelessWidget
    implements BaseWidget<WSliderOn, WSliderProp, WSliderSlot> {
  @override
  late WSliderOn $on;

  @override
  late WSliderProp $props;

  @override
  late WSliderSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WSliderOn extends BaseOn {}

class WSliderProp extends BaseProp {}

class WSliderSlot extends BaseSlot {}
