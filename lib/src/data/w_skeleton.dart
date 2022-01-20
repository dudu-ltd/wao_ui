import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WSkeleton extends StatelessWidget
    implements
        BaseWidget<WSkeletonOn, WSkeletonProp, WSkeletonSlot, WSkeletonStyle> {
  @override
  late final WSkeletonOn $on;
  @override
  late final WSkeletonProp $props;
  @override
  late final WSkeletonSlot $slots;
  @override
  late WSkeletonStyle $style;

  WSkeleton({
    Key? key,
    WSkeletonOn? on,
    WSkeletonProp? props,
    WSkeletonSlot? slots,
    WSkeletonStyle? style,
  }) : super(key: key) {
    $on = on ?? WSkeletonOn();
    $props = props ?? WSkeletonProp();
    $slots = slots ?? WSkeletonSlot(null);
    $style = style ?? WSkeletonStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WSkeletonOn extends BaseOn {}

class WSkeletonProp extends BaseProp {}

class WSkeletonSlot extends BaseSlot {
  WSkeletonSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
