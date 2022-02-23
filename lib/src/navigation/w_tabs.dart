import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WTabs extends StatelessWidget
    with BaseMixins<WTabsOn, WTabsProp, WTabsSlot, WTabsStyle> {
  WTabs({
    Key? key,
    WTabsOn? on,
    WTabsProp? props,
    WTabsSlot? slots,
    WTabsStyle? style,
  }) : super(key: key) {
    $on = on ?? WTabsOn();
    $props = props ?? WTabsProp();
    $slots = slots ?? WTabsSlot(null);
    $style = style ?? WTabsStyle();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTabsOn extends BaseOn {
  Function(dynamic)? tabClick;
  Function(String)? tabRemove;
  Function()? tabAdd;
  Function(String, Function)? edit;
  WTabsOn({
    this.tabClick,
    this.tabRemove,
    this.tabAdd,
    this.edit,
  });
}

class WTabsProp extends BaseProp {
  late String? value;
  late String? type;
  late bool closable;
  late bool addable;
  late bool editable;
  late String tabPosition;
  late bool stretch;
  late Function(String, String)? beforeLeave;
  WTabsProp({
    this.value,
    this.type,
    this.closable = false,
    this.addable = false,
    this.editable = false,
    this.tabPosition = 'top',
    this.stretch = false,
    this.beforeLeave,
  });
}

class WTabsSlot extends BaseSlot {
  WTabsSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

///
///
///
///
///
///
///
///
///
class WTabPane extends StatelessWidget
    with BaseMixins<WTabPaneOn, WTabPaneProp, WTabPaneSlot, WTabPaneStyle> {
  WTabPane({
    Key? key,
    WTabPaneOn? on,
    WTabPaneProp? props,
    WTabPaneSlot? slots,
    WTabPaneStyle? style,
  }) : super(key: key) {
    $on = on ?? WTabPaneOn();
    $props = props ?? WTabPaneProp();
    $slots = slots ?? WTabPaneSlot(null);
    $style = style ?? WTabPaneStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WTabPaneOn extends BaseOn {}

class WTabPaneProp extends BaseProp {
  late String? label;
  late bool disabled;
  late String? name;
  late bool closable;
  late bool lazy;

  WTabPaneProp({
    this.label,
    this.disabled = false,
    this.name,
    this.closable = false,
    this.lazy = false,
  });
}

class WTabPaneSlot extends BaseSlot {
  WTabPaneSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
