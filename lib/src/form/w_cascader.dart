import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WCascader extends StatelessWidget
    implements BaseWidget<WCascaderOn, WCascaderProp, WCascaderSlot> {
  @override
  late WCascaderOn $on;

  @override
  late WCascaderProp $props;

  @override
  late WCascaderSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCascaderOn extends BaseOn {}

class WCascaderProp extends BaseProp {}

class WCascaderSlot extends BaseSlot {}
