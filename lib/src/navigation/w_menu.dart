import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/base_style.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

export 'menu/w_menu_item.dart';
export 'menu/w_menu_item_group.dart';
export 'menu/w_submenu.dart';

mixin HasRootMenu on Widget {
  GlobalKey? menuKey = null;
  WMenu? _rootMenu = null;

  WMenu? get rootMenu => menuKey?.currentContext?.widget as WMenu;
  _WMenuState? get menuState => menuKey?.currentState as _WMenuState?;

  int level = 0;

  Widget injectRootMenu(slot, int i, component, len) {
    setLevel(slot, component);
    slot.menuKey = component.menuKey;
    return slot as Widget;
  }

  void setLevel(slot, component) {
    slot.level = component.level + 1;
  }

  bool get useOverlay {
    if (rootMenu == null) return false;
    return rootMenu!.$props.modeIsHorizontal ||
        (rootMenu!.$props.modeIsVertical && menuState!.collapse.value);
  }
}

class WMenu extends WStatefulWidget<WMenuOn, WMenuProp, WMenuSlot, WMenuStyle>
    with HasRootMenu {
  WMenu({
    Key? key,
    WMenuOn? on,
    WMenuProp? props,
    WMenuSlot? slots,
    WMenuStyle? style,
  }) : super(key: key ?? GlobalKey()) {
    $on = on ?? WMenuOn();
    $props = props ?? WMenuProp();
    $slots = slots ?? WMenuSlot(null);
    $style = style ?? WMenuStyle();
    init();
  }

  Widget injectRootMenu(slot, int i, component, len) {
    // slot.rootMenu = component;
    menuKey = key as GlobalKey;
    super.injectRootMenu(slot, i, component, len);
    return slot as Widget;
  }

  Function(Map) childrenGetter = (menu) => menu['children'];
  Function(Map) valueGetter = (menu) => menu['value'];
  Function(Map) textGetter = (menu) => menu['text'];

  Widget mapDataToWidget(Map menu, [GlobalKey? submenu]) {
    var children = childrenGetter.call(menu);
    if (children != null) {
      children as List;
      GlobalKey submenuKey = GlobalKey();
      return WSubmenu(key: submenuKey)
        ..$props.index = valueGetter.call(menu).toString()
        ..$slots.title = (WMenuItem(key: GlobalKey())
          ..$style.clazz = [Clazz.titleSuf]
          ..$slots.$ = textGetter.call(menu).toString()
          ..$props.index = valueGetter.call(menu).toString())
        ..$slots.$ = List.generate(
          children.length,
          (index) {
            var child = children[index];
            if (child is List) {
              return WMenuItemGroup()
                ..$slots.$ = List.generate(child.length, (index) {
                  var m = child[index];
                  return mapDataToWidget(m);
                });
            } else {
              return mapDataToWidget(child);
            }
          },
        )
        ..$style.merge($style.submenu);
    } else {
      return WMenuItem()
        ..belongTo = submenu
        ..$props.index = valueGetter.call(menu).toString()
        ..$slots.$ = textGetter.call(menu).toString()
        ..style.merge(style.menuItem);
    }
  }

  @override
  List<SlotTranslator> get slotTranslatorsCustom {
    return [
      SlotTranslator(Map, (menu, i, c, l) {
        var s = mapDataToWidget(menu);
        return injectRootMenu(s, i, c, l);
      }),
      SlotTranslator(WMenuItem, injectRootMenu),
      SlotTranslator(WSubmenu, injectRootMenu),
      SlotTranslator(WMenuItemGroup, injectRootMenu),
    ];
  }

  @override
  State<WMenu> createState() => _WMenuState();
}

class _WMenuState extends WState<WMenu> with SingleTickerProviderStateMixin {
  late AnimationController _widthControl;
  late Animation<dynamic> _width;
  late ValueNotifier<dynamic> value;
  late ValueNotifier<List<dynamic>> openeds;
  late ValueNotifier<bool> collapse;

  @override
  void initState() {
    bindCollapseHandle();
    bindValueHandle();
    bindOpenedsHandle();
    setAnimations();
    super.initState();
  }

  @override
  dispose() {
    print('dispose');
    _widthControl.dispose();
    value.dispose();
    openeds.dispose();
    collapse.dispose();
    super.dispose();
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
    value = ValueNotifier(widget.$props.defaultActive);
    value.addListener(() {
      widget.$props.defaultActive = value.value;
      if (value.value != null) {
        if (widget.$props.uniqueOpened &&
            !openeds.value.contains(value.value)) {
          openeds.value.add(value.value);
          // openeds.notifyListeners();
        }
      }
      setState(() {});
    });
  }

  bindOpenedsHandle() {
    openeds = ValueNotifier(widget.$props.defaultOpeneds);
    openeds.addListener(() {
      widget.$props.defaultOpeneds = openeds.value;
    });
  }

  bindCollapseHandle() {
    collapse = ValueNotifier(widget.$props.collapse);
    collapse.addListener(() {
      if (collapse.value != widget.$props.collapse) {
        _widthControl.forward();
      } else {
        _widthControl.reverse();
      }
    });
  }

  @override
  Widget wbuild(BuildContext context) {
    return widget.$props.modeIsVertical ? widget.$col : widget.$row;
  }

  double? get width {
    return widget.style.width ?? cfgGlobal.menu.width;
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
