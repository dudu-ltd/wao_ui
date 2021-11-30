import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WRate extends StatelessWidget
    implements BaseWidget<WRateOn, WRateProp, WRateSlot> {
  @override
  late WRateOn $on;

  @override
  late WRateProp $props;

  @override
  late WRateSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WRateOn extends BaseOn {}

class WRateProp extends BaseProp {}

class WRateSlot extends BaseSlot {}
