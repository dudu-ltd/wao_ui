import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WDateTimePicker extends StatelessWidget
    implements
        BaseWidget<WDateTimePickerOn, WDateTimePickerProp,
            WDateTimePickerSlot> {
  @override
  late final WDateTimePickerOn $on;

  @override
  late final WDateTimePickerProp $props;

  @override
  late final WDateTimePickerSlot $slots;

  WDateTimePicker({
    Key? key,
    WDateTimePickerOn? on,
    WDateTimePickerProp? props,
    WDateTimePickerSlot? slots,
  }) : super(key: key) {
    $on = on ?? WDateTimePickerOn();
    $props = props ?? WDateTimePickerProp();
    $slots = slots ?? WDateTimePickerSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
  /**
      focus	使 input 获取焦点	—
   */
}

class WDateTimePickerOn extends BaseOn {
  /**
      change	用户确认选定的值时触发	组件绑定值。格式与绑定值一致，可受 value-format 控制
      blur	当 input 失去焦点时触发	组件实例
      focus	当 input 获得焦点时触发	组件实例
   */
}

class WDateTimePickerProp extends BaseProp {
  late ValueNotifier<Object> value;
  late bool readonly;
  late bool disabled;
  late bool editable;
  late bool clearable;
  String? size;
  String? placeholder;
  String? startPlaceholder;
  String? endPlaceholder;
  late bool timeArrowControl;
  late String type;
  late String format;
  late String align;
  String? popperClass;
  Object? pickerOptions;
  late String rangeSeparator;
  DateTime? defaultValue;
  Object? defaultTime;
  String? valueFormat;
  String? name;
  late bool unlinkPanels;
  IconData? prefixIcon;
  IconData? clearIcon;
  WDateTimePickerProp({
    ValueNotifier<Object>? value,
    bool? readonly,
    bool? disabled,
    bool? editable,
    bool? clearable,
    String? size,
    String? placeholder,
    String? startPlaceholder,
    String? endPlaceholder,
    bool? timeArrowControl,
    String? type,
    String? format,
    String? align,
    String? popperClass,
    Object? pickerOptions,
    String? rangeSeparator,
    DateTime? defaultValue,
    Object? defaultTime,
    String? valueFormat,
    String? name,
    bool? unlinkPanels,
    IconData? prefixIcon,
    IconData? clearIcon,
  }) {
    this.value = value ?? ValueNotifier<Object>([]);
    this.readonly = readonly ?? false;
    this.disabled = disabled ?? false;
    this.editable = editable ?? true;
    this.clearable = clearable ?? true;
    this.size = size;
    this.placeholder = placeholder;
    this.startPlaceholder = startPlaceholder;
    this.endPlaceholder = endPlaceholder;
    this.timeArrowControl = timeArrowControl ?? false;
    this.type = type ?? 'date';
    this.format = format ?? 'yyyy-MM-dd HH:mm:ss';
    this.align = align ?? 'left';
    this.popperClass = popperClass;
    this.pickerOptions = pickerOptions ?? {};
    this.rangeSeparator = rangeSeparator ?? '-';
    this.defaultValue = defaultValue;
    this.defaultTime = defaultTime;
    this.valueFormat = valueFormat;
    this.name = name;
    this.unlinkPanels = unlinkPanels ?? false;
    this.prefixIcon = prefixIcon;
    this.clearIcon = clearIcon;
  }
}

class WDateTimePickerSlot extends BaseSlot {
  /**
      range-separator	自定义分隔符
   */
  WDateTimePickerSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
