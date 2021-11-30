import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WBreadcrumb extends StatelessWidget
    implements BaseWidget<WBreadcrumbOn, WBreadcrumbProp, WBreadcrumbSlot> {
  @override
  late WBreadcrumbOn $on;

  @override
  late WBreadcrumbProp $props;

  @override
  late WBreadcrumbSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WBreadcrumbOn extends BaseOn {}

class WBreadcrumbProp extends BaseProp {}

class WBreadcrumbSlot extends BaseSlot {}
