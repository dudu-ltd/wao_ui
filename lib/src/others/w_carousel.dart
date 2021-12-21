import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WCarousel extends StatelessWidget
    implements BaseWidget<WCarouselOn, WCarouselProp, WCarouselSlot> {
  @override
  late final WCarouselOn $on;

  @override
  late final WCarouselProp $props;

  @override
  late final WCarouselSlot $slots;

  WCarousel({
    Key? key,
    WCarouselOn? on,
    WCarouselProp? props,
    WCarouselSlot? slots,
  }) : super(key: key) {
    $on = on ?? WCarouselOn();
    $props = props ?? WCarouselProp();
    $slots = slots ?? WCarouselSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCarouselOn extends BaseOn {}

class WCarouselProp extends BaseProp {}

class WCarouselSlot extends BaseSlot {
  WCarouselSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
