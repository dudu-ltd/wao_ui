import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WCollapse extends StatelessWidget
    implements
        BaseWidget<WCollapseOn, WCollapseProp, WCollapseSlot, WCollapseStyle> {
  @override
  late final WCollapseOn $on;
  @override
  late final WCollapseProp $props;
  @override
  late final WCollapseSlot $slots;
  @override
  late WCollapseStyle $style;

  WCollapse({
    Key? key,
    WCollapseOn? on,
    WCollapseProp? props,
    WCollapseSlot? slots,
    WCollapseStyle? style,
  }) : super(key: key) {
    $on = on ?? WCollapseOn();
    $props = props ?? WCollapseProp();
    $slots = slots ?? WCollapseSlot(null);
    $style = style ?? WCollapseStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCollapseOn extends BaseOn {
  Function(dynamic)? change;
  WCollapseOn({this.change});
}

class WCollapseProp extends BaseProp {
  late dynamic value;

  late bool accordion;

  WCollapseProp({this.value, this.accordion = false});
}

class WCollapseSlot extends BaseSlot {
  WCollapseSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

///
///
///
///
///
///
///
///
///
///
class WCollapseItem extends StatelessWidget
    implements
        BaseWidget<WCollapseItemOn, WCollapseItemProp, WCollapseItemSlot,
            WCollapseItemStyle> {
  @override
  late final WCollapseItemOn $on;

  @override
  late final WCollapseItemProp $props;

  @override
  late final WCollapseItemSlot $slots;

  @override
  late final WCollapseItemStyle $style;

  WCollapseItem({
    Key? key,
    WCollapseItemOn? on,
    WCollapseItemProp? props,
    WCollapseItemSlot? slots,
    WCollapseItemStyle? style,
  }) : super(key: key) {
    $on = on ?? WCollapseItemOn();
    $props = props ?? WCollapseItemProp();
    $slots = slots ?? WCollapseItemSlot(null);
    $style = style ?? WCollapseItemStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCollapseItemOn extends BaseOn {}

class WCollapseItemProp extends BaseProp {
  late dynamic name;
  late String title;
  late bool disabled;
  WCollapseItemProp({this.name, this.title = '', this.disabled = false});
}

class WCollapseItemSlot extends BaseSlot {
  Widget Function(dynamic)? title;
  WCollapseItemSlot(defaultSlotBefore, {this.title}) : super(defaultSlotBefore);
}
