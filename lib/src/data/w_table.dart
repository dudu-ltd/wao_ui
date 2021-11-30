import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WTable extends StatelessWidget
    implements BaseWidget<WTableOn, WTableProp, WTableSlot> {
  @override
  late WTableOn $on;

  @override
  late WTableProp $props;

  @override
  late WTableSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTableOn extends BaseOn {}

class WTableProp extends BaseProp {}

class WTableSlot extends BaseSlot {}
