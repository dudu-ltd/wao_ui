import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

export 'menu/w_menu_item.dart';
export 'menu/w_menu_item_group.dart';
export 'menu/w_submenu.dart';

mixin HasRootMenu on Widget {
  WMenu? rootMenu = null;

  Widget injectRootMenu(slot, int i, conponent) {
    slot.rootMenu = conponent.rootMenu;
    return slot as Widget;
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
  late ValueNotifier<dynamic> value;
  late ValueNotifier<List<dynamic>> openeds;
  late ValueNotifier<bool> collapse;

  Widget injectRootMenu(slot, int i, conponent) {
    slot.rootMenu = conponent;
    return slot as Widget;
  }

  @override
  List<SlotTranslator> get slotTranslatorsCustom {
    return [
      SlotTranslator(WMenuItem, injectRootMenu),
      SlotTranslator(WSubmenu, injectRootMenu),
      SlotTranslator(WMenuItemGroup, injectRootMenu),
    ];
  }

  @override
  State<WMenu> createState() => _WMenuState();
}

class _WMenuState extends State<WMenu> with SingleTickerProviderStateMixin {
  late AnimationController _widthControl;
  late Animation<dynamic> _width;

  @override
  void initState() {
    bindCollapseHandle();
    bindValueHandle();
    bindOpenedsHandle();
    setAnimations();
  }

  setAnimations() {
    _widthControl = AnimationController(
      duration: CfgGlobal.duration,
      vsync: this,
    );

    _width = (widget.$props.collapse
            ? Tween(begin: 64.0, end: width)
            : Tween(begin: width, end: 64.0))
        .animate(_widthControl)
      ..addListener(updateView);
  }

  updateView() {
    setState(() {});
  }

  bindValueHandle() {
    widget.value = ValueNotifier(widget.$props.defaultActive);
    widget.value.addListener(() {
      widget.$props.defaultActive = widget.value.value;
      if (widget.value.value != null) {
        if (widget.$props.uniqueOpened &&
            !widget.openeds.value.contains(widget.value.value)) {
          widget.openeds.value.add(widget.value.value);
          widget.openeds.notifyListeners();
        }
      }
    });
  }

  bindOpenedsHandle() {
    widget.openeds = ValueNotifier(widget.$props.defaultOpeneds);
    widget.openeds.addListener(() {
      widget.$props.defaultOpeneds = widget.openeds.value;
    });
  }

  bindCollapseHandle() {
    widget.collapse = ValueNotifier(widget.$props.collapse);
    widget.collapse.addListener(() {
      if (widget.collapse.value != widget.$props.collapse) {
        _widthControl.forward();
      } else {
        _widthControl.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var child;
    child = ColoredBox(
      color: background,
      child: widget.$props.modeIsVertical ? widget.$col : widget.$row,
    );
    if (widget.$props.modeIsVertical) {
      child = ConstrainedBox(
        constraints: BoxConstraints(minHeight: minHeight),
        child: SizedBox(
          width: _width.value,
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
    return widget.collapse.value
        ? 0
        : widget.$style.minHeight ?? cfgGlobal.menu.minHeight ?? 0.0;
  }

  Color get background {
    return widget.$style.backgroundColor ??
        cfgGlobal.menu.backgroundColor ??
        Colors.white;
  }
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
  late ValueNotifier value;
  late String mode;
  late bool collapse;
  // @Deprecated('请使用 \$style.backgroundColor 进行控制')
  // late Color backgroundColor;
  // @Deprecated('请使用 \$style.color 进行控制')
  // late Color textColor;
  // @Deprecated('请使用 \$style.activeColor 进行控制')
  // late Color activeTextColor;
  late String? defaultActive;
  late List<dynamic> defaultOpeneds;
  late bool uniqueOpened;
  late String menuTrigger;
  late bool router;
  late bool collapseTransition;

  WMenuProp({
    this.mode = 'vertical',
    this.collapse = false,
    @Deprecated('请使用 style.backgroundColor 进行控制') String? backgroundColor,
    @Deprecated('请使用 style.color 进行控制') String? textColor,
    @Deprecated('请使用 style.activeColor 进行控制') String? activeTextColor,
    this.defaultActive,
    this.defaultOpeneds = const <String>[],
    this.uniqueOpened = false,
    this.menuTrigger = 'hover',
    this.router = false,
    this.collapseTransition = true,
  }) {
    // this.backgroundColor = ColorUtil.hexToColor(backgroundColor ?? '#FFFFFF');
    // this.textColor = ColorUtil.hexToColor(textColor ?? '#303133');
    // this.activeTextColor = ColorUtil.hexToColor(activeTextColor ?? '#409EFF');
  }

  bool get modeIsVertical {
    return mode == 'vertical';
  }

  bool get modeIsHorizontal {
    return mode == 'horizontal';
  }

  bool get triggerIsHover {
    return menuTrigger == 'hover';
  }

  bool get triggerIsClick {
    return menuTrigger == 'click';
  }
}

class WMenuSlot extends BaseSlot {
  WMenuSlot(defaultSlotBefore) : super(defaultSlotBefore);
  @override
  List<Type> allowSlotTypes = [WMenuItem, WSubmenu, WMenuItemGroup];
}
