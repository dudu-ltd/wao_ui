import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WSwitch extends StatelessWidget
    implements BaseWidget<WSwitchOn, WSwitchProp, WSwitchSlot> {
  @override
  late final WSwitchOn $on;

  @override
  late final WSwitchProp $props;

  @override
  late final WSwitchSlot $slots;

  WSwitch({
    Key? key,
    WSwitchOn? on,
    WSwitchProp? props,
    WSwitchSlot? slots,
  }) : super(key: key) {
    $on = on ?? WSwitchOn();
    $props = props ?? WSwitchProp();
    $slots = slots ?? WSwitchSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  /**
      focus	使 Switch 获取焦点	-
   */
}

class WSwitchOn extends BaseOn {
  /**
      change	switch 状态发生变化时的回调函数	新状态的值
   */
}

class WSwitchProp extends BaseProp {
  /**
      value / v-model	绑定值	boolean / string / number	—	—
      disabled	是否禁用	boolean	—	false
      width	switch 的宽度（像素）	number	—	40
      active-icon-class	switch 打开时所显示图标的类名，设置此项会忽略 active-text	string	—	—
      inactive-icon-class	switch 关闭时所显示图标的类名，设置此项会忽略 inactive-text	string	—	—
      active-text	switch 打开时的文字描述	string	—	—
      inactive-text	switch 关闭时的文字描述	string	—	—
      active-value	switch 打开时的值	boolean / string / number	—	true
      inactive-value	switch 关闭时的值	boolean / string / number	—	false
      active-color	switch 打开时的背景色	string	—	#409EFF
      inactive-color	switch 关闭时的背景色	string	—	#C0CCDA
      name	switch 对应的 name 属性	string	—	—
      validate-event	改变 switch 状态时是否触发表单的校验	boolean	-	true
   */
}

class WSwitchSlot extends BaseSlot {}
