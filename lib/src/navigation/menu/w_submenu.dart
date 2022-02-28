import 'dart:async';
import 'dart:math';

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
  late AnimationController bgController;
  late Animation<double> iconAngle;
  late Animation<double> itemsPanelHeight;

  late Animation<Color?> bgColor;

  late ValueNotifier isExpand = ValueNotifier(false);
  late ValueNotifier isHover = ValueNotifier(false);

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
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widget.bgController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widget.iconAngle = Tween(begin: 0.0, end: pi)
        .animate(widget.expandController)
      ..addListener(updateView);
    widget.itemsPanelHeight = Tween(begin: 0.0, end: 200.0)
        .animate(widget.expandController)
      ..addListener(updateView);
    widget.bgColor = ColorTween(
            begin: widget.rootMenu?.$style.backgroundColor,
            end: widget.rootMenu?.$style.hoverBackgroundColor)
        .animate(widget.bgController)
      ..addListener(updateView);
    valueChangeBind();
    super.initState();
  }

  updateView() => setState(() {});

  valueChangeBind() {
    widget.rootMenu?.collapse.addListener(updateView);
    widget.isHover.addListener(() {
      if (widget.isHover.value) {
        widget.bgController.forward();
      } else {
        widget.bgController.reverse();
      }
    });
    widget.isExpand.addListener(() {
      if (widget.isExpand.value) {
        Timer(Duration(milliseconds: widget.$props.showTimeout.toInt()), () {
          widget.expandController.forward();
        });
      } else {
        Timer(Duration(milliseconds: widget.$props.hideTimeout.toInt()), () {
          widget.expandController.reverse();
        });
      }
    });
  }

  @override
  void dispose() {
    widget.expandController.dispose();
    widget.bgController.dispose();
    widget.isExpand.dispose();
    widget.isHover.dispose();
    super.dispose();
  }

  pointEnter(e) {
    if (expandOnHover) widget.isExpand.value = true;
    widget.isHover.value = true;
  }

  pointExit(e) {
    if (expandOnHover) widget.isExpand.value = false;
    widget.isHover.value = false;
  }

  pointClick() {
    widget.isExpand.value = !widget.isExpand.value;
  }

  bool get expandOnHover {
    return widget.rootMenu != null &&
        widget.rootMenu!.$props.modeIsHorizontal &&
        widget.rootMenu!.$props.triggerIsHover;
  }

  @override
  Widget build(BuildContext context) {
    var box = ColoredBox(
      color: widget.bgColor.value ??
          widget.rootMenu?.$style.backgroundColor ??
          Colors.white.withAlpha(0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: SizedBox(
          height: widget.lineHeight,
          child: Align(
            child: Row(
              children: [
                titleContent,
                if (!widget.rootMenu!.collapse.value)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Transform.rotate(
                      angle: widget.iconAngle.value,
                      child: Icon(
                        Icons.expand_more,
                        size: 16,
                        color: widget.rootMenu?.$style.color,
                      ),
                    ),
                  ),
              ],
            ),
            alignment: Alignment.center,
          ),
        ),
      ),
    );

    return MouseRegion(
      onEnter: pointEnter,
      onExit: pointExit,
      child: InkWell(
        child: box,
        onTap: pointClick,
      ),
    );
  }

  double get panelBorder {
    return widget.$style.panelBorder ?? cfgGlobal.submenu.panelBorder ?? 1;
  }

  Widget get panelInside {
    return SizedBox(
      child: widget.$col,
    );
  }

  Widget get titleContent {
    return widget.rootMenu != null && widget.rootMenu!.$props.modeIsVertical
        ? Expanded(child: title)
        : title;
  }

  Widget get title {
    widget.$slots.title?.rootMenu = widget.rootMenu;
    if (widget.$slots.title != null) {
      widget.$slots.title!.$style.padding = EdgeInsets.zero;
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
