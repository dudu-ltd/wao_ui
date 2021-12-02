import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WTable extends StatelessWidget
    implements BaseWidget<WTableOn, WTableProp, WTableSlot> {
  @override
  late final WTableOn $on;

  @override
  late final WTableProp $props;

  @override
  late final WTableSlot $slots;

  WTable({
    Key? key,
    WTableOn? on,
    WTableProp? props,
    WTableSlot? slots,
  }) : super(key: key) {
    $on = on ?? WTableOn();
    $props = props ?? WTableProp();
    $slots = slots ?? WTableSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTableOn extends BaseOn {}

class WTableProp extends BaseProp {}

class WTableSlot extends BaseSlot {}
