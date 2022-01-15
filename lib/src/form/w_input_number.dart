import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WInputNumber extends StatelessWidget
    implements BaseWidget<WInputNumberOn, WInputNumberProp, WInputNumberSlot> {
  @override
  late final WInputNumberOn $on;

  @override
  late final WInputNumberProp $props;

  @override
  late final WInputNumberSlot $slots;

  WInputNumber({
    Key? key,
    WInputNumberOn? on,
    WInputNumberProp? props,
    WInputNumberSlot? slots,
  }) : super(key: key) {
    $on = on ?? WInputNumberOn();
    $props = props ?? WInputNumberProp();
    $slots = slots ?? WInputNumberSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  /**
      focus	使 input 获取焦点	-
      select	选中 input 中的文字	—
   */
}

class WInputNumberOn extends BaseOn {
  /**
      change	绑定值被改变时触发	currentValue, oldValue
      blur	在组件 Input 失去焦点时触发	(event: Event)
      focus	在组件 Input 获得焦点时触发	(event: Event)
   */
}

class WInputNumberProp extends BaseProp {
  late ValueNotifier<num> value;
  late num min;
  late num max;
  late num step;
  late bool stepStrictly;
  num? precision;
  String? size;
  late bool disabled;
  late bool controls;
  String? controlsPosition;
  String? name;
  String? label;
  String? placeholder;
  WInputNumberProp({
    value,
    num? min,
    num? max,
    num? step,
    bool? stepStrictly,
    num? precision,
    String? size,
    bool? disabled,
    bool? controls,
    String? controlsPosition,
    String? name,
    String? label,
    String? placeholder,
  }) {
    this.value = value;
    this.min = min ?? -double.infinity;
    this.max = max ?? double.infinity;
    this.step = step ?? 1;
    this.stepStrictly = stepStrictly ?? false;
    this.precision = precision;
    this.size = size;
    this.disabled = disabled ?? false;
    this.controls = controls ?? true;
    this.controlsPosition = controlsPosition;
    this.name = name;
    this.label = label;
    this.placeholder = placeholder;
  }
}

class WInputNumberSlot extends BaseSlot {
  WInputNumberSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
