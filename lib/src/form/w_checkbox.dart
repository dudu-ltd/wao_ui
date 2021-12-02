import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WCheckbox extends StatelessWidget
    implements BaseWidget<WCheckboxOn, WCheckboxProp, WCheckboxSlot> {
  @override
  late final WCheckboxOn $on;

  @override
  late final WCheckboxProp $props;

  @override
  late final WCheckboxSlot $slots;

  WCheckbox({
    Key? key,
    WCheckboxOn? on,
    WCheckboxProp? props,
    WCheckboxSlot? slots,
  }) : super(key: key) {
    $on = on ?? WCheckboxOn();
    $props = props ?? WCheckboxProp();
    $slots = slots ?? WCheckboxSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCheckboxOn extends BaseOn {}

class WCheckboxProp extends BaseProp {}

class WCheckboxSlot extends BaseSlot {}
