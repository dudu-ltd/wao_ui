import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WDescriptions extends StatelessWidget
    implements
        BaseWidget<WDescriptionsOn, WDescriptionsProp, WDescriptionsSlot> {
  @override
  late final WDescriptionsOn $on;

  @override
  late final WDescriptionsProp $props;

  @override
  late final WDescriptionsSlot $slots;

  WDescriptions({
    Key? key,
    WDescriptionsOn? on,
    WDescriptionsProp? props,
    WDescriptionsSlot? slots,
  }) : super(key: key) {
    $on = on ?? WDescriptionsOn();
    $props = props ?? WDescriptionsProp();
    $slots = slots ?? WDescriptionsSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WDescriptionsOn extends BaseOn {}

class WDescriptionsProp extends BaseProp {}

class WDescriptionsSlot extends BaseSlot {}
