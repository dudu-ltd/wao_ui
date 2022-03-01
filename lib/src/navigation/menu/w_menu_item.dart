import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class WMenuItem extends StatefulWidget
    with
        HasRootMenu,
        BaseMixins<WMenuItemOn, WMenuItemProp, WMenuItemSlot, WMenuItemStyle> {
  late AnimationController expandController;
  late AnimationController bgController;
  late Animation<double> iconAngle;
  late Animation<Color?> bgColor;
  late ValueNotifier isHover = ValueNotifier(false);
  late ValueNotifier isExpand = ValueNotifier(false);

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
          color: conponent.rootMenu?.$style.prefixColor,
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

class _WMenuItemState extends State<WMenuItem> with TickerProviderStateMixin {
  @override
  void initState() {
    // 设置展开动画
    widget.expandController =
        AnimationController(vsync: this, duration: CfgGlobal.duration);
    widget.iconAngle = Tween(begin: 0.0, end: pi)
        .animate(widget.expandController)
      ..addListener(updateView);

    // 设置鼠标浮入动画
    widget.bgController =
        AnimationController(vsync: this, duration: CfgGlobal.duration);
    widget.bgColor = ColorTween(
            begin: widget.rootMenu?.$style.backgroundColor,
            end: widget.rootMenu?.$style.hoverBackgroundColor)
        .animate(widget.bgController)
      ..addListener(updateView);

    valueChangeBind();
    super.initState();
  }

  valueChangeBind() {
    widget.rootMenu?.collapse.addListener(updateView);

    // 触发展开动画
    widget.isExpand.addListener(() {
      if (widget.isExpand.value) {
        Timer(
          Duration(milliseconds: showTime),
          () {
            widget.expandController.forward();
          },
        );
      } else {
        Timer(
          Duration(milliseconds: hideTime),
          () {
            widget.expandController.reverse();
          },
        );
      }
    });

    // 触发鼠标浮入动画
    widget.isHover.addListener(() {
      if (widget.isHover.value) {
        widget.bgController.forward();
      } else {
        widget.bgController.reverse();
      }
    });
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
    if (expandByHover) widget.isExpand.value = true;
    widget.bgController.forward();
    widget.$on.enter?.call(e);
  }

  pointExit(e) {
    if (expandByHover) widget.isExpand.value = false;
    widget.bgController.reverse();
    widget.$on.exit?.call(e);
  }

  pointClick() {
    if (!expandByHover) {
      widget.isExpand.value = !widget.isExpand.value;
      widget.$on.click?.call();
    }
  }

  @override
  void dispose() {
    widget.expandController.dispose();
    widget.bgController.dispose();
    widget.isExpand.dispose();
    widget.isHover.dispose();
    super.dispose();
  }

  updateView() => setState(() {});

  @override
  Widget build(BuildContext context) {
    var itemBody = Row(
      children: [...defaultAsPrefix, ...title, ...suffix],
    );
    var box = boxWrapper(itemBody);
    return eventWrapper(box);
  }

  Widget eventWrapper(Widget child) {
    return MouseRegion(
      onEnter: pointEnter,
      onExit: pointExit,
      child: InkWell(
        child: child,
        onTap: pointClick,
      ),
    );
  }

  Widget boxWrapper(Widget child) {
    return ColoredBox(
      color: widget.bgColor.value ??
          widget.rootMenu?.$style.backgroundColor ??
          Colors.transparent,
      child: SizedBox(
        height: widget.lineHeight,
        child: Padding(
          padding: widget.padding,
          child: child,
        ),
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
      if (widget.$hasDefalutSlot && !iconNeedPadding) widget.$row,
    ];
  }

  List<Widget> get title {
    return <Widget>[
      if (widget.$slots.title != null)
        Expanded(
          child: Offstage(
            offstage: widget.rootMenu!.collapse.value,
            child:
                widget.stringToWidget.fn.call(widget.$slots.title!, 0, widget),
          ),
        ),
    ];
  }

  List<Widget> get suffix {
    return <Widget>[
      if (needSuffix)
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Transform.rotate(
            angle: widget.iconAngle.value,
            child: Icon(
              widget.$slots.suffix,
              size: 16,
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
