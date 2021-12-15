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

class WDescriptionsProp extends BaseProp {
  late bool border;
  late int column;
  late String direction;
  late String size;
  String? title;
  String? extra;
  late bool colon;

  WDescriptionsProp({
    border,
    column,
    direction,
    size,
    title,
    extra,
    colon,
  }) {
    this.border = border ?? false;
    this.column = column ?? 3;
    this.direction = direction ?? 'horizontal';
    this.size = size ?? 'medium';
    this.title = title;
    this.extra = extra;
    this.colon = colon ?? true;
  }
}

class WDescriptionsSlot extends BaseSlot {
  Widget? title;
  Widget? extra;
  WDescriptionsSlot({this.title, this.extra});
}
