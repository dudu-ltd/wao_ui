import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WMessage extends StatelessWidget
    implements BaseWidget<WMessageOn, WMessageProp, WMessageSlot> {
  @override
  late WMessageOn $on;

  @override
  late WMessageProp $props;

  @override
  late WMessageSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WMessageOn extends BaseOn {}

class WMessageProp extends BaseProp {}

class WMessageSlot extends BaseSlot {}
