import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:wao_ui/src/basic/w_button.dart';
// ignore: implementation_imports
import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';

class _WDropdownState extends State<WDropdown>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  bool open = false;
  bool mouseIn = false;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 40.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    // controller.forward();
  }

  _triggerWrapper(Widget btn, GlobalKey popupKey) {
    return MouseStateBuilder(builder: (context, state) {
      return MouseRegion(
        child: btn,
        onExit: (event) {
          Timer(
            Duration(milliseconds: widget.$props.hideTimeout ~/ 1),
            () {
              if (!state.isMouseOver) {
                // Navigator.of(context).pop();
                open = false;
              }
            },
          );
        },
        onEnter: (e) {
          Timer(
            Duration(milliseconds: widget.$props.showTimeout ~/ 1),
            () {
              if (state.isMouseOver) {
                (popupKey.currentState as PopupMenuButtonState)
                    .showButtonMenu();
                open = true;
              }
            },
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    PopupMenuButton popup;
    GlobalKey popupKey = GlobalKey();
    Widget btn = Row(
      children: [
        widget.$first,
        if (widget.$props.splitButton)
          _triggerWrapper(
              const Icon(Icons.keyboard_arrow_down_rounded), popupKey),
      ],
    );

    if (widget.$props.triggerIsHover && !widget.$props.splitButton) {
      btn = _triggerWrapper(btn, popupKey);
    }
    popup = PopupMenuButton(
      tooltip: '',
      key: popupKey,
      child: btn,
      onCanceled: () => open = false,
      offset: const Offset(0, 30),
      itemBuilder: (context) {
        var items = (widget.$slots.dropdown as WDropdownMenu).defaultSlot;
        return List.generate(items.length, (index) {
          return PopupMenuItem(
            child: items[index],
          );
        });
      },
    );
    return popup;
    // return Listener(
    //   onPointerHover: (event) {
    //     controller.forward();
    //   },
    //   child: Stack(
    //     children: [
    //       Row(
    //         children: [
    //           widget.$slots.first,
    //           if (widget.$props.splitButton)
    //             const Icon(Icons.keyboard_arrow_down_rounded),
    //         ],
    //       ),
    //       SizedBox(
    //         child: widget.$slots.dropdown ?? Container(),
    //         height: animation.value,
    //       ),
    //     ],
    //   ),
    // );
  }
}

class WDropdown extends StatefulWidget
    with BaseMixins<WDropdownOn, WDropdownProp, WDropdownSlot, WDropdownStyle> {
  WDropdown({
    Key? key,
    WDropdownOn? on,
    WDropdownProp? props,
    WDropdownSlot? slots,
    WDropdownStyle? style,
  }) : super(key: key) {
    $on = on ?? WDropdownOn();
    $props = props ?? WDropdownProp();
    $slots = slots ?? WDropdownSlot(null);
    $style = style ?? WDropdownStyle();
    init();
  }

  @override
  List<SlotTranslator> get slotTranslatorsCustom {
    return [
      SlotTranslator(
        String,
        (slot, i, component, len) {
          return WButton(
            slots: WButtonSlot(slot),
            props: WButtonProp(type: $props.type),
          );
        },
      )
    ];
  }

  @override
  _WDropdownState createState() => _WDropdownState();
}

class WDropdownOn extends BaseOn {
  Function? click;
  Function? command;
  Function? visibleChange;
  WDropdownOn({this.click, this.command, this.visibleChange});
}

class WDropdownProp extends BaseProp {
  String? type;
  String? size;
  late bool splitButton;
  late String placement;
  late String trigger;
  late bool hideOnClick;
  late double showTimeout;
  late double hideTimeout;
  late int tabindex;
  late bool disabled;

  WDropdownProp({
    this.type,
    this.size,
    bool? splitButton,
    String? placement,
    String? trigger,
    bool? hideOnClick,
    double? showTimeout,
    double? hideTimeout,
    int? tabindex,
    bool? disabled,
  }) {
    this.splitButton = splitButton ?? false;
    this.placement = placement ?? 'bottom-end';
    this.trigger = trigger ?? 'hover';
    this.hideOnClick = hideOnClick ?? true;
    this.showTimeout = showTimeout ?? 250;
    this.hideTimeout = hideTimeout ?? 150;
    this.tabindex = tabindex ?? 0;
    this.disabled = disabled ?? false;
  }

  bool get triggerIsHover {
    return trigger == 'hover';
  }
}

class WDropdownSlot extends BaseSlot {
  Widget? dropdown;
  WDropdownSlot(defaultSlotBefore, {this.dropdown}) : super(defaultSlotBefore);
}

class WDropdownMenu extends StatelessWidget
    with
        BaseMixins<WDropdownMenuOn, WDropdownMenuProp, WDropdownMenuSlot,
            WDropdownMenuStyle> {
  WDropdownMenu({
    Key? key,
    WDropdownMenuOn? on,
    WDropdownMenuProp? props,
    WDropdownMenuSlot? slots,
    WDropdownMenuStyle? style,
  }) : super(key: key) {
    $on = on ?? WDropdownMenuOn();
    $props = props ?? WDropdownMenuProp();
    $slots = slots ?? WDropdownMenuSlot(null);
    $style = style ?? WDropdownMenuStyle();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: defaultSlot,
      ),
    );
  }
}

class WDropdownMenuOn extends BaseOn {}

class WDropdownMenuProp extends BaseProp {}

class WDropdownMenuSlot extends BaseSlot {
  WDropdownMenuSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WDropdownItem extends StatelessWidget
    with
        BaseMixins<WDropdownItemOn, WDropdownItemProp, WDropdownItemSlot,
            WDropdownItemStyle> {
  WDropdownItem({
    Key? key,
    WDropdownItemOn? on,
    WDropdownItemProp? props,
    WDropdownItemSlot? slots,
    WDropdownItemStyle? style,
  }) : super(key: key) {
    $on = on ?? WDropdownItemOn();
    $props = props ?? WDropdownItemProp();
    $slots = slots ?? WDropdownItemSlot(null);
    $style = style ?? WDropdownItemStyle();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return $first;
  }
}

class WDropdownItemOn extends BaseOn {}

class WDropdownItemProp extends BaseProp {
  dynamic command;
  late bool disabled;
  late bool divided;
  String? icon;
  WDropdownItemProp({
    this.command,
    bool? disabled,
    bool? divided,
    this.icon,
  }) {
    this.disabled = disabled ?? false;
    this.divided = divided ?? false;
  }
}

class WDropdownItemSlot extends BaseSlot {
  WDropdownItemSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
