import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WSkeleton extends StatelessWidget
    implements BaseWidget<WSkeletonOn, WSkeletonProp, WSkeletonSlot> {
  @override
  late final WSkeletonOn $on;

  @override
  late final WSkeletonProp $props;

  @override
  late final WSkeletonSlot $slots;

  WSkeleton({
    Key? key,
    WSkeletonOn? on,
    WSkeletonProp? props,
    WSkeletonSlot? slots,
  }) : super(key: key) {
    $on = on ?? WSkeletonOn();
    $props = props ?? WSkeletonProp();
    $slots = slots ?? WSkeletonSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WSkeletonOn extends BaseOn {}

class WSkeletonProp extends BaseProp {}

class WSkeletonSlot extends BaseSlot {}
