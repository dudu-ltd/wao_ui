// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

class WTabs extends WStatefulWidget<WTabsOn, WTabsProp, WTabsSlot, WTabsStyle> {
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
  State<WTabs> createState() => _WTabsState();
}

class _WTabsState extends WState<WTabs> {
  @override
  void initState() {
    super.initState();
    widget.$props.$addModelListener(updateView);
  }

  @override
  void dispose() {
    widget.$props.$removeModelListener(updateView);
    super.dispose();
  }

  @override
  Widget wbuild(BuildContext context) {
    var children = widget.defaultSlot;
    var content = <Widget>[
      widget.$slots.tabsWrapper(_items(children)),
      if (navScroll != null) navScroll!,
      _body(children),
    ];
    if (widget.$props.positionIsReverse) content = content.reversed.toList();
    var tabs;
    if (widget.$props.positionIsVertical) {
      tabs = SizedBox(
        height: height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: content,
        ),
      );
    } else {
      tabs = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content,
      );
    }
    return tabsWrapper(tabs);
  }

  double get height {
    return widget.style.height ?? cfgGlobal.tabs.height ?? 200;
  }

  @override
  List<SlotTranslator> get slotTranslatorsDefault {
    return [
      SlotTranslator(
        WTabPane,
        (slot, i, c, l) {
          slot as WTabPane;
          return slot;
        },
      )
    ];
  }

  Widget? get navScroll {
    if (widget.$props.type != null) return null;
    late Widget box;
    if (widget.$props.positionIsHorizontal) {
      box = Container(height: 1);
    } else {
      box = SizedBox(width: 2, height: height);
    }
    return ColoredBox(
      child: box,
      color: navScrollColor,
    );
  }

  Widget _items(List<Widget> items) {
    var children = List.generate(items.length, (index) {
      var child = items[index] as WTabPane;
      return _item(child);
    });
    var hs = borderWrapper(
      colorWrapper(
        Wrap(
          spacing: widget.$props.typeIsBorderCard ? 0 : 1,
          alignment: WrapAlignment.center,
          direction: widget.$props.positionIsHorizontal
              ? Axis.horizontal
              : Axis.vertical,
          children: children,
        ),
        CfgGlobal.infoColor.shade300,
        widget.$props.typeIsCard,
      ),
      cfgGlobal.border.excludeReverse(widget.$props.tabPosition),
      widget.$props.typeIsCard,
    );

    return expandedWrapper(
        hs,
        DecoratedBox(
            child: SizedBox(height: itemHeight + 2),
            decoration: BoxDecoration(
              border: Border(bottom: WBorder.common),
              color: widget.$props.typeIsBorderCard
                  ? ColorUtil.hexToColor('#f5f7fa')
                  : Colors.white,
            )),
        need:
            widget.$props.positionIsHorizontal && widget.$props.typeNeedStyle);
  }

  Widget tabsWrapper(Widget child) {
    return alignWrapper(
      shadowWrapper(
        borderWrapper(
          colorWrapper(
            child,
            widget.style.backgroundColor ?? Colors.white,
            true,
          ),
          Border.all(color: CfgGlobal.infoColor.shade300),
          widget.$props.typeIsBorderCard,
        ),
        need: widget.$props.typeIsBorderCard,
      ),
      need: widget.$props.typeNeedStyle,
    );
  }

  Widget itemColorWrapper(Widget child, {active}) {
    var borderSide = BorderSide(
      color: active && !widget.$props.typeIsBorderCard
          ? Colors.white
          : CfgGlobal.infoColor.shade300,
      width: 1,
    );
    return borderWrapper(
      colorWrapper(
        colorWrapper(
          child,
          Colors.white,
          widget.$props.typeIsCard,
        ),
        active ? Colors.white : ColorUtil.hexToColor('#f5f7fa'),
        widget.$props.typeIsBorderCard,
      ),
      _itemBorder(active, borderSide),
      widget.$props.typeNeedStyle,
    );
  }

  Border _itemBorder(active, borderSide) {
    return widget.$props.positionIsHorizontal
        ? (widget.$props.typeIsBorderCard && active)
            ? Border(left: borderSide, right: borderSide)
            : Border(bottom: borderSide)
        : widget.$props.positionIsReverse
            ? widget.$props.positionIsBottom
                ? Border(left: borderSide, top: borderSide)
                : Border(left: borderSide)
            : Border(right: borderSide);
  }

  Widget _item(WTabPane child) {
    var label = child.$props.label ?? '';
    print(
        'widget.\$props.value ${widget.$props.model} == child.\$props.name ${child.$props.name} : ${widget.$props.model == child.$props.name}');
    return itemEventWrapper(
      itemColorWrapper(
        Padding(
          padding: itemPadding,
          child: SizedBox(
            height: itemHeight,
            child: Align(
              widthFactor: 1,
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: TextStyle(color: textColor, fontSize: textSize),
              ),
            ),
          ),
        ),
        active: widget.$props.model == child.$props.name,
      ),
      child.$props.name,
    );
  }

  Widget itemEventWrapper(Widget child, String? itemValue) {
    return InkWell(
      onTap: () {
        // showLicensePage(context: context);
        debugPrint(
            'widget.\$props.value ${widget.$props.model} change to $itemValue');
        widget.$props.model = itemValue;
        widget.$on.tabClick?.call(itemValue);
      },
      child: child,
    );
  }

  _body(List<Widget> children) {
    late Widget body = Container();
    for (var i = 0; i < children.length; i++) {
      var child = children[i];
      child as WTabPane;
      if (i == 0) {
        body = child.$col;
      }
      if (child.$props.name == widget.$props.model) {
        body = child.$col;
      }
    }
    return widget.$props.positionIsVertical
        ? Expanded(child: body)
        : FractionallySizedBox(
            widthFactor: 1,
            child: body,
          );
  }

  Color get navScrollColor {
    return ColorUtil.hexToColor('#e4e7ed');
  }

  EdgeInsets get itemPadding {
    return widget.style.item?.padding ??
        cfgGlobal.tabs.item?.padding ??
        const EdgeInsets.symmetric(horizontal: 20);
  }

  double get itemHeight {
    return widget.style.item?.height ?? cfgGlobal.tabs.item?.height ?? 40;
  }

  Color? get textColor {
    return widget.style.item?.color ??
        cfgGlobal.tabs.item?.color ??
        ColorUtil.hexToColor('#303133');
  }

  double? get textSize {
    return widget.style.item?.fontSize ?? cfgGlobal.tabs.item?.fontSize;
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

class WTabsProp extends BaseProp with ModelDriveProp<String> {
  late String? type;
  late bool closable;
  late bool addable;
  late bool editable;
  late String tabPosition;
  late bool stretch;
  late Function(String, String)? beforeLeave;
  WTabsProp({
    String? model,
    this.type,
    this.closable = false,
    this.addable = false,
    this.editable = false,
    this.tabPosition = 'top',
    this.stretch = false,
    this.beforeLeave,
  }) {
    this.model = model;
  }
  var h = ['top', 'bottom'];

  var v = ['left', 'right'];

  var reverse = ['right', 'bottom'];

  bool get positionIsVertical {
    return v.contains(tabPosition);
  }

  bool get positionIsHorizontal {
    return h.contains(tabPosition);
  }

  bool get positionIsReverse {
    return reverse.contains(tabPosition);
  }

  bool get positionIsBottom {
    return tabPosition == 'bottom';
  }

  bool get typeIsCard {
    return type == 'card';
  }

  bool get typeIsBorderCard {
    return type == 'border-card';
  }

  bool get typeNeedStyle {
    return typeIsCard || typeIsBorderCard;
  }
}

class WTabsSlot extends BaseSlot {
  Widget Function(Widget) tabsWrapper = (w) => w;
  WTabsSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

///
///
class WTabPane extends WStatelessWidget<WTabPaneOn, WTabPaneProp, WTabPaneSlot,
    WTabPaneStyle> {
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
  Widget wbuild(BuildContext context) {
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
