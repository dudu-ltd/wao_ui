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
  /**
      value / v-model	绑定值	number	—	0
      min	设置计数器允许的最小值	number	—	-Infinity
      max	设置计数器允许的最大值	number	—	Infinity
      step	计数器步长	number	—	1
      step-strictly	是否只能输入 step 的倍数	boolean	—	false
      precision	数值精度	number	—	—
      size	计数器尺寸	string	large, small	—
      disabled	是否禁用计数器	boolean	—	false
      controls	是否使用控制按钮	boolean	—	true
      controls-position	控制按钮位置	string	right	-
      name	原生属性	string	—	—
      label	输入框关联的label文字	string	—	—
      placeholder	输入框默认 placeholder	string	-	-
   */
}

class WInputNumberSlot extends BaseSlot {
  WInputNumberSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
