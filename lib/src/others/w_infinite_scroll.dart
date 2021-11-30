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
  late WInfiniteScrollOn $on;

  @override
  late WInfiniteScrollProp $props;

  @override
  late WInfiniteScrollSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WInfiniteScrollOn extends BaseOn {}

class WInfiniteScrollProp extends BaseProp {}

class WInfiniteScrollSlot extends BaseSlot {}
