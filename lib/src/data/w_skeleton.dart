import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WSkeleton extends StatelessWidget
    implements BaseWidget<WSkeletonOn, WSkeletonProp, WSkeletonSlot> {
  @override
  late WSkeletonOn $on;

  @override
  late WSkeletonProp $props;

  @override
  late WSkeletonSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WSkeletonOn extends BaseOn {}

class WSkeletonProp extends BaseProp {}

class WSkeletonSlot extends BaseSlot {}
