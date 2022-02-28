import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class WMenuItem extends StatelessWidget
    with
        HasRootMenu,
        BaseMixins<WMenuItemOn, WMenuItemProp, WMenuItemSlot, WMenuItemStyle> {
  WMenuItem({
    Key? key,
    WMenuItemOn? on,
    WMenuItemProp? props,
    WMenuItemSlot? slots,
    WMenuItemStyle? style,
  }) : super(key: key) {
    $on = on ?? WMenuItemOn();
    $props = props ?? WMenuItemProp();
    $slots = slots ?? WMenuItemSlot(null);
    $style = style ?? WMenuItemStyle();
    init();
  }

  @override
  Widget build(BuildContext context) {
    print(rootMenu!.collapse.value);
    return SizedBox(
      height: lineHeight,
      child: Padding(
        padding: padding,
        child: Align(
          child: Row(
            children: [
              if ($hasDefalutSlot)
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: $row,
                ),
              if ($slots.title != null)
                Offstage(
                  offstage: rootMenu!.collapse.value,
                  child: stringToWidget.fn.call(
                    $slots.title!,
                    0,
                    this,
                  ),
                )
            ],
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }

  SlotTranslator get stringToWidget {
    return SlotTranslator(
      String,
      (slot, i, conponent) {
        return Text(
          slot,
          style: TextStyle(
            color: conponent.rootMenu?.$style.color,
          ),
        );
      },
    );
  }

  SlotTranslator get iconDataToWidget {
    return SlotTranslator(
      IconData,
      (slot, i, conponent) {
        return Icon(
          slot,
          color: conponent.rootMenu?.$style.color,
        );
      },
    );
  }

  @override
  List<SlotTranslator> get slotTranslatorsCustom {
    return [
      stringToWidget,
      iconDataToWidget,
    ];
  }

  double get lineHeight {
    return 60;
  }

  EdgeInsets get padding {
    return $style.padding ??
        cfgGlobal.menuItem.padding ??
        const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0);
  }
}

class WMenuItemOn extends BaseOn {}

class WMenuItemProp extends BaseProp {
  String? index;
  dynamic route;
  late bool disabled;
  WMenuItemProp({
    this.index,
    this.route,
    this.disabled = false,
  });
}

class WMenuItemSlot extends BaseSlot {
  String? title;
  WMenuItemSlot(
    defaultSlotBefore, {
    this.title,
  }) : super(defaultSlotBefore);
}
