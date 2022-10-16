import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

class WCollapse extends WStatefulWidget<WCollapseOn, WCollapseProp,
    WCollapseSlot, WCollapseStyle> {
  WCollapse({
    Key? key,
    WCollapseOn? on,
    WCollapseProp? props,
    WCollapseSlot? slots,
    WCollapseStyle? style,
  }) : super(key: key) {
    $on = on ?? WCollapseOn();
    $props = props ?? WCollapseProp();
    $slots = slots ?? WCollapseSlot(null);
    $style = style ?? WCollapseStyle();
    init();
  }

  @override
  State<WCollapse> createState() => _WCollapseState();

  WCollapseItem itemWrapper(Widget child, i) {
    WCollapseItem item;
    if (child is WCollapseItem) {
      item = child;
    } else {
      item = WCollapseItem(
        props: WCollapseItemProp(name: i, title: '11'),
        slots: WCollapseItemSlot(child),
      );
    }
    item.$props._accordion = $props.accordion;
    var originChange = item.$on.change;
    if (!item.$on._changeWrapped) {
      item.$on.change = originChange != null
          ? (v) {
              onItemChange(item).call(v);
              originChange.call(v);
            }
          : onItemChange(item);
      item.$on._changeWrapped = true;
    }
    return item;
  }

  Function(bool) onItemChange(WCollapseItem item) {
    return (v) {
      if ($props.accordion) {
        for (var element in defaultSlot) {
          if (element is WCollapseItem && element.hashCode != item.hashCode) {
            element.$props._expanded.value = false;
          }
        }
        // if (item.$props._expanded.value) {
        //   $props.model = item.$props.name;
        // }
      } else {
        var values = [];
        for (var element in $slots.defaultSlot ?? []) {
          if (element is WCollapseItem && element.$props._expanded.value) {
            values.add(element.$props.name);
          }
        }
        $props.model = values;
      }
      $on.change?.call($props.model);
    };
  }

  @override
  List<SlotTranslator> get slotTranslatorsCustom {
    return [
      SlotTranslator(
        Widget,
        (slot, i, component, len) {
          var item = itemWrapper(slot, i);
          return item;
        },
        (slot) {
          return slot is Widget;
        },
      )
    ];
  }
}

class _WCollapseState extends WState<WCollapse> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    widget.$props.$addModelListener(updateView);
    for (var element in widget.defaultSlot) {
      element as WCollapseItem;
      initItemsStatus(element);
    }
  }

  @override
  void dispose() {
    widget.$props.$removeModelListener(updateView);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget wbuild(BuildContext context) {
    BorderSide border =
        BorderSide(color: borderColor, width: borderWidth, style: borderStyle);

    return borderWrapper(
      Column(
        children: widget.defaultSlot,
      ),
      Border(top: border, bottom: border),
      true,
    );
  }

  void initItemsStatus(WCollapseItem element) {
    element.$props.$model = widget.$props.$model;
    if (widget.$props.accordion) {
      element.$props._expanded.value =
          widget.$props.model == element.$props.name;
    } else {
      if (widget.$props.model.contains(element.$props.name)) {
        element.$props._expanded.value = true;
      }
    }
  }

  Color get borderColor {
    return Colors.grey.shade200;
  }

  double get borderWidth {
    return 1;
  }

  BorderStyle get borderStyle {
    return BorderStyle.solid;
  }
}

class WCollapseOn extends BaseOn {
  Function(dynamic)? change;
  WCollapseOn({this.change});
}

class WCollapseProp extends BaseProp with ModelDriveProp {
  late bool accordion;

  WCollapseProp({model, this.accordion = false}) {
    this.model = model;
  }
}

class WCollapseSlot extends BaseSlot {
  WCollapseSlot(defaultSlotBefore) : super(defaultSlotBefore);
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
///
class WCollapseItem extends WStatefulWidget<WCollapseItemOn, WCollapseItemProp,
    WCollapseItemSlot, WCollapseItemStyle> {
  WCollapseItem({
    Key? key,
    WCollapseItemOn? on,
    WCollapseItemProp? props,
    WCollapseItemSlot? slots,
    WCollapseItemStyle? style,
  }) : super(key: key) {
    $on = on ?? WCollapseItemOn();
    $props = props ?? WCollapseItemProp();
    $slots = slots ?? WCollapseItemSlot(null);
    $style = style ?? WCollapseItemStyle();
    init();
  }

  @override
  State<WCollapseItem> createState() => _WCollapseItemState();

  @override
  get $crossAxisAlign {
    return CrossAxisAlignment.start;
  }
}

class _WCollapseItemState extends WState<WCollapseItem> {
  @override
  void initState() {
    widget.$props._expanded.addListener(updateView);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.$props._expanded.dispose();
  }

  @override
  Widget wbuild(BuildContext context) {
    Key? key = widget.$props._accordion ? GlobalKey() : null;

    return ExpansionTile(
      key: key,
      initiallyExpanded: widget.$props._expanded.value,
      onExpansionChanged: (value) {
        widget.$props._expanded.value = value;
        widget.$on.change?.call(value);
      },
      title: titleContent,
      children: widget.defaultSlot,
    );
  }

  Widget get titleContent {
    return widget.$slots.title?.call(widget.$props) ??
        Text(widget.$props.title);
  }

  Border? get border {
    return widget.style.border;
  }

  double get titleHeight {
    return widget.style.title?.height ?? 48;
  }

  double get bodyPaddingBottom {
    return widget.style.body?.paddingBottom ?? 0;
  }

  Color get borderColor {
    return widget.style.borderColor ?? Colors.grey.shade200;
  }

  double get borderWidth {
    return widget.style.borderWidth ?? 1;
  }

  BorderStyle get borderStyle {
    return BorderStyle.solid;
  }
}

class WCollapseItemOn extends BaseOn {
  bool _changeWrapped = false;
  WCollapseItemOn({this.change});
  Function(bool)? change;
}

class WCollapseItemProp extends BaseProp with ModelDriveProp {
  late dynamic name;
  late String title;
  late bool disabled;
  bool _accordion = false;
  final ValueNotifier<bool> _expanded = ValueNotifier(false);
  WCollapseItemProp({this.name, this.title = '', this.disabled = false});
}

class WCollapseItemSlot extends BaseSlot {
  Widget Function(dynamic)? title;
  WCollapseItemSlot(defaultSlotBefore, {this.title}) : super(defaultSlotBefore);
}
