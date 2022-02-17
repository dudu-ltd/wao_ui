import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WDrawer extends StatelessWidget
    implements BaseWidget<WDrawerOn, WDrawerProp, WDrawerSlot, WDrawerStyle> {
  @override
  late final WDrawerOn $on;
  @override
  late final WDrawerProp $props;
  @override
  late final WDrawerSlot $slots;
  @override
  late WDrawerStyle $style;

  WDrawer({
    Key? key,
    WDrawerOn? on,
    WDrawerProp? props,
    WDrawerSlot? slots,
    WDrawerStyle? style,
  }) : super(key: key) {
    $on = on ?? WDrawerOn();
    $props = props ?? WDrawerProp();
    $slots = slots ?? WDrawerSlot(null);
    $style = style ?? WDrawerStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WDrawerOn extends BaseOn {}

class WDrawerProp extends BaseProp {
  late bool appendToBody;
  Function(dynamic)? beforeClose;
  late bool closeOnPressEscape;
  late String? customClass;
  late bool destroyOnClose;
  late bool modal;
  late bool modalAppendToBody;
  late String direction;
  late bool showClose;
  late String size;
  late String? title;
  late bool visible;
  late bool wrapperClosable;
  late bool withHeader;
  WDrawerProp({
    this.appendToBody = false,
    this.beforeClose,
    this.closeOnPressEscape = true,
    this.customClass,
    this.destroyOnClose = false,
    this.modal = true,
    this.modalAppendToBody = true,
    this.direction = 'rtl',
    this.showClose = true,
    this.size = '30%',
    this.title,
    this.visible = false,
    this.wrapperClosable = true,
    this.withHeader = true,
  });
}

class WDrawerSlot extends BaseSlot {
  WDrawerSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
