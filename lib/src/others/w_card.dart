import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WCard extends StatelessWidget
    implements BaseWidget<WCardOn, WCardProp, WCardSlot, WCardStyle> {
  @override
  late final WCardOn $on;
  @override
  late final WCardProp $props;
  @override
  late final WCardSlot $slots;
  @override
  late WCardStyle $style;

  WCard({
    Key? key,
    WCardOn? on,
    WCardProp? props,
    WCardSlot? slots,
    WCardStyle? style,
  }) : super(key: key) {
    $on = on ?? WCardOn();
    $props = props ?? WCardProp();
    $slots = slots ?? WCardSlot(null);
    $style = style ?? WCardStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCardOn extends BaseOn {}

class WCardProp extends BaseProp {
  late String? header;
  late Object bodyStyle;

  /// always | hover | never
  late String shadow;
  WCardProp({
    this.header,
    this.bodyStyle = const {'padding': '20px'},
    this.shadow = 'always',
  });
}

class WCardSlot extends BaseSlot {
  Widget? header;
  WCardSlot(defaultSlotBefore, {this.header}) : super(defaultSlotBefore);
}
