import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WCarousel extends StatelessWidget
    implements BaseWidget<WCarouselOn, WCarouselProp, WCarouselSlot> {
  @override
  late WCarouselOn $on;

  @override
  late WCarouselProp $props;

  @override
  late WCarouselSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCarouselOn extends BaseOn {}

class WCarouselProp extends BaseProp {}

class WCarouselSlot extends BaseSlot {}
