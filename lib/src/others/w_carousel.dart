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

class WCarouselOn extends BaseOn {
  Function(int, int)? change;
}

class WCarouselProp extends BaseProp {
  late String? height;
  late int initialIndex;
  late String trigger;
  late bool autoplay;
  late double interval;
  late String indicatorPosition;
  late String arrow;
  late String type;
  late bool loop;
  late Axis direction;

  WCarouselProp({
    this.height,
    this.initialIndex = 0,
    this.trigger = 'click',
    this.autoplay = true,
    this.interval = 3000,
    this.indicatorPosition = 'none',
    this.arrow = 'hover',
    this.type = 'card',
    this.loop = true,
    this.direction = Axis.horizontal,
  });
}

class WCarouselSlot extends BaseSlot {
  WCarouselSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WCarouselItem extends StatelessWidget
    implements
        BaseWidget<WCarouselItemOn, WCarouselItemProp, WCarouselItemSlot,
            WCarouselItemStyle> {
  @override
  late final WCarouselItemOn $on;

  @override
  late final WCarouselItemProp $props;

  @override
  late final WCarouselItemSlot $slots;

  @override
  late final WCarouselItemStyle $style;

  WCarouselItem({
    Key? key,
    WCarouselItemOn? on,
    WCarouselItemProp? props,
    WCarouselItemSlot? slots,
    WCarouselItemStyle? style,
  }) : super(key: key) {
    $on = on ?? WCarouselItemOn();
    $props = props ?? WCarouselItemProp();
    $slots = slots ?? WCarouselItemSlot(null);
    $style = style ?? WCarouselItemStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCarouselItemOn extends BaseOn {}

class WCarouselItemProp extends BaseProp {
  late String? name;
  late String? label;
  WCarouselItemProp({this.name, this.label});
}

class WCarouselItemSlot extends BaseSlot {
  WCarouselItemSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
