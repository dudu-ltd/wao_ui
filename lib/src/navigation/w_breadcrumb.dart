import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';

class WBreadcrumb extends StatelessWidget
    with
        BaseMixins<WBreadcrumbOn, WBreadcrumbProp, WBreadcrumbSlot,
            WBreadcrumbStyle> {
  WBreadcrumb(
    dynamic defaultSlot, {
    Key? key,
    WBreadcrumbOn? on,
    WBreadcrumbProp? props,
    WBreadcrumbSlot? slots,
    WBreadcrumbStyle? style,
  }) : super(key: key) {
    $on = on ?? WBreadcrumbOn();
    $props = props ?? WBreadcrumbProp();
    $slots = slots ?? WBreadcrumbSlot(defaultSlot);
    $style = style ?? WBreadcrumbStyle();
    $slots.defaultSlotBefore = defaultSlot;
    init();
  }

  @override
  Widget build(BuildContext context) {
    // FIXME : 待解决超出宽度时水平滚动问题
    return Row(
      children: slotJoinSep,
    );
  }

  List<SlotTranslator> get slotTranslatorCustom {
    return [
      SlotTranslator(
        WBreadcrumbData,
        (slot, i, c, len) {
          return createItem(slot);
        },
      ),
      SlotTranslator(
        Map,
        (data, i, c, len) {
          return createItem(
            WBreadcrumbData(
              text: data[$props.itemTextField],
              icon: data[$props.itemIconField],
            ),
          );
        },
      )
    ];
  }

  WBreadcrumbItem createItem(WBreadcrumbData data) {
    return WBreadcrumbItem(
      props: WBreadcrumbItemProp(data: data),
      on: WBreadcrumbItemOn(click: $on.itemClick),
    );
  }

  List<Widget> get slotJoinSep {
    List<Widget> result = [];
    var slotLen = defaultSlot.length;
    var _sep = sep;
    for (var i = 0; i < slotLen; i++) {
      result.add(defaultSlot[i]);
      if (i < slotLen - 1) {
        result.add(_sep);
      }
    }
    return result;
  }

  Widget get sep {
    return Text($props.separator);
  }
}

class WBreadcrumbData {
  late String text;
  IconData? icon;

  /// 用于回调事件的区分。
  late String type;
  WBreadcrumbData({text, this.icon, type}) {
    this.text = text ?? '';
    this.type = type ?? '';
  }
}

class WBreadcrumbOn extends BaseOn {
  late Function(WBreadcrumbData) itemClick;
  WBreadcrumbOn({itemClick}) {
    this.itemClick = itemClick ?? (data) {};
  }
}

class WBreadcrumbProp extends BaseProp {
  late String separator;
  late String itemTextField;
  late String itemIconField;
  late String itemTypeField;

  @Deprecated("Unuseful for current version")
  String? separatorClass;

  WBreadcrumbProp(
      {separator,
      separatorClass,
      itemTextField,
      itemIconField,
      itemTypeField}) {
    this.separator = separator ?? '/';
    this.itemTextField = itemTextField ?? 'text';
    this.itemIconField = itemIconField ?? 'icon';
    this.itemTypeField = itemTypeField ?? 'type';
    this.separatorClass = separatorClass;
  }
}

class WBreadcrumbSlot extends BaseSlot {
  WBreadcrumbSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

///
///
///
///
class WBreadcrumbItem extends StatelessWidget
    with
        BaseMixins<WBreadcrumbItemOn, WBreadcrumbItemProp, WBreadcrumbItemSlot,
            WBreadcrumbItemStyle> {
  WBreadcrumbItem({
    Key? key,
    WBreadcrumbItemOn? on,
    WBreadcrumbItemProp? props,
    WBreadcrumbItemSlot? slots,
    WBreadcrumbItemStyle? style,
  }) : super(key: key) {
    $on = on ?? WBreadcrumbItemOn();
    $props = props ?? WBreadcrumbItemProp();
    $slots = slots ?? WBreadcrumbItemSlot(null);
    $style = style ?? WBreadcrumbItemStyle();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: padding,
        child: Row(
          children: [
            if ($props.data.icon != null) Icon($props.data.icon),
            Text($props.data.text)
          ],
        ),
      ),
      onTap: () {
        $on.click($props.data);
      },
    );
  }

  EdgeInsets get padding {
    return $style?.padding ?? cfgGlobal.descriptions.padding ?? EdgeInsets.zero;
  }
}

class WBreadcrumbItemOn extends BaseOn {
  late Function(WBreadcrumbData) click;
  WBreadcrumbItemOn({click}) {
    this.click = click ?? (WBreadcrumbData data) {};
  }
}

class WBreadcrumbItemProp extends BaseProp {
  late WBreadcrumbData data;
  WBreadcrumbItemProp({WBreadcrumbData? data}) {
    this.data = data ?? WBreadcrumbData();
  }
}

class WBreadcrumbItemSlot extends BaseSlot {
  WBreadcrumbItemSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
