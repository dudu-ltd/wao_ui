import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WCarousel extends StatelessWidget
    implements
        BaseWidget<WCarouselOn, WCarouselProp, WCarouselSlot, WCarouselStyle> {
  @override
  late final WCarouselOn $on;
  @override
  late final WCarouselProp $props;
  @override
  late final WCarouselSlot $slots;
  @override
  late WCarouselStyle $style;

  WCarousel({
    Key? key,
    WCarouselOn? on,
    WCarouselProp? props,
    WCarouselSlot? slots,
    WCarouselStyle? style,
  }) : super(key: key) {
    $on = on ?? WCarouselOn();
    $props = props ?? WCarouselProp();
    $slots = slots ?? WCarouselSlot(null);
    $style = style ?? WCarouselStyle();
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
