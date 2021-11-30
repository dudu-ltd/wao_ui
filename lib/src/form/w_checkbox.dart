import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WCheckbox extends StatelessWidget
    implements BaseWidget<WCheckboxOn, WCheckboxProp, WCheckboxSlot> {
  @override
  late WCheckboxOn $on;

  @override
  late WCheckboxProp $props;

  @override
  late WCheckboxSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCheckboxOn extends BaseOn {}

class WCheckboxProp extends BaseProp {}

class WCheckboxSlot extends BaseSlot {}
