import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/states/global_states.dart';
import 'package:wao_ui/src/others/w_popup.dart';
import 'package:wao_ui/wao_ui.dart';

import '../../mixins/has_overlay_mixin.dart';

class WSubmenu extends WStatefulWidget<WSubmenuOn, WSubmenuProp, WSubmenuSlot,
    WSubmenuStyle> with HasRootMenu {
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
  late GlobalKey childrenKey;
  @override
  get $childrenKey {
    return childrenKey;
  }

  @override
  State<WSubmenu> createState() => _WSubmenuState();

  @override
  bool get useBox => false;

  @override
  List<SlotTranslator> get slotTranslatorsCustom {
    return [
      SlotTranslator(WSubmenu, injectRootMenu),
      SlotTranslator(WMenuItemGroup, (s, i, c, l) {
        s as WMenuItemGroup;
        s.$props.needDivider = i != 0;
        return injectRootMenu(s, i, c, l);
      }),
      SlotTranslator(WMenuItem, injectRootMenu),
      SlotTranslator(String, (slot, i, component, len) {
        return Text(
          slot,
          style: TextStyle(color: rootMenu?.style.color),
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
  Animation<double>? itemsPanelHeight;
  late GlobalKey submenuKey;

  bool isHover = false;

  @override
  GlobalKey get triggerWidgetKey {
    return submenuKey;
  }

  @override
  void initState() {
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemsPanelController =
          AnimationController(vsync: this, duration: CfgGlobal.duration);
      setState(() {
        itemsPanelHeight = Tween(
          begin: 0.0,
          end: (widget.childrenKey.currentContext)?.size?.height ?? 700.0,
        ).animate(itemsPanelController)
          ..addListener(updateView);
      });

      setAnimationWhenInit();
      doOpen();
    });

    super.initState();
  }

  doOpen() {
    bool isOpen =
        widget.menuState?.openeds.value.contains(widget.$props.index) ?? false;
    if (isOpen) {
      itemsPanelController.forward();
    }
  }

  @override
  void dispose() {
    panelOverlay?.dispose();
    itemsPanelController.dispose();
    panelController.reverse();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget wbuild(BuildContext context) {
    widget.childrenKey = GlobalKey();
    submenuKey = GlobalKey();
    return Column(
      key: submenuKey,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null) widget.boxWrapper(title!, context),
        if (!widget.useOverlay)
          SingleChildScrollView(
            child: FractionallySizedBox(
              widthFactor: 1,
              child: widget.$col,
            ),
          ),
      ],
    );
  }

  @override
  Border get panelBorder {
    return widget.style.panel?.border ?? Border.all(width: 1);
  }

  Widget? get title {
    widget.$slots.title?.menuKey = widget.menuKey;
    if (widget.$slots.title != null) {
      if (widget.$slots.title is WMenuItem) {
        WMenuItem _title = widget.$slots.title!;
        _title
          ..$slots.suffix = _title.$slots.suffix ?? Icons.expand_more
          ..menuKey = widget.menuKey
          ..belongTo = widget.key as GlobalKey;
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
          child: widget.$col,
          onPointerHover: (e) => isHover = true,
          onPointerCancel: (e) => isHover = false,
          onPointerUp: (e) => showSubmenu.value = !showSubmenu.value,
        );
      } else {
        return MouseRegion(
          onEnter: (e) {
            if (widget.rootMenu!.$props.triggerIsHover) {
              showSubmenu.value = true;
            }
          },
          onExit: (e) => showSubmenu.value = false,
          child: widget.$col,
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
