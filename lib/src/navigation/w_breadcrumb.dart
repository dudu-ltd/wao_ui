import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';

class WBreadcrumb extends StatelessWidget
    implements BaseWidget<WBreadcrumbOn, WBreadcrumbProp, WBreadcrumbSlot> {
  @override
  late final WBreadcrumbOn $on;

  @override
  late final WBreadcrumbProp $props;

  @override
  late final WBreadcrumbSlot $slots;

  WBreadcrumb(
    dynamic defaultSlot, {
    Key? key,
    WBreadcrumbOn? on,
    WBreadcrumbProp? props,
    WBreadcrumbSlot? slots,
  }) : super(key: key) {
    $on = on ?? WBreadcrumbOn();
    $props = props ?? WBreadcrumbProp();
    $slots = slots ?? WBreadcrumbSlot(defaultSlot);
    $slots.defaultSlotBefore = defaultSlot;
    setDefaultSlot();
  }

  @override
  Widget build(BuildContext context) {
    // FIXME : 待解决超出宽度时水平滚动问题
    return Row(
      children: slotJoinSep,
    );
  }

  void checkSlot() {
    var slot = $slots.defaultSlotBefore;
    if (slot is! List<Widget> &&
        slot is! List<Map> &&
        slot is! Widget &&
        slot is! List<WBreadcrumbData> &&
        slot is! WBreadcrumbData) {
      throw Exception(
          "目前 defaultSlot 仅支持以下类型: List<Widget>、List<Map>、Widget、List<WBreadcrumbData>、WBreadcrumbData。");
    }
  }

  void setDefaultSlot() {
    checkSlot();
    var defaultSlot = $slots.defaultSlotBefore;

    $slots.defaultSlot = defaultSlot is List<Widget>
        ? defaultSlot
        : defaultSlot is Widget
            ? [defaultSlot]
            : defaultSlot is List<Map> ||
                    defaultSlot is List<WBreadcrumbData> ||
                    defaultSlot is WBreadcrumbData
                ? breadcrumbItems
                : [];
  }

  List<Widget> get breadcrumbItems {
    var defaultSlot = $slots.defaultSlotBefore;
    return defaultSlot is List<WBreadcrumbData>
        ? List.generate(defaultSlot.length, (index) {
            return createItem(defaultSlot[index]);
          })
        : defaultSlot is List<Map>
            ? List.generate(defaultSlot.length, (index) {
                return createItem(
                  WBreadcrumbData(
                    text: defaultSlot[index][$props.itemTextField],
                    icon: defaultSlot[index][$props.itemIconField],
                  ),
                );
              })
            : [
                createItem(defaultSlot),
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
    var slotLen = $slots.defaultSlot!.length;
    var _sep = sep;
    for (var i = 0; i < slotLen; i++) {
      result.add($slots.defaultSlot![i]);
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
    implements
        BaseWidget<WBreadcrumbItemOn, WBreadcrumbItemProp,
            WBreadcrumbItemSlot> {
  @override
  late final WBreadcrumbItemOn $on;

  @override
  late final WBreadcrumbItemProp $props;

  @override
  late final WBreadcrumbItemSlot $slots;

  WBreadcrumbItem({
    Key? key,
    WBreadcrumbItemOn? on,
    WBreadcrumbItemProp? props,
    WBreadcrumbItemSlot? slots,
  }) : super(key: key) {
    $on = on ?? WBreadcrumbItemOn();
    $props = props ?? WBreadcrumbItemProp();
    $slots = slots ?? WBreadcrumbItemSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: cfgGlobal.breadcrumb.padding,
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
