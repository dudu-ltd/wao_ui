import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WDatePicker extends StatelessWidget
    with
        BaseMixins<WDatePickerOn, WDatePickerProp, WDatePickerSlot,
            WDatePickerStyle> {
  WDatePicker({
    Key? key,
    WDatePickerOn? on,
    WDatePickerProp? props,
    WDatePickerSlot? slots,
    WDatePickerStyle? style,
  }) : super(key: key) {
    $on = on ?? WDatePickerOn();
    $props = props ?? WDatePickerProp();
    $slots = slots ?? WDatePickerSlot(null);
    $style = style ?? WDatePickerStyle();
    init();
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
  late ValueNotifier<DateTime> value;
  late bool readonly;
  late bool disabled;
  late bool editable;
  late bool clearable;
  String? size;
  String? placeholder;
  String? startPlaceholder;
  String? endPlaceholder;
  late String type;
  late String format;
  late String align;
  String? popperClass;
  late Object pickerOptions;
  late String rangeSeparator;
  DateTime? defaultValue;
  late List<String> defaultTime;
  String? valueFormat;
  String? name;
  late bool unlinkPanels;
  IconData? prefixIcon;
  IconData? clearIcon;
  late bool validateEvent;
  WDatePickerProp({
    ValueNotifier<DateTime>? value,
    bool? readonly,
    bool? disabled,
    bool? editable,
    bool? clearable,
    String? size,
    String? placeholder,
    String? startPlaceholder,
    String? endPlaceholder,
    String? type,
    String? format,
    bool? isRange,
    bool? arrowControl,
    String? align,
    String? popperClass,
    Object? pickerOptions,
    String? rangeSeparator,
    String? valueFormat,
    DateTime? defaultValue,
    String? name,
    IconData? prefixIcon,
    IconData? clearIcon,
    bool? validateEvent,
  }) {
    this.value = value ?? ValueNotifier(DateTime.now());
    this.readonly = readonly ?? false;
    this.disabled = disabled ?? false;
    this.editable = editable ?? true;
    this.clearable = clearable ?? true;
    this.size = size;
    this.placeholder = placeholder;
    this.startPlaceholder = startPlaceholder;
    this.endPlaceholder = endPlaceholder;
    this.type = type ?? 'date';
    this.format = format ?? 'yyyy-MM-dd';
    this.align = align ?? 'left';
    this.popperClass = popperClass;
    this.pickerOptions = pickerOptions ?? {};
    this.rangeSeparator = rangeSeparator ?? '-';
    this.defaultValue = defaultValue;
    this.defaultTime = defaultTime;
    this.valueFormat = valueFormat;
    this.name = name;
    this.unlinkPanels = unlinkPanels;
    this.prefixIcon = prefixIcon;
    this.clearIcon = clearIcon;
    this.validateEvent = validateEvent ?? true;
  }
}

class WDatePickerSlot extends BaseSlot {
  WDatePickerSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
