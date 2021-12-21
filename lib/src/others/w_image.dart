import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WImage extends StatelessWidget
    implements BaseWidget<WImageOn, WImageProp, WImageSlot> {
  @override
  late final WImageOn $on;

  @override
  late final WImageProp $props;

  @override
  late final WImageSlot $slots;

  WImage({
    Key? key,
    WImageOn? on,
    WImageProp? props,
    WImageSlot? slots,
  }) : super(key: key) {
    $on = on ?? WImageOn();
    $props = props ?? WImageProp();
    $slots = slots ?? WImageSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WImageOn extends BaseOn {}

class WImageProp extends BaseProp {}

class WImageSlot extends BaseSlot {
  WImageSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
