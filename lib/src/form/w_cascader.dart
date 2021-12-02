import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WCascader extends StatelessWidget
    implements BaseWidget<WCascaderOn, WCascaderProp, WCascaderSlot> {
  @override
  late final WCascaderOn $on;

  @override
  late final WCascaderProp $props;

  @override
  late final WCascaderSlot $slots;

  WCascader({
    Key? key,
    WCascaderOn? on,
    WCascaderProp? props,
    WCascaderSlot? slots,
  }) : super(key: key) {
    $on = on ?? WCascaderOn();
    $props = props ?? WCascaderProp();
    $slots = slots ?? WCascaderSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCascaderOn extends BaseOn {}

class WCascaderProp extends BaseProp {}

class WCascaderSlot extends BaseSlot {}
