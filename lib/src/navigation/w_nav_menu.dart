import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WNavMenu extends StatelessWidget
    implements
        BaseWidget<WNavMenuOn, WNavMenuProp, WNavMenuSlot, WNavMenuStyle> {
  @override
  late final WNavMenuOn $on;
  @override
  late final WNavMenuProp $props;
  @override
  late final WNavMenuSlot $slots;
  @override
  late WNavMenuStyle $style;

  WNavMenu({
    Key? key,
    WNavMenuOn? on,
    WNavMenuProp? props,
    WNavMenuSlot? slots,
    WNavMenuStyle? style,
  }) : super(key: key) {
    $on = on ?? WNavMenuOn();
    $props = props ?? WNavMenuProp();
    $slots = slots ?? WNavMenuSlot(null);
    $style = style ?? WNavMenuStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WNavMenuOn extends BaseOn {}

class WNavMenuProp extends BaseProp {
  late String mode;
  late bool collapse;
  late String backgroundColor;
  late String textColor;
  late String activeTextColor;
  late String? defaultActive;
  late String? defaultOpeneds;
  late bool uniqueOpened;
  late String menuTrigger;
  late bool router;
  late bool collapseTransition;

  WNavMenuProp({
    this.mode = 'vertical',
    this.collapse = false,
    String? backgroundColor,
    String? textColor,
    String? activeTextColor,
    this.defaultActive,
    this.defaultOpeneds,
    this.uniqueOpened = false,
    this.menuTrigger = 'hover',
    this.router = false,
    this.collapseTransition = true,
  });
}

class WNavMenuSlot extends BaseSlot {
  WNavMenuSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

///
///
///
///
///
///
///
///
///
class WSubMenu extends StatelessWidget
    implements
        BaseWidget<WSubMenuOn, WSubMenuProp, WSubMenuSlot, WSubMenuStyle> {
  @override
  late final WSubMenuOn $on;

  @override
  late final WSubMenuProp $props;

  @override
  late final WSubMenuSlot $slots;

  @override
  late final WSubMenuStyle $style;

  WSubMenu({
    Key? key,
    WSubMenuOn? on,
    WSubMenuProp? props,
    WSubMenuSlot? slots,
    WSubMenuStyle? style,
  }) : super(key: key) {
    $on = on ?? WSubMenuOn();
    $props = props ?? WSubMenuProp();
    $slots = slots ?? WSubMenuSlot(null);
    $style = style ?? WSubMenuStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WSubMenuOn extends BaseOn {}

class WSubMenuProp extends BaseProp {
  late String? index;
  late String? popperClass;
  late num showTimeout;
  late num hideTimeout;
  late bool disabled;
  late bool popperAppendToBody;
  WSubMenuProp({
    this.index,
    this.popperClass,
    this.showTimeout = 300,
    this.hideTimeout = 300,
    this.disabled = false,
    this.popperAppendToBody = false,
  });
}

class WSubMenuSlot extends BaseSlot {
  WSubMenuSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

///
///
///
///
///
///
///
///
///
class WMenuItem extends StatelessWidget
    implements
        BaseWidget<WMenuItemOn, WMenuItemProp, WMenuItemSlot, WMenuItemStyle> {
  @override
  late final WMenuItemOn $on;

  @override
  late final WMenuItemProp $props;

  @override
  late final WMenuItemSlot $slots;

  @override
  late final WMenuItemStyle $style;

  WMenuItem({
    Key? key,
    WMenuItemOn? on,
    WMenuItemProp? props,
    WMenuItemSlot? slots,
    WMenuItemStyle? style,
  }) : super(key: key) {
    $on = on ?? WMenuItemOn();
    $props = props ?? WMenuItemProp();
    $slots = slots ?? WMenuItemSlot(null);
    $style = style ?? WMenuItemStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WMenuItemOn extends BaseOn {}

class WMenuItemProp extends BaseProp {
  String? index;
  dynamic route;
  late bool disabled;
  WMenuItemProp({
    this.index,
    this.route,
    this.disabled = false,
  });
}

class WMenuItemSlot extends BaseSlot {
  WMenuItemSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

///
///
///
///
///
///
///
///
///
class WMenuGroup extends StatelessWidget
    implements
        BaseWidget<WMenuGroupOn, WMenuGroupProp, WMenuGroupSlot,
            WMenuGroupStyle> {
  @override
  late final WMenuGroupOn $on;

  @override
  late final WMenuGroupProp $props;

  @override
  late final WMenuGroupSlot $slots;

  @override
  late final WMenuGroupStyle $style;

  WMenuGroup({
    Key? key,
    WMenuGroupOn? on,
    WMenuGroupProp? props,
    WMenuGroupSlot? slots,
    WMenuGroupStyle? style,
  }) : super(key: key) {
    $on = on ?? WMenuGroupOn();
    $props = props ?? WMenuGroupProp();
    $slots = slots ?? WMenuGroupSlot(null);
    $style = style ?? WMenuGroupStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WMenuGroupOn extends BaseOn {}

class WMenuGroupProp extends BaseProp {
  String? title;
  WMenuGroupProp({this.title});
}

class WMenuGroupSlot extends BaseSlot {
  WMenuGroupSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
