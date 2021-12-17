import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WProgress extends StatelessWidget
    implements BaseWidget<WProgressOn, WProgressProp, WProgressSlot> {
  @override
  late final WProgressOn $on;

  @override
  late final WProgressProp $props;

  @override
  late final WProgressSlot $slots;

  WProgress({
    Key? key,
    WProgressOn? on,
    WProgressProp? props,
    WProgressSlot? slots,
  }) : super(key: key) {
    $on = on ?? WProgressOn();
    $props = props ?? WProgressProp();
    $slots = slots ?? WProgressSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${$props.percentage}'),
    );
  }
}

class WProgressOn extends BaseOn {}

class WProgressProp extends BaseProp {
  late num percentage;
  late String type;
  late num strokeWidth;
  late bool textInside;
  late String? status;
  late dynamic color;
  late num width;
  late bool showText;
  late String strokeLinecap;
  late Function(num)? format;
  WProgressProp({
    percentage,
    type,
    strokeWidth,
    textInside,
    status,
    color,
    width,
    showText,
    strokeLinecap,
    format,
  }) {
    this.percentage = percentage ?? 0;
    this.type = type ?? 'line';
    this.strokeWidth = strokeWidth ?? 6;
    this.textInside = textInside ?? false;
    this.status = status;
    this.color = color;
    this.width = width ?? 126;
    this.showText = showText ?? true;
    this.strokeLinecap = strokeLinecap ?? 'round';
    this.format = format;
  }
}

class WProgressSlot extends BaseSlot {}
