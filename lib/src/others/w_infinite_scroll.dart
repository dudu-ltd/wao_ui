import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WInfiniteScroll extends StatelessWidget
    with
        BaseMixins<WInfiniteScrollOn, WInfiniteScrollProp, WInfiniteScrollSlot,
            WInfiniteScrollStyle> {
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
    init();
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
