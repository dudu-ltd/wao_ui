import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WInput extends StatelessWidget
    implements BaseWidget<WInputOn, WInputProp, WInputSlot> {
  @override
  late final WInputOn $on;

  @override
  late final WInputProp $props;

  @override
  late final WInputSlot $slots;

  WInput({
    Key? key,
    WInputOn? on,
    WInputProp? props,
    WInputSlot? slots,
  }) : super(key: key) {
    $on = on ?? WInputOn();
    $props = props ?? WInputProp();
    $slots = slots ?? WInputSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  /**
      focus	使 input 获取焦点	—
      blur	使 input 失去焦点	—
      select	选中 input 中的文字	—
   */
}

class WInputOn extends BaseOn {
  /**
      blur	在 Input 失去焦点时触发	(event: Event)
      focus	在 Input 获得焦点时触发	(event: Event)
      change	仅在输入框失去焦点或用户按下回车时触发	(value: string | number)
      input	在 Input 值改变时触发	(value: string | number)
      clear	在点击由 clearable 属性生成的清空按钮时触发	—
   */
}

class WInputProp extends BaseProp {
  late String type;
  late ValueNotifier<dynamic> value;
  late int maxlength;
  late int minlength;
  late bool showWordLimit;
  late String placeholder;
  late bool clearable;
  late bool showPassword;
  late bool disabled;
  late String size;
  late IconData prefixIcon;
  late IconData suffixIcon;
  late int rows;
  late bool autosize;
  late String autocomplete;
  late String autoComplete;
  late String name;
  late bool readonly;
  late String max;
  late String min;
  late String step;
  late String resize;
  late bool autofocus;
  late String form;
  late String label;
  late String tabindex;
  late bool validateEvent;
  WInputProp({
    type,
    value,
    maxlength,
    minlength,
    showWordLimit,
    placeholder,
    clearable,
    showPassword,
    disabled,
    size,
    prefixIcon,
    suffixIcon,
    rows,
    autosize,
    autocomplete,
    autoComplete,
    name,
    readonly,
    max,
    min,
    step,
    resize,
    autofocus,
    form,
    label,
    tabindex,
    validateEvent,
  }) {
    this.type = type ?? 'text';
    this.value = value;
    this.maxlength = maxlength;
    this.minlength = minlength;
    this.showWordLimit = showWordLimit ?? false;
    this.placeholder = placeholder;
    this.clearable = clearable ?? false;
    this.showPassword = showPassword ?? false;
    this.disabled = disabled ?? false;
    this.size = size;
    this.prefixIcon = prefixIcon;
    this.suffixIcon = suffixIcon;
    this.rows = rows ?? 2;
    this.autosize = autosize ?? false;
    this.autocomplete = autocomplete ?? 'off';
    this.autoComplete = autoComplete ?? 'off';
    this.name = name;
    this.readonly = readonly ?? false;
    this.max = max;
    this.min = min;
    this.step = step;
    this.resize = resize;
    this.autofocus = autofocus ?? false;
    this.form = form;
    this.label = label;
    this.tabindex = tabindex;
    this.validateEvent = validateEvent ?? true;
  }
}

class WInputSlot extends BaseSlot {
  /**
      prefix	输入框头部内容，只对 type="text" 有效
      suffix	输入框尾部内容，只对 type="text" 有效
      prepend	输入框前置内容，只对 type="text" 有效
      append	输入框后置内容，只对 type="text" 有效
   */
  WInputSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
