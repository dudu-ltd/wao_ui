import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WResult extends StatelessWidget
    implements BaseWidget<WResultOn, WResultProp, WResultSlot> {
  @override
  late WResultOn $on;

  @override
  late WResultProp $props;

  @override
  late WResultSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WResultOn extends BaseOn {}

class WResultProp extends BaseProp {}

class WResultSlot extends BaseSlot {}
