import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WRadio extends StatelessWidget
    implements BaseWidget<WRadioOn, WRadioProp, WRadioSlot> {
  @override
  late final WRadioOn $on;

  @override
  late final WRadioProp $props;

  @override
  late final WRadioSlot $slots;

  WRadio({
    Key? key,
    WRadioOn? on,
    WRadioProp? props,
    WRadioSlot? slots,
  }) : super(key: key) {
    $on = on ?? WRadioOn();
    $props = props ?? WRadioProp();
    $slots = slots ?? WRadioSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WRadioOn extends BaseOn {}

class WRadioProp extends BaseProp {}

class WRadioSlot extends BaseSlot {}
