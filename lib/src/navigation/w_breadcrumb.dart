import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WBreadcrumb extends StatelessWidget
    implements BaseWidget<WBreadcrumbOn, WBreadcrumbProp, WBreadcrumbSlot> {
  @override
  late final WBreadcrumbOn $on;

  @override
  late final WBreadcrumbProp $props;

  @override
  late final WBreadcrumbSlot $slots;

  WBreadcrumb({
    Key? key,
    WBreadcrumbOn? on,
    WBreadcrumbProp? props,
    WBreadcrumbSlot? slots,
  }) : super(key: key) {
    $on = on ?? WBreadcrumbOn();
    $props = props ?? WBreadcrumbProp();
    $slots = slots ?? WBreadcrumbSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WBreadcrumbOn extends BaseOn {}

class WBreadcrumbProp extends BaseProp {}

class WBreadcrumbSlot extends BaseSlot {}
