import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class WSubmenu extends StatefulWidget
    with
        HasRootMenu,
        BaseMixins<WSubmenuOn, WSubmenuProp, WSubmenuSlot, WSubmenuStyle> {
  late AnimationController expandController;
  late Animation<double> itemsPanelHeight;

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

  @override
  List<SlotTranslator> get slotTranslatorsCustom {
    return [
      SlotTranslator(WSubmenu, injectRootMenu),
      SlotTranslator(WMenuItemGroup, injectRootMenu),
      SlotTranslator(WMenuItem, injectRootMenu),
      SlotTranslator(String, (slot, i, conponent) {
        return Text(
          slot,
          style: TextStyle(color: rootMenu?.$style.color),
        );
      }),
    ];
  }

  double get lineHeight {
    return 60;
  }
}

class _WSubmenuState extends State<WSubmenu> with TickerProviderStateMixin {
  Function(void Function())? panelSetState;
  BuildContext? panelContext;
  late OverlayEntry panelOverlay;

  @override
  void initState() {
    widget.expandController =
        AnimationController(vsync: this, duration: CfgGlobal.duration);
    widget.itemsPanelHeight = Tween(begin: 0.0, end: 200.0)
        .animate(widget.expandController)
      ..addListener(updateView);
    super.initState();
  }

  updateView() => setState(() {});

  @override
  void dispose() {
    widget.expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return title;
  }

  double get panelBorder {
    return widget.$style.panelBorder ?? cfgGlobal.submenu.panelBorder ?? 1;
  }

  Widget get panelInside {
    return SizedBox(
      child: widget.$col,
    );
  }

  Widget get title {
    widget.$slots.title?.rootMenu = widget.rootMenu;
    if (widget.$slots.title != null) {
      if (widget.$slots.title is WMenuItem) {
        widget.$slots.title!.$slots.suffix =
            widget.$slots.title!.$slots.suffix ?? Icons.expand_more;
        widget.$slots.title!.rootMenu = widget.rootMenu;
        widget.$slots.title!.belongTo = widget;
      }
      return widget.$slots.title!;
    } else {
      return const Text('');
    }
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
  WMenuItem? title;
  // Widget Function(WSubmenu)? titleBuild;
  WSubmenuSlot(
    defaultSlotBefore, {
    this.title,
    // this.titleBuild,
  }) : super(defaultSlotBefore);
}
