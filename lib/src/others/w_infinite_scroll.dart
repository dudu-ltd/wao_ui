import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WInfiniteScroll extends StatelessWidget
    implements
        BaseWidget<WInfiniteScrollOn, WInfiniteScrollProp, WInfiniteScrollSlot,
            WInfiniteScrollStyle> {
  @override
  late final WInfiniteScrollOn $on;
  @override
  late final WInfiniteScrollProp $props;
  @override
  late final WInfiniteScrollSlot $slots;
  @override
  late WInfiniteScrollStyle $style;

  WInfiniteScroll({
    Key? key,
    WInfiniteScrollOn? on,
    WInfiniteScrollProp? props,
    WInfiniteScrollSlot? slots,
    WInfiniteScrollStyle? style,
  }) : super(key: key) {
    $on = on ?? WInfiniteScrollOn();
    $props = props ?? WInfiniteScrollProp();
    $slots = slots ?? WInfiniteScrollSlot(null);
    $style = style ?? WInfiniteScrollStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WInfiniteScrollOn extends BaseOn {}

class WInfiniteScrollProp extends BaseProp {
  late bool infiniteScrollDisabled;
  late double infiniteScrollDelay;
  late double infiniteScrollDistance;
  late bool infiniteScrollImmediate;
  WInfiniteScrollProp({
    this.infiniteScrollDisabled = false,
    this.infiniteScrollDelay = 200,
    this.infiniteScrollDistance = 0,
    this.infiniteScrollImmediate = true,
  });
}

class WInfiniteScrollSlot extends BaseSlot {
  WInfiniteScrollSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
