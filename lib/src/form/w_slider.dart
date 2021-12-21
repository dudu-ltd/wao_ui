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
  /**
      value / v-model	绑定值	number	—	0
      min	最小值	number	—	0
      max	最大值	number	—	100
      disabled	是否禁用	boolean	—	false
      step	步长	number	—	1
      show-input	是否显示输入框，仅在非范围选择时有效	boolean	—	false
      show-input-controls	在显示输入框的情况下，是否显示输入框的控制按钮	boolean	—	true
      input-size	输入框的尺寸	string	large / medium / small / mini	small
      show-stops	是否显示间断点	boolean	—	false
      show-tooltip	是否显示 tooltip	boolean	—	true
      format-tooltip	格式化 tooltip message	function(value)	—	—
      range	是否为范围选择	boolean	—	false
      vertical	是否竖向模式	boolean	—	false
      height	Slider 高度，竖向模式时必填	string	—	—
      label	屏幕阅读器标签	string	—	—
      debounce	输入时的去抖延迟，毫秒，仅在show-input等于true时有效	number	—	300
      tooltip-class	tooltip 的自定义类名	string	—	—
      marks	标记， key 的类型必须为 number 且取值在闭区间 [min, max] 内，每个标记可以单独设置样式	object	—	—
   */
}

class WSliderSlot extends BaseSlot {
  WSliderSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
