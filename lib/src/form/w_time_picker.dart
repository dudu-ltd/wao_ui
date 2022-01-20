import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WTimePicker extends StatelessWidget
    implements
        BaseWidget<WTimePickerOn, WTimePickerProp, WTimePickerSlot,
            WTimePickerStyle> {
  @override
  late final WTimePickerOn $on;
  @override
  late final WTimePickerProp $props;
  @override
  late final WTimePickerSlot $slots;
  @override
  late WTimePickerStyle $style;

  WTimePicker({
    Key? key,
    WTimePickerOn? on,
    WTimePickerProp? props,
    WTimePickerSlot? slots,
    WTimePickerStyle? style,
  }) : super(key: key) {
    $on = on ?? WTimePickerOn();
    $props = props ?? WTimePickerProp();
    $slots = slots ?? WTimePickerSlot(null);
    $style = style ?? WTimePickerStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  /**
      focus	使 input 获取焦点	-
   */
}

class WTimePickerOn extends BaseOn {
  /**
      change	用户确认选定的值时触发	组件绑定值
      blur	当 input 失去焦点时触发	组件实例
      focus	当 input 获得焦点时触发	组件实例
   */
}

class WTimePickerProp extends BaseProp {
  late ValueNotifier<Object> value;
  late bool readonly;
  late bool disabled;
  late bool editable;
  late bool clearable;
  String? size;
  String? placeholder;
  String? startPlaceholder;
  String? endPlaceholder;
  late bool isRange;
  late bool arrowControl;
  late String align;
  String? popperClass;
  late Object pickerOptions;
  late String rangeSeparator;
  late String valueFormat;
  Object? defaultValue;
  String? name;
  IconData? prefixIcon;
  IconData? clearIcon;
  WTimePickerProp({
    ValueNotifier<Object>? value,
    bool? readonly,
    bool? disabled,
    bool? editable,
    bool? clearable,
    String? size,
    String? placeholder,
    String? startPlaceholder,
    String? endPlaceholder,
    bool? isRange,
    bool? arrowControl,
    String? align,
    String? popperClass,
    Object? pickerOptions,
    String? rangeSeparator,
    String? valueFormat,
    Object? defaultValue,
    String? name,
    IconData? prefixIcon,
    IconData? clearIcon,
  }) {
    this.value = value ?? ValueNotifier('');
    this.readonly = readonly ?? false;
    this.disabled = disabled ?? false;
    this.editable = editable ?? true;
    this.clearable = clearable ?? true;
    this.size = size;
    this.placeholder = placeholder;
    this.startPlaceholder = startPlaceholder;
    this.endPlaceholder = endPlaceholder;
    this.isRange = isRange ?? false;
    this.arrowControl = arrowControl ?? false;
    this.align = align ?? 'left';
    this.popperClass = popperClass;
    this.pickerOptions = pickerOptions ?? {};
    this.rangeSeparator = rangeSeparator ?? '-';
    this.valueFormat = valueFormat ?? 'yyyy-MM-dd hh:mm:ss';
    this.defaultValue = defaultValue;
    this.name = name;
    this.prefixIcon = prefixIcon;
    this.clearIcon = clearIcon;
  }
}

class WTimePickerSlot extends BaseSlot {
  WTimePickerSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
