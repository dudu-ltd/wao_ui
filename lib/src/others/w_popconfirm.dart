import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WPopconfirm extends StatelessWidget
    implements BaseWidget<WPopconfirmOn, WPopconfirmProp, WPopconfirmSlot> {
  @override
  late WPopconfirmOn $on;

  @override
  late WPopconfirmProp $props;

  @override
  late WPopconfirmSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WPopconfirmOn extends BaseOn {}

class WPopconfirmProp extends BaseProp {}

class WPopconfirmSlot extends BaseSlot {}
