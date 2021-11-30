import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WDescriptions extends StatelessWidget
    implements
        BaseWidget<WDescriptionsOn, WDescriptionsProp, WDescriptionsSlot> {
  @override
  late WDescriptionsOn $on;

  @override
  late WDescriptionsProp $props;

  @override
  late WDescriptionsSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WDescriptionsOn extends BaseOn {}

class WDescriptionsProp extends BaseProp {}

class WDescriptionsSlot extends BaseSlot {}
