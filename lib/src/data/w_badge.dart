import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:simple_observable/simple_observable.dart';

class WBadge extends StatefulWidget
    with BaseMixins<WBadgeOn, WBadgeProp, WBadgeSlot, WBadgeStyle> {
  @override
  _WBadgeState createState() => _WBadgeState();

  WBadge(
    Widget? defaultSlot, {
    Key? key,
    WBadgeOn? on,
    WBadgeProp? props,
    WBadgeSlot? slots,
    WBadgeStyle? style,
  }) : super(key: key) {
    $on = on ?? WBadgeOn();
    $props = props ?? WBadgeProp();
    $slots = slots ?? WBadgeSlot(defaultSlot);
    $style = style ?? WBadgeStyle();
    init();
  }
}

class _WBadgeState extends State<WBadge> {
  @override
  Widget build(BuildContext context) {
    widget.$props._state = this;
    return Container(
      margin: EdgeInsets.only(right: widget.$props.isDot ? 3 : rightOffset + 3),
      child: Stack(
        children: [
          child,
          if ((widget.$props.isDot &&
                  (widget.$props.value is! String &&
                      widget.$props.value > 0)) ||
              !widget.$props.isDot)
            widget.$props.isDot ? dotBadge : badge,
        ],
        clipBehavior: Clip.none,
      ),
    );
  }

  Widget get dotBadge {
    return Positioned(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          color: cfgGlobal.color.val(widget.$props.type),
          padding: const EdgeInsets.all(4),
        ),
      ),
      right: -4,
      top: -4,
    );
  }

  Widget get badge {
    return Positioned(
      child: badgeWidget,
      right: -rightOffset,
      top: -topOffset,
    );
  }

  double get rightOffset {
    return paddingH * 2 +
        charWidth * badgeNum.length -
        paddingH -
        charWidth / 2;
  }

  double get topOffset {
    return paddingH + charWidth / 2;
  }

  double get paddingH {
    return charHeight / 1.5;
  }

  double get paddingV {
    return paddingH / 5;
  }

  double get charWidth {
    return cfgGlobal.badgeFont.size * 0.7;
  }

  double get charHeight {
    return cfgGlobal.badgeFont.size;
  }

  Widget get badgeWidget {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        color: cfgGlobal.color.val(widget.$props.type),
        padding: EdgeInsets.fromLTRB(paddingH, paddingV, paddingH, paddingV),
        child: Text(badgeNum, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  String get badgeNum {
    return widget.$props.isDot
        ? ''
        : widget.$props.value is String
            ? widget.$props.value
            : widget.$props.max > widget.$props.value
                ? '${widget.$props.value}'
                : '${widget.$props.max}+';
  }

  Widget get child {
    return widget.$slots.$;
  }

  update(e) {
    setState(() {});
  }
}

class WBadgeOn extends BaseOn {}

class WBadgeProp extends BaseProp {
  Observable? _valueListener;
  _WBadgeState? _state;

  set value(value) {
    _valueListener = Observable(
        initialValue: 0, onChanged: _state?.update, checkEquality: true);
    _valueListener!.value = value;
  }

  get value {
    return _valueListener!.value;
  }

  late int max;
  late bool isDot;
  late bool hidden;
  late String type;
  WBadgeProp({value, max, isDot, hidden, type}) {
    this.value = value ?? 0;
    this.max = max ?? 99;
    this.isDot = isDot ?? false;
    this.hidden = hidden ?? false;
    this.type = type ?? 'danger';
  }
}

class WBadgeSlot extends BaseSlot {
  WBadgeSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
