import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

import '../../mixins/has_overlay_mixin.dart';

class WSubmenu extends WStatefulWidget<WSubmenuOn, WSubmenuProp, WSubmenuSlot,
    WSubmenuStyle> with HasRootMenu {
  late GlobalKey childrenKey;

  late GlobalKey submenuKey;

  _WSubmenuState? state;

  @override
  get $childrenKey {
    return childrenKey;
  }

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
      SlotTranslator(String, (slot, i, component, len) {
        return Text(
          slot,
          style: TextStyle(color: rootMenu?.$style.color),
        );
      }),
    ];
  }
}

class _WSubmenuState extends WState<WSubmenu>
    with TickerProviderStateMixin, HasOverlayMixin, WidgetsBindingObserver {
  // late AnimationController expandController;
  late ValueNotifier<bool> showSubmenu = ValueNotifier(false);
  late AnimationController itemsPanelController;
  late Animation<double> itemsPanelHeight;

  @override
  GlobalKey get triggerWidgetKey {
    return widget.submenuKey;
  }

  @override
  void initState() {
    widget.state = this;
    showSubmenu.addListener(() {
      if (widget.useOverlay) {
        if (showSubmenu.value) {
          showPanelAction();
        } else {
          hidePanelAction();
        }
      } else {
        if (showSubmenu.value) {
          itemsPanelController.forward();
        } else {
          itemsPanelController.reverse();
        }
      }
    });
    itemsPanelController =
        AnimationController(vsync: this, duration: CfgGlobal.duration);
    itemsPanelHeight = Tween(end: 0.0, begin: 700.0)
        .animate(itemsPanelController)
      ..addListener(updateView);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        itemsPanelHeight = Tween(
          begin: 0.0,
          end: (widget.childrenKey.currentContext)?.size?.height ?? 700.0,
        ).animate(itemsPanelController)
          ..addListener(updateView);
      });

      doOpen();
    });
    setAnimationWhenInit();
    super.initState();
  }

  doOpen() {
    bool isOpen =
        widget.rootMenu?.openeds.value.contains(widget.$props.index) ?? false;
    if (isOpen) {
      itemsPanelController.forward();
    }
  }

  updateView() => setState(() {});

  @override
  void dispose() {
    var nav = Navigator.of(context);
    if (nav.canPop()) nav.pop();
    panelOverlay?.dispose();
    itemsPanelController.dispose();
    panelController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget wbuild(BuildContext context) {
    widget.childrenKey = GlobalKey();
    widget.submenuKey = GlobalKey();

    return Column(
      key: widget.submenuKey,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (title != null) title!,
        if (!widget.useOverlay)
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: itemsPanelHeight.value),
            child: SingleChildScrollView(
              child: FractionallySizedBox(
                widthFactor: 1,
                child: widget.$col,
              ),
            ),
          ),
      ],
    );
  }

  @override
  double get panelBorder {
    return widget.$style.panelBorder ?? cfgGlobal.submenu.panelBorder ?? 1;
  }

  Widget? get title {
    widget.$slots.title?.rootMenu = widget.rootMenu;
    if (widget.$slots.title != null) {
      if (widget.$slots.title is WMenuItem) {
        WMenuItem _title = widget.$slots.title!;
        // var
        _title
          ..$slots.suffix = _title.$slots.suffix ?? Icons.expand_more
          ..rootMenu = widget.rootMenu
          ..belongTo = widget;
      }
      return widget.$slots.title;
    } else {
      return const Text('');
    }
  }

  @override
  Widget get panelInside {
    if (widget.useOverlay) {
      if (widget.rootMenu!.$props.triggerIsClick) {
        return Listener(
          child: SingleChildScrollView(child: widget.$col),
          onPointerUp: (e) => showSubmenu.value = !showSubmenu.value,
        );
      } else {
        return SizedBox(
          child: MouseRegion(
            onEnter: (e) {
              if (widget.rootMenu!.$props.triggerIsHover) {
                showSubmenu.value = true;
              }
            },
            onExit: (e) => showSubmenu.value = false,
            child: SingleChildScrollView(child: widget.$col),
          ),
        );
      }
    } else {
      return Container();
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
