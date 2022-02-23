import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WBacktop extends StatelessWidget
    with BaseMixins<WBacktopOn, WBacktopProp, WBacktopSlot, WBacktopStyle> {
  WBacktop({
    Key? key,
    WBacktopOn? on,
    WBacktopProp? props,
    WBacktopSlot? slots,
    WBacktopStyle? style,
  }) : super(key: key) {
    $on = on ?? WBacktopOn();
    $props = props ?? WBacktopProp();
    $slots = slots ?? WBacktopSlot(null);
    $style = style ?? WBacktopStyle();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WBacktopOn extends BaseOn {
  late Function()? click;
  WBacktopOn({this.click});
}

class WBacktopProp extends BaseProp {
  late String? target;
  late double visibilityHeight;
  late double right;
  late double bottom;
  WBacktopProp({
    this.target,
    this.visibilityHeight = 200.0,
    this.right = 40.0,
    this.bottom = 40.0,
  });
}

class WBacktopSlot extends BaseSlot {
  WBacktopSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
