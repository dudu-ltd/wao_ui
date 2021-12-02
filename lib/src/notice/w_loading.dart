import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WLoading extends StatelessWidget
    implements BaseWidget<WLoadingOn, WLoadingProp, WLoadingSlot> {
  @override
  late final WLoadingOn $on;

  @override
  late final WLoadingProp $props;

  @override
  late final WLoadingSlot $slots;

  WLoading({
    Key? key,
    WLoadingOn? on,
    WLoadingProp? props,
    WLoadingSlot? slots,
  }) : super(key: key) {
    $on = on ?? WLoadingOn();
    $props = props ?? WLoadingProp();
    $slots = slots ?? WLoadingSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WLoadingOn extends BaseOn {}

class WLoadingProp extends BaseProp {}

class WLoadingSlot extends BaseSlot {}
