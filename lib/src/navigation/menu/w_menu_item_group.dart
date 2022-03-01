import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class WMenuItemGroup extends StatelessWidget
    with
        HasRootMenu,
        BaseMixins<WMenuItemGroupOn, WMenuItemGroupProp, WMenuItemGroupSlot,
            WMenuItemGroupStyle> {
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
            child: Padding(
              padding:
                  $style.padding ?? EdgeInsets.only(left: level * stepPadding),
              child: title,
            ),
            alignment: Alignment.centerLeft,
          ),
        ),
        $col,
      ],
    );
  }

  @override
  void setLevel(slot, conponent) {
    slot.level = (conponent.level ?? 1);
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
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        );
  }

  double? get lineHeight {
    return $style.height ?? cfgGlobal.menuItemGroup.height;
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
