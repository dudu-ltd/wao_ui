import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

mixin MenuChildMixin on Widget {
  WMenu? rootMenu = null;
}

class _WMenuState extends State<WMenu> {
  @override
  Widget build(BuildContext context) {
    var child;
    child = ColoredBox(
      color: widget.$props.backgroundColor,
      child: widget.$props.modeIsVertical ? widget.col : widget.row,
    );
    if (widget.$props.modeIsVertical) {
      child = ConstrainedBox(
        constraints: BoxConstraints(minHeight: minHeight),
        child: SizedBox(
          width: width,
          child: child,
        ),
      );
    } else {
      child = FractionallySizedBox(
        widthFactor: 1,
        child: child,
      );
    }
    return borderWrapper(
      child,
      widget.$props.modeIsVertical
          ? Border(
              right:
                  BorderSide(width: 1, color: ColorUtil.hexToColor('#e6e6e6')))
          : Border(
              bottom:
                  BorderSide(width: 1, color: ColorUtil.hexToColor('#e6e6e6'))),
      true,
    );
  }

  double? get width {
    return widget.$style.width ?? cfgGlobal.menu.width;
  }

  double get minHeight {
    return widget.$style.minHeight ?? cfgGlobal.menu.minHeight ?? 0.0;
  }
}

class WMenu extends StatefulWidget
    with BaseMixins<WMenuOn, WMenuProp, WMenuSlot, WMenuStyle> {
  WMenu({
    Key? key,
    WMenuOn? on,
    WMenuProp? props,
    WMenuSlot? slots,
    WMenuStyle? style,
  }) : super(key: key) {
    $on = on ?? WMenuOn();
    $props = props ?? WMenuProp();
    $slots = slots ?? WMenuSlot(null);
    $style = style ?? WMenuStyle();
    init();
  }

  @override
  Map<Type, Function(Widget)> slotTypeHandles() {
    var handles = <Type, Function(Widget)>{};
    $slots.allowSlotTypes.forEach((element) {
      handles[element] = (Widget child) {
        child as MenuChildMixin;
        child.rootMenu = this;
      };
    });
    return handles;
  }

  @override
  State<WMenu> createState() => _WMenuState();
}

class WMenuOn extends BaseOn {
  Function(dynamic, dynamic)? select;
  Function(dynamic, dynamic)? open;
  Function(dynamic, dynamic)? close;
  WMenuOn({
    this.select,
    this.open,
    this.close,
  });
}

class WMenuProp extends BaseProp {
  late String mode;
  late bool collapse;
  late Color backgroundColor;
  late Color textColor;
  late Color activeTextColor;
  late String? defaultActive;
  late String? defaultOpeneds;
  late bool uniqueOpened;
  late String menuTrigger;
  late bool router;
  late bool collapseTransition;

  WMenuProp({
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
  }) {
    this.backgroundColor = ColorUtil.hexToColor(backgroundColor ?? '#FFFFFF');
    this.textColor = ColorUtil.hexToColor(textColor ?? '#303133');
    this.activeTextColor = ColorUtil.hexToColor(activeTextColor ?? '#409EFF');
  }

  bool get modeIsVertical {
    return mode == 'vertical';
  }
}

class WMenuSlot extends BaseSlot {
  WMenuSlot(defaultSlotBefore) : super(defaultSlotBefore);
  @override
  List<Type> allowSlotTypes = [WMenuItem, WSubmenu, WMenuItemGroup];
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
class _WSubmenuState extends State<WSubmenu>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> iconAngle;
  late Animation<double> itemsPanelHeight;

  late ValueNotifier isExpand = ValueNotifier(false);

  Function(void Function())? panelSetState;
  BuildContext? panelContext;
  late OverlayEntry panelOverlay;

  @override
  void initState() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    iconAngle = Tween(begin: 0.0, end: pi).animate(expandController)
      ..addListener(updateView);
    itemsPanelHeight = Tween(begin: 0.0, end: 200.0).animate(expandController)
      ..addListener(updateView);
    valueChangeBind();
    super.initState();
  }

  updateView() => setState(() {});

  valueChangeBind() {
    isExpand.addListener(() {
      if (isExpand.value) {
        Timer(Duration(milliseconds: widget.$props.showTimeout.toInt()), () {
          expandController.forward();
        });
      } else {
        Timer(Duration(milliseconds: widget.$props.hideTimeout.toInt()), () {
          expandController.reverse();
        });
      }
    });
  }

  // showPanelAction() {
  //   OverlayEntry overlayEntry = OverlayEntry(builder: (content) {
  //     return panel;
  //   });
  //   panelOverlay = overlayEntry;
  //   Overlay.of(context)?.insert(overlayEntry);
  // }

  @override
  void dispose() {
    expandController.dispose();
    isExpand.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var box = SizedBox(
      height: widget.lineHeight,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: Align(
          child: Row(
            children: [
              widget.title,
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Transform.rotate(
                  angle: iconAngle.value,
                  child: const Icon(
                    Icons.expand_more,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          alignment: Alignment.center,
        ),
      ),
    );

    // if( widget.)

    return MouseRegion(
      onEnter: (event) => isExpand.value = true,
      onExit: (event) => isExpand.value = false,
      child: box,
    );
  }

  double get panelBorder {
    return widget.$style.panelBorder ?? cfgGlobal.submenu.panelBorder ?? 1;
  }

  Widget get panelInside {
    return SizedBox(
      child: widget.col,
    );
  }
}

class WSubmenu extends StatefulWidget
    with
        BaseMixins<WSubmenuOn, WSubmenuProp, WSubmenuSlot, WSubmenuStyle>,
        MenuChildMixin {
  WSubmenu({
    Key? key,
    WSubmenuOn? on,
    WSubmenuProp? props,
    WSubmenuSlot? slots,
    WSubmenuStyle? style,
  }) : super(key: key) {
    $on = on ?? WSubmenuOn();
    $props = props ?? WSubmenuProp();
    $slots = slots ?? WSubmenuSlot(null);
    $style = style ?? WSubmenuStyle();
    init();
  }

  @override
  State<WSubmenu> createState() => _WSubmenuState();

  Widget get title {
    return $slots.title ?? Text('');
  }

  double get lineHeight {
    return 60;
  }
}

class WSubmenuOn extends BaseOn {}

class WSubmenuProp extends BaseProp {
  late String? index;
  late String? popperClass;
  late num showTimeout;
  late num hideTimeout;
  late bool disabled;
  late bool popperAppendToBody;
  WSubmenuProp({
    this.index,
    this.popperClass,
    this.showTimeout = 300,
    this.hideTimeout = 300,
    this.disabled = false,
    this.popperAppendToBody = false,
  });
}

class WSubmenuSlot extends BaseSlot {
  Widget? title;
  WSubmenuSlot(defaultSlotBefore, {this.title}) : super(defaultSlotBefore);
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
    with
        BaseMixins<WMenuItemOn, WMenuItemProp, WMenuItemSlot, WMenuItemStyle>,
        MenuChildMixin {
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
    init();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: lineHeight,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: Align(
          child: Row(
            children: [
              col,
              if ($slots.title != null) $slots.title!,
            ],
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }

  @override
  setDefaultSlotSub() {
    if ($slots.defaultSlotBefore is String) {
      // var w = slotToWidget($slots.defaultSlotBefore);
      return [
        Text(
          $slots.defaultSlotBefore,
          style: TextStyle(
            color: rootMenu?.$props.textColor,
          ),
        )
      ];
    }
    return [];
  }

  double get lineHeight {
    return 60;
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
  Widget? title;
  WMenuItemSlot(
    defaultSlotBefore, {
    this.title,
  }) : super(defaultSlotBefore);
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
class WMenuItemGroup extends StatelessWidget
    with
        BaseMixins<WMenuItemGroupOn, WMenuItemGroupProp, WMenuItemGroupSlot,
            WMenuItemGroupStyle>,
        MenuChildMixin {
  WMenuItemGroup({
    Key? key,
    WMenuItemGroupOn? on,
    WMenuItemGroupProp? props,
    WMenuItemGroupSlot? slots,
    WMenuItemGroupStyle? style,
  }) : super(key: key) {
    $on = on ?? WMenuItemGroupOn();
    $props = props ?? WMenuItemGroupProp();
    $slots = slots ?? WMenuItemGroupSlot(null);
    $style = style ?? WMenuItemGroupStyle();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: lineHeight,
          child: Align(
            child: title,
            alignment: Alignment.center,
          ),
        ),
        // $slots.col,
      ],
    );
    // return Column(
    //   children: [
    //     title,
    //     $slots.col,
    //   ],
    // );
  }

  Widget get title {
    return $slots.title ?? Text($props.title ?? '');
  }

  double get lineHeight {
    return 60;
  }
}

class WMenuItemGroupOn extends BaseOn {}

class WMenuItemGroupProp extends BaseProp {
  String? title;
  WMenuItemGroupProp({this.title});
}

class WMenuItemGroupSlot extends BaseSlot {
  Widget? title;
  WMenuItemGroupSlot(defaultSlotBefore, {this.title})
      : super(defaultSlotBefore);
}
