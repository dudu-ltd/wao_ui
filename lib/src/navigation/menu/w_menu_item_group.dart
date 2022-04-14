import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class WMenuItemGroup extends WStatelessWidget<
    WMenuItemGroupOn,
    WMenuItemGroupProp,
    WMenuItemGroupSlot,
    WMenuItemGroupStyle> with HasRootMenu {
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
  Widget wbuild(BuildContext context) {
    return Column(
      children: [
        if (hasTitle)
          SizedBox(
            height: style.height,
            child: Align(
              child: Padding(
                padding: $style.padding ?? EdgeInsets.only(left: paddingVal),
                child: title,
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
        if (!hasTitle)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Divider(
              height: 8,
            ),
          ),
        $col,
      ],
    );
  }

  bool get hasTitle {
    return $slots.title != null || $props.title != null;
  }

  @override
  List<SlotTranslator> get slotTranslatorsCustom {
    return [
      SlotTranslator(WSubmenu, injectRootMenu),
      SlotTranslator(WMenuItemGroup, injectRootMenu),
      SlotTranslator(WMenuItem, injectRootMenu),
    ];
  }

  Widget get title {
    return $slots.title ??
        Text(
          $props.title ?? '',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        );
  }

  @override
  WMenuItemGroupStyle get style => WMenuItemGroupStyle()
    ..merge($style, force: true)
    ..merge(cfgGlobal.menuItemGroup);
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
