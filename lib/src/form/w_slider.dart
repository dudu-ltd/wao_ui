import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WSlider extends StatelessWidget
    implements BaseWidget<WSliderOn, WSliderProp, WSliderSlot> {
  @override
  late final WSliderOn $on;

  @override
  late final WSliderProp $props;

  @override
  late final WSliderSlot $slots;

  WSlider({
    Key? key,
    WSliderOn? on,
    WSliderProp? props,
    WSliderSlot? slots,
  }) : super(key: key) {
    $on = on ?? WSliderOn();
    $props = props ?? WSliderProp();
    $slots = slots ?? WSliderSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WSliderOn extends BaseOn {
  /**
      change	值改变时触发（使用鼠标拖曳时，只在松开鼠标后触发）	改变后的值
      input	数据改变时触发（使用鼠标拖曳时，活动过程实时触发）	改变后的值
   */
}

class WSliderProp extends BaseProp {
  late ValueNotifier<num> value;
  late num min;
  late num max;
  late bool disabled;
  late num step;
  late bool showInput;
  late bool showInputControls;
  late String inputSize;
  late bool showStops;
  late bool showTooltip;
  String Function(num)? formatTooltip;
  late bool range;
  late bool vertical;
  String? height;
  String? label;
  late num debounce;
  String? tooltipClass;
  late dynamic marks;

  WSliderProp({
    ValueNotifier<num>? value,
    num? min,
    num? max,
    bool? disabled,
    num? step,
    bool? showInput,
    bool? showInputControls,
    String? inputSize,
    bool? showStops,
    bool? showTooltip,
    String Function(num)? formatTooltip,
    bool? range,
    bool? vertical,
    String? height,
    String? label,
    num? debounce,
    String? tooltipClass,
    dynamic marks,
  }) {
    this.value = value ?? ValueNotifier<num>(0);
    this.min = min ?? 0;
    this.max = max ?? 100;
    this.disabled = disabled ?? false;
    this.step = step ?? 1;
    this.showInput = showInput ?? false;
    this.showInputControls = showInputControls ?? true;
    this.inputSize = inputSize ?? 'small';
    this.showStops = showStops ?? false;
    this.showTooltip = showTooltip ?? true;
    this.formatTooltip = formatTooltip;
    this.range = range ?? false;
    this.vertical = vertical ?? false;
    this.height = height;
    this.label = label;
    this.debounce = debounce ?? 300;
    this.tooltipClass = tooltipClass;
    this.marks = marks;
  }
}

class WSliderSlot extends BaseSlot {
  WSliderSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
