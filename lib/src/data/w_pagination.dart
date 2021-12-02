import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WPagination extends StatelessWidget
    implements BaseWidget<WPaginationOn, WPaginationProp, WPaginationSlot> {
  @override
  late final WPaginationOn $on;

  @override
  late final WPaginationProp $props;

  @override
  late final WPaginationSlot $slots;

  WPagination({
    Key? key,
    WPaginationOn? on,
    WPaginationProp? props,
    WPaginationSlot? slots,
  }) : super(key: key) {
    $on = on ?? WPaginationOn();
    $props = props ?? WPaginationProp();
    $slots = slots ?? WPaginationSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WPaginationOn extends BaseOn {}

class WPaginationProp extends BaseProp {}

class WPaginationSlot extends BaseSlot {}
