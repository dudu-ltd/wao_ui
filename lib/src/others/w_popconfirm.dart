import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WPopconfirm extends StatelessWidget
    implements BaseWidget<WPopconfirmOn, WPopconfirmProp, WPopconfirmSlot> {
  @override
  late final WPopconfirmOn $on;

  @override
  late final WPopconfirmProp $props;

  @override
  late final WPopconfirmSlot $slots;

  WPopconfirm({
    Key? key,
    WPopconfirmOn? on,
    WPopconfirmProp? props,
    WPopconfirmSlot? slots,
  }) : super(key: key) {
    $on = on ?? WPopconfirmOn();
    $props = props ?? WPopconfirmProp();
    $slots = slots ?? WPopconfirmSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WPopconfirmOn extends BaseOn {}

class WPopconfirmProp extends BaseProp {}

class WPopconfirmSlot extends BaseSlot {}
