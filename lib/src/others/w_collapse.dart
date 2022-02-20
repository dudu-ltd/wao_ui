import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

class WCollapse extends StatefulWidget
    implements
        BaseWidget<WCollapseOn, WCollapseProp, WCollapseSlot, WCollapseStyle> {
  @override
  late final WCollapseOn $on;
  @override
  late final WCollapseProp $props;
  @override
  late final WCollapseSlot $slots;
  @override
  late WCollapseStyle $style;

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
  }

  @override
  State<WCollapse> createState() => _WCollapseState();
}

class _WCollapseState extends State<WCollapse> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        for (var element in widget.$slots.defaultSlot!) {
          element as WCollapseItem;
          initItemsStatus(element);
          addItemsListener(element);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    BorderSide border =
        BorderSide(color: borderColor, width: borderWidth, style: borderStyle);
    return borderWrapper(
      Column(
        children: widget.$slots.defaultSlot!,
      ),
      Border(top: border, bottom: border),
      true,
    );
  }

  void initItemsStatus(WCollapseItem element) {
    if (widget.$props.accordion) {
      if (widget.$props.value == element.$props.name) {
        element.$props._expanded.value = true;
      }
    } else {
      if (widget.$props.value.contains(element.$props.name)) {
        element.$props._expanded.value = true;
      }
    }
  }

  void addItemsListener(WCollapseItem element) {
    element.$props._expanded.addListener(() {
      if (widget.$props.accordion && element.$props._expanded.value) {
        widget.$props.value = element.$props.name;
        widget.$on.change?.call(widget.$props.value);
        for (var other in widget.$slots.defaultSlot!) {
          other as WCollapseItem;
          if (element != other) other.$props._expanded.value = false;
        }
      }
      updateValue();
    });
  }

  void updateValue() {
    widget.$props.value = widget.$props.value ?? [];
    widget.$props.value.clear();
    for (var element in widget.$slots.defaultSlot!) {
      element as WCollapseItem;
      if (element.$props._expanded.value) {
        widget.$props.value.add(element.$props.name);
      }
    }
    widget.$on.change?.call(widget.$props.value);
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

class WCollapseProp extends BaseProp {
  late dynamic value;

  late bool accordion;

  WCollapseProp({this.value, this.accordion = false});
}

class WCollapseSlot extends BaseSlot {
  WCollapseSlot(defaultSlotBefore) : super(defaultSlotBefore);

  @override
  setDefaultSlot() {
    if (defaultSlotBefore is Widget) {
      defaultSlot = [itemWrapper(defaultSlotBefore, 0)];
    } else if (defaultSlotBefore is List<Widget>) {
      defaultSlot = List.generate(defaultSlotBefore.length, (index) {
        return itemWrapper(defaultSlotBefore[index], index);
      });
    } else {
      defaultSlot = <WCollapseItem>[];
      setDefaultSlotSub();
    }
  }

  WCollapseItem itemWrapper(Widget child, i) {
    if (child is WCollapseItem) {
      return child;
    } else {
      return WCollapseItem(
        props: WCollapseItemProp(name: i, title: ''),
        slots: WCollapseItemSlot(child),
      );
    }
  }
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
class WCollapseItem extends StatefulWidget
    implements
        BaseWidget<WCollapseItemOn, WCollapseItemProp, WCollapseItemSlot,
            WCollapseItemStyle> {
  @override
  late final WCollapseItemOn $on;

  @override
  late final WCollapseItemProp $props;

  @override
  late final WCollapseItemSlot $slots;

  @override
  late final WCollapseItemStyle $style;

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
  }

  @override
  State<WCollapseItem> createState() => _WCollapseItemState();
}

class _WCollapseItemState extends State<WCollapseItem>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;

  late Animation<double> iconAngle;

  late Animation<double> bodyHeight;

  late Animation<double> bodyOpacity;

  @override
  void initState() {
    widget.$props._expanded.addListener(() {
      if (widget.$props._expanded.value) {
        expandController.forward();
      } else {
        expandController.reverse();
      }
    });

    expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    expandController.addListener(updateView);
    iconAngle = Tween(begin: 0.0, end: pi / 2).animate(expandController);

    bodyOpacity = Tween(begin: 0.0, end: 1.0).animate(expandController);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        bodyHeight = Tween(
          begin: 0.0,
          end: (scrollKey.currentContext)?.size?.height ?? 100.0,
        ).animate(expandController);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.$props._expanded.dispose();
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title,
        body,
      ],
    );
  }

  Widget get title {
    var titleContent =
        widget.$slots.title?.call(widget.$props) ?? Text(widget.$props.title);
    return InkWell(
      onTap: () {
        print('---------');
        widget.$props._expanded.value = !widget.$props._expanded.value;
        print(widget.$props._expanded.value);
      },
      child: SizedBox(
        height: titleHeight,
        child: Row(
          children: [
            Expanded(child: titleContent),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Transform.rotate(
                angle: iconAngle.value,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  GlobalKey scrollKey = GlobalKey();
  Widget get body {
    return borderWrapper(
      Opacity(
        opacity: bodyOpacity.value,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: bodyHeight.value),
          child: Padding(
            padding: EdgeInsets.only(bottom: bodyPaddingBottom),
            child: SingleChildScrollView(
              child: FractionallySizedBox(
                widthFactor: 1,
                child: Column(
                  key: scrollKey,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: widget.$slots.defaultSlot ?? [],
                ),
              ),
            ),
          ),
        ),
      ),
      Border(bottom: border),
      true,
    );
  }

  updateView() {
    setState(() {});
  }

  BorderSide get border {
    return BorderSide(
        color: borderColor, width: borderWidth, style: borderStyle);
  }

  double get titleHeight {
    return 48;
  }

  double get bodyPaddingBottom {
    return 25;
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

class WCollapseItemOn extends BaseOn {}

class WCollapseItemProp extends BaseProp {
  late dynamic name;
  late String title;
  late bool disabled;
  final ValueNotifier<bool> _expanded = ValueNotifier(false);
  WCollapseItemProp({this.name, this.title = '', this.disabled = false});
}

class WCollapseItemSlot extends BaseSlot {
  Widget Function(dynamic)? title;
  WCollapseItemSlot(defaultSlotBefore, {this.title}) : super(defaultSlotBefore);
}
