import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WPagination extends StatelessWidget
    implements BaseWidget<WPaginationOn, WPaginationProp, WPaginationSlot> {
  @override
  late WPaginationOn $on;

  @override
  late WPaginationProp $props;

  @override
  late WPaginationSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WPaginationOn extends BaseOn {}

class WPaginationProp extends BaseProp {}

class WPaginationSlot extends BaseSlot {}
