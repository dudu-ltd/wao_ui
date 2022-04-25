import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/src/basic/w_container_layout.dart';

import '../../core/base_mixins.dart';
import '../../core/base_style.dart';
import 'cfg_global.dart';

class WContainer extends WStatelessWidget<WContainerOn, WContainerProp,
    WContainerSlot, WContainerStyle> {
  WContainer({
    Key? key,
    WContainerOn? on,
    WContainerProp? props,
    WContainerSlot? slots,
    WContainerStyle? style,
  }) : super(key: key) {
    $on = on ?? WContainerOn();
    $props = props ?? WContainerProp();
    $slots = slots ?? WContainerSlot(null);
    $style = style ?? WContainerStyle();
    init();
  }

  dynamic _header;
  dynamic _main;
  dynamic _aside;
  dynamic _asideRight;
  dynamic _footer;

  add(dynamic widgetOrList, Widget item) {
    if (widgetOrList != null) {
      print(
          '警告: WContainer 只能有一个 ${item.runtimeType}，原先的 ${item.runtimeType} 已经被覆盖。');
    }
    return item;
  }

  @override
  List<SlotTranslator> get slotTranslatorsCustom => [
        SlotTranslator(
          WHeader,
          (s, i, c, l) {
            _header = add(_header, s);
            return s;
          },
        ),
        SlotTranslator(WMain, (s, i, c, l) {
          _main = add(_main, s);
          return s;
        }),
        SlotTranslator(WAside, (s, i, c, l) {
          if (_main == null) {
            _aside = add(_aside, s);
          } else {
            _asideRight = add(_asideRight, s);
          }
          return s;
        }),
        SlotTranslator(WFooter, (s, i, c, l) {
          _footer = add(_footer, s);
          return s;
        }),
        SlotTranslator(WContainer, (s, i, c, l) {
          _main = add(_main, s);
          return s;
        })
      ];

  @override
  Widget wbuild(BuildContext context) {
    defaultSlot;
    return WContainerLayout()
      ..$slots.header = _header is List ? Column(children: _header) : _header
      ..$slots.asideLeft = _aside is List ? Row(children: _aside) : _aside
      ..$slots.asideRight =
          _asideRight is List ? Row(children: _asideRight) : _asideRight
      ..$slots.footer = _footer is List ? Column(children: _footer) : _footer
      ..$slots.$ = _main is List ? Row(children: _main) : _main
      ..$props.asideLeftWidth = $style.asideLeftWidth ?? 200;
  }
}

class WContainerOn extends BaseOn {}

class WContainerProp extends BaseProp {}

class WContainerSlot extends BaseSlot {
  WContainerSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

///
/// @description:
///
/// @author: CorvusYe
///
/// @date: 2022-03-21
///
class WHeader extends WStatelessWidget<WHeaderOn, WHeaderProp, WHeaderSlot,
    WHeaderStyle> {
  WHeader({
    Key? key,
    WHeaderOn? on,
    WHeaderProp? props,
    WHeaderSlot? slots,
    WHeaderStyle? style,
  }) : super(key: key) {
    $on = on ?? WHeaderOn();
    $props = props ?? WHeaderProp();
    $slots = slots ?? WHeaderSlot(null);
    $style = style ?? WHeaderStyle();
    init();
  }
  @override
  Widget wbuild(BuildContext context) {
    // print('wheader background : ${style.backgroundColor}');
    return $col;
  }
}

class WHeaderOn extends BaseOn {}

class WHeaderProp extends BaseProp {}

class WHeaderSlot extends BaseSlot {
  WHeaderSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

///
/// @description:
///
/// @author: CorvusYe
///
/// @date: 2022-03-21
///
class WAside
    extends WStatelessWidget<WAsideOn, WAsideProp, WAsideSlot, WAsideStyle> {
  WAside({
    Key? key,
    WAsideOn? on,
    WAsideProp? props,
    WAsideSlot? slots,
    WAsideStyle? style,
  }) : super(key: key) {
    $on = on ?? WAsideOn();
    $props = props ?? WAsideProp();
    $slots = slots ?? WAsideSlot(null);
    $style = style ?? WAsideStyle();
    init();
  }
  @override
  Widget wbuild(BuildContext context) {
    return $col;
  }
}

class WAsideOn extends BaseOn {}

class WAsideProp extends BaseProp {}

class WAsideSlot extends BaseSlot {
  WAsideSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

///
/// @description:
///
/// @author: CorvusYe
///
/// @date: 2022-03-21
///
class WMain
    extends WStatelessWidget<WMainOn, WMainProp, WMainSlot, WMainStyle> {
  WMain({
    Key? key,
    WMainOn? on,
    WMainProp? props,
    WMainSlot? slots,
    WMainStyle? style,
  }) : super(key: key) {
    $on = on ?? WMainOn();
    $props = props ?? WMainProp();
    $slots = slots ?? WMainSlot(null);
    $style = style ?? WMainStyle();
    init();
  }
  @override
  Widget wbuild(BuildContext context) {
    return $col;
  }
}

class WMainOn extends BaseOn {}

class WMainProp extends BaseProp {}

class WMainSlot extends BaseSlot {
  WMainSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

///
/// @description:
///
/// @author: CorvusYe
///
/// @date: 2022-03-21
///
class WFooter extends WStatelessWidget<WFooterOn, WFooterProp, WFooterSlot,
    WFooterStyle> {
  WFooter({
    Key? key,
    WFooterOn? on,
    WFooterProp? props,
    WFooterSlot? slots,
    WFooterStyle? style,
  }) : super(key: key) {
    $on = on ?? WFooterOn();
    $props = props ?? WFooterProp();
    $slots = slots ?? WFooterSlot(null);
    $style = style ?? WFooterStyle();
    init();
  }
  @override
  Widget wbuild(BuildContext context) {
    return $col;
  }
}

class WFooterOn extends BaseOn {}

class WFooterProp extends BaseProp {}

class WFooterSlot extends BaseSlot {
  WFooterSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
