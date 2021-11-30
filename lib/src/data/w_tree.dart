import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WTree extends StatelessWidget
    implements BaseWidget<WTreeOn, WTreeProp, WTreeSlot> {
  @override
  late WTreeOn $on;

  @override
  late WTreeProp $props;

  @override
  late WTreeSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTreeOn extends BaseOn {}

class WTreeProp extends BaseProp {}

class WTreeSlot extends BaseSlot {}
