import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WDatePicker extends StatelessWidget
    implements BaseWidget<WDatePickerOn, WDatePickerProp, WDatePickerSlot> {
  @override
  late final WDatePickerOn $on;

  @override
  late final WDatePickerProp $props;

  @override
  late final WDatePickerSlot $slots;

  WDatePicker({
    Key? key,
    WDatePickerOn? on,
    WDatePickerProp? props,
    WDatePickerSlot? slots,
  }) : super(key: key) {
    $on = on ?? WDatePickerOn();
    $props = props ?? WDatePickerProp();
    $slots = slots ?? WDatePickerSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  /**
      focus	使 input 获取焦点	—
   */
}

class WDatePickerOn extends BaseOn {
  /**
      change	用户确认选定的值时触发	组件绑定值。格式与绑定值一致，可受 value-format 控制
      blur	当 input 失去焦点时触发	组件实例
      focus	当 input 获得焦点时触发	组件实例
   */
}

class WDatePickerProp extends BaseProp {
  /**
      value / v-model	绑定值	date(DatePicker) / array(DateRangePicker)	—	—
      readonly	完全只读	boolean	—	false
      disabled	禁用	boolean	—	false
      editable	文本框可输入	boolean	—	true
      clearable	是否显示清除按钮	boolean	—	true
      size	输入框尺寸	string	large, small, mini	—
      placeholder	非范围选择时的占位内容	string	—	—
      start-placeholder	范围选择时开始日期的占位内容	string	—	—
      end-placeholder	范围选择时结束日期的占位内容	string	—	—
      type	显示类型	string	year/month/date/dates/ week/datetime/datetimerange/ daterange/monthrange	date
      format	显示在输入框中的格式	string	见日期格式	yyyy-MM-dd
      align	对齐方式	string	left, center, right	left
      popper-class	DatePicker 下拉框的类名	string	—	—
      picker-options	当前时间日期选择器特有的选项参考下表	object	—	{}
      range-separator	选择范围时的分隔符	string	—	'-'
      default-value	可选，选择器打开时默认显示的时间	Date	可被new Date()解析	—
      default-time	范围选择时选中日期所使用的当日内具体时刻	string[]	数组，长度为 2，每项值为字符串，形如12:00:00，第一项指定开始日期的时刻，第二项指定结束日期的时刻，不指定会使用时刻 00:00:00	—
      value-format	可选，绑定值的格式。不指定则绑定值为 Date 对象	string	见日期格式	—
      name	原生属性	string	—	—
      unlink-panels	在范围选择器里取消两个日期面板之间的联动	boolean	—	false
      prefix-icon	自定义头部图标的类名	string	—	el-icon-date
      clear-icon	自定义清空图标的类名	string	—	el-icon-circle-close
      validate-event	输入时是否触发表单的校验	boolean	-	true
   */
}

class WDatePickerSlot extends BaseSlot {}
