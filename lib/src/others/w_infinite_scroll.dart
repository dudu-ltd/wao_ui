import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WInfiniteScroll extends StatelessWidget
    implements
        BaseWidget<WInfiniteScrollOn, WInfiniteScrollProp,
            WInfiniteScrollSlot> {
  @override
  late final WInfiniteScrollOn $on;

  @override
  late final WInfiniteScrollProp $props;

  @override
  late final WInfiniteScrollSlot $slots;

  WInfiniteScroll({
    Key? key,
    WInfiniteScrollOn? on,
    WInfiniteScrollProp? props,
    WInfiniteScrollSlot? slots,
  }) : super(key: key) {
    $on = on ?? WInfiniteScrollOn();
    $props = props ?? WInfiniteScrollProp();
    $slots = slots ?? WInfiniteScrollSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WInfiniteScrollOn extends BaseOn {}

class WInfiniteScrollProp extends BaseProp {}

class WInfiniteScrollSlot extends BaseSlot {
  WInfiniteScrollSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
