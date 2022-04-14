import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class WMenuItem extends WStatefulWidget<WMenuItemOn, WMenuItemProp,
    WMenuItemSlot, WMenuItemStyle> with HasRootMenu {
  WSubmenu? belongTo;

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
  State<WMenuItem> createState() => _WMenuItemState();

  SlotTranslator get stringToWidget {
    return SlotTranslator(
      String,
      (slot, i, component, len) {
        return Text(
          slot,
          style: TextStyle(
            fontSize: fontSize,
            color: rootMenu?.value.value == $props.index
                ? component.rootMenu?.$style.activeColor
                : component.rootMenu?.$style.color,
          ),
        );
      },
    );
  }

  SlotTranslator get iconDataToWidget {
    return SlotTranslator(
      IconData,
      (slot, i, component, len) {
        return Icon(
          slot,
          size: 20,
          color: component.rootMenu?.$style.prefixColor,
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
    return style.height ??
        rootMenu?.$style.submenu?.menuItem?.height ??
        cfgGlobal.menuItem.height ??
        50;
  }

  double get fontSize {
    return style.fontSize ??
        rootMenu?.$style.submenu?.menuItem?.fontSize ??
        cfgGlobal.menuItem.fontSize ??
        14;
  }

  EdgeInsets get padding {
    return style.padding ??
        cfgGlobal.menuItem.padding ??
        EdgeInsets.fromLTRB(paddingVal, 0.0, stepPadding, 0.0);
  }

  @override
  WMenuItemStyle get style => WMenuItemStyle()
    ..merge($style, force: true)
    ..merge(cfgGlobal.menuItem);
}

class _WMenuItemState extends WState<WMenuItem> with TickerProviderStateMixin {
  late AnimationController expandController;
  late AnimationController bgController;
  late Animation<double> iconAngle;
  late Animation<Color?> bgColor;
  late ValueNotifier isHover = ValueNotifier(false);
  late ValueNotifier isExpand = ValueNotifier(false);
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    // 设置展开动画
    expandController =
        AnimationController(vsync: this, duration: CfgGlobal.duration);
    iconAngle = Tween(begin: 0.0, end: pi).animate(expandController)
      ..addListener(updateView);

    // 设置鼠标浮入动画
    bgController =
        AnimationController(vsync: this, duration: CfgGlobal.duration);
    bgColor = ColorTween(
            begin: Colors.white,
            end: widget.rootMenu?.$style.hoverBackgroundColor)
        .animate(bgController)
      ..addListener(updateView);

    valueChangeBind();
    super.initState();
  }

  valueChangeBind() {
    widget.rootMenu?.collapse.addListener(updateView);
    widget.rootMenu?.value.addListener(updateView);
    // 触发展开动画
    isExpand.addListener(() {
      if (widget.rootMenu?.$props.triggerIsClick == true) {
        widget.belongTo?.state?.showSubmenu.value = isExpand.value;
        if (isExpand.value)
          expandController.forward();
        else
          expandController.reverse();
      } else {
        if (isExpand.value) {
          Timer(
            Duration(milliseconds: showTime),
            () {
              expandController.forward();
              widget.belongTo?.state?.showSubmenu.value = true;
            },
          );
        } else {
          Timer(
            Duration(milliseconds: hideTime),
            () {
              expandController.reverse();
              widget.belongTo?.state?.showSubmenu.value = false;
            },
          );
        }
      }
    });

    // 触发鼠标浮入动画
    isHover.addListener(() {
      if (isHover.value) {
        bgController.forward();
      } else {
        bgController.reverse();
      }
    });

    bool isOpen = widget.rootMenu?.openeds.value
            .contains(widget.belongTo?.$props.index) ??
        false;
    isExpand.value = isOpen;
  }

  int get showTime {
    return timeByHover(widget.belongTo?.$props.showTimeout.toInt());
  }

  int get hideTime {
    return timeByHover(widget.belongTo?.$props.hideTimeout.toInt());
  }

  int timeByHover(int? time) {
    return expandByHover ? time ?? 0 : 0;
  }

  pointEnter(e) {
    if (expandByHover) isExpand.value = true;
    bgController.forward();
    widget.$on.enter?.call(e);
  }

  pointExit(e) {
    if (expandByHover) isExpand.value = false;
    bgController.reverse();
    widget.$on.exit?.call(e);
  }

  pointClick() {
    if (!expandByHover) {
      isExpand.value = !isExpand.value;
      widget.$on.click?.call();
      widget.rootMenu?.value.value = widget.$props.index;
    }
  }

  @override
  void dispose() {
    widget.rootMenu?.collapse.removeListener(updateView);
    expandController.dispose();
    bgController.dispose();
    isExpand.dispose();
    isHover.dispose();
    super.dispose();
  }

  updateView() => setState(() {});

  @override
  Widget wbuild(BuildContext context) {
    var itemBody = Row(
      children: [
        ...defaultAsPrefix,
        ...title,
        ...suffix,
      ],
    );
    var box = boxWrapper(itemBody);
    return Focus(focusNode: focusNode, child: eventWrapper(box));
  }

  Widget eventWrapper(Widget child) {
    return MouseRegion(
      onEnter: pointEnter,
      onExit: pointExit,
      child: GestureDetector(
        child: child,
        onTap: pointClick,
      ),
    );
  }

  Widget boxWrapper(Widget child) {
    return Container(
      child: child,
      height: widget.lineHeight,
      padding: widget.padding,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: widget.$props.index == widget.rootMenu?.value.value &&
                    (widget.rootMenu?.$props.modeIsHorizontal ?? false)
                ? widget.rootMenu?.$style.activeColor ?? Colors.transparent
                : Colors.transparent,
          ),
        ),
        color: bgColor.value ??
            widget.rootMenu?.$style.backgroundColor ??
            Colors.transparent,
      ),
    );
  }

  List<Widget> get defaultAsPrefix {
    return <Widget>[
      if (widget.$hasDefalutSlot && iconNeedPadding)
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: widget.$row,
        ),
      if (widget.$hasDefalutSlot && !iconNeedPadding && widget.level > 1)
        Expanded(child: widget.$row),
      if (widget.$hasDefalutSlot && !iconNeedPadding && widget.level <= 1)
        widget.$row,
    ];
  }

  List<Widget> get title {
    var hasTitle = widget.$slots.title != null;
    return <Widget>[
      if (hasTitle && widget.rootMenu!.$props.modeIsVertical)
        Expanded(
          child: Offstage(
            offstage: widget.rootMenu!.collapse.value,
            child: widget.stringToWidget.fn.call(widget.$slots.title!, 0,
                widget, widget.$defaultSlotBeforeLength),
          ),
        ),
      if (hasTitle && widget.rootMenu!.$props.modeIsHorizontal)
        widget.stringToWidget.fn.call(
            widget.$slots.title!, 0, widget, widget.$defaultSlotBeforeLength)
    ];
  }

  List<Widget> get suffix {
    return <Widget>[
      if (needSuffix)
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Transform.rotate(
            angle: iconAngle.value,
            child: Icon(
              widget.$slots.suffix,
              size: 12,
              color: widget.rootMenu?.$style.suffixColor,
            ),
          ),
        ),
    ];
  }

  bool get expandByHover {
    return widget.rootMenu != null &&
        widget.rootMenu!.$props.modeIsHorizontal &&
        widget.rootMenu!.$props.triggerIsHover;
  }

  bool get needSuffix {
    return widget.$slots.suffix != null && !widget.rootMenu!.collapse.value;
  }

  bool get iconNeedPadding {
    return widget.$first is Icon && !widget.rootMenu!.$props.collapse;
  }
}

class WMenuItemOn extends BaseOn {
  Function(dynamic)? enter;
  Function(dynamic)? exit;
  Function()? click;
  WMenuItemOn({this.enter, this.exit, this.click});
}

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
  IconData? suffix;
  WMenuItemSlot(
    defaultSlotBefore, {
    this.title,
    this.suffix,
  }) : super(defaultSlotBefore);
}
