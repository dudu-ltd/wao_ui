import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WLoading extends StatelessWidget
    implements BaseWidget<WLoadingOn, WLoadingProp, WLoadingSlot> {
  @override
  late WLoadingOn $on;

  @override
  late WLoadingProp $props;

  @override
  late WLoadingSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WLoadingOn extends BaseOn {}

class WLoadingProp extends BaseProp {}

class WLoadingSlot extends BaseSlot {}
