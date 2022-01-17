import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WSelect extends StatelessWidget
    implements BaseWidget<WSelectOn, WSelectProp, WSelectSlot> {
  @override
  late final WSelectOn $on;

  @override
  late final WSelectProp $props;

  @override
  late final WSelectSlot $slots;

  WSelect({
    Key? key,
    WSelectOn? on,
    WSelectProp? props,
    WSelectSlot? slots,
  }) : super(key: key) {
    $on = on ?? WSelectOn();
    $props = props ?? WSelectProp();
    $slots = slots ?? WSelectSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  /**
      focus	使 input 获取焦点	-
      blur	使 input 失去焦点，并隐藏下拉框	-
   */
}

class WSelectOn extends BaseOn {
  /**
      change	选中值发生变化时触发	目前的选中值
      visible-change	下拉框出现/隐藏时触发	出现则为 true，隐藏则为 false
      remove-tag	多选模式下移除tag时触发	移除的tag值
      clear	可清空的单选模式下用户点击清空按钮时触发	—
      blur	当 input 失去焦点时触发	(event: Event)
      focus	当 input 获得焦点时触发	(event: Event)
   */
}

class WSelectProp extends BaseProp {
  late ValueNotifier<dynamic> value;
  late bool multiple;
  late bool disabled;
  late String valueKey;
  String? size;
  late bool clearable;
  late bool collapseTags;
  late num multipleLimit;
  String? name;
  late String autocomplete;
  late String autoComplete;
  late String placeholder;
  late bool filterable;
  late bool allowCreate;
  Function? filterMethod;
  late bool remote;
  Function? remoteMethod;
  late bool loading;
  late String loadingText;
  late String noMatchText;
  late String noDataText;
  String? popperClass;
  late bool reserveKeyword;
  late bool defaultFirstOption;
  late bool popperAppendToBody;
  late bool automaticDropdown;

  WSelectProp({
    ValueNotifier<dynamic>? value,
    bool? multiple,
    bool? disabled,
    String? valueKey,
    String? size,
    bool? clearable,
    bool? collapseTags,
    num? multipleLimit,
    String? name,
    String? autocomplete,
    String? autoComplete,
    String? placeholder,
    bool? filterable,
    bool? allowCreate,
    Function? filterMethod,
    bool? remote,
    Function? remoteMethod,
    bool? loading,
    String? loadingText,
    String? noMatchText,
    String? noDataText,
    String? popperClass,
    bool? reserveKeyword,
    bool? defaultFirstOption,
    bool? popperAppendToBody,
    bool? automaticDropdown,
  }) {
    this.value = value ?? ValueNotifier('');
    this.multiple = multiple ?? false;
    this.disabled = disabled ?? false;
    this.valueKey = valueKey ?? 'value';
    this.size = size;
    this.clearable = clearable ?? false;
    this.collapseTags = collapseTags ?? false;
    this.multipleLimit = multipleLimit ?? 0;
    this.name = name;
    this.autocomplete = autocomplete ?? 'off';
    this.autoComplete = autoComplete ?? 'off';
    this.placeholder = placeholder ?? '请选择';
    this.filterable = filterable ?? false;
    this.allowCreate = allowCreate ?? false;
    this.filterMethod = filterMethod;
    this.remote = remote ?? false;
    this.remoteMethod = remoteMethod;
    this.loading = loading ?? false;
    this.loadingText = loadingText ?? '加载中';
    this.noMatchText = noMatchText ?? '无匹配数据';
    this.noDataText = noDataText ?? '无数据';
    this.popperClass = popperClass;
    this.reserveKeyword = reserveKeyword ?? false;
    this.defaultFirstOption = defaultFirstOption ?? false;
    this.popperAppendToBody = popperAppendToBody ?? true;
    this.automaticDropdown = automaticDropdown ?? false;
  }
}

class WSelectSlot extends BaseSlot {
  /**
      —	Option 组件列表
      prefix	Select 组件头部内容
      empty	无选项时的列表
   */
  WSelectSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WOption extends StatelessWidget
    implements BaseWidget<WOptionOn, WOptionProp, WOptionSlot> {
  @override
  late final WOptionOn $on;

  @override
  late final WOptionProp $props;

  @override
  late final WOptionSlot $slots;

  WOption({
    Key? key,
    WOptionOn? on,
    WOptionProp? props,
    WOptionSlot? slots,
  }) : super(key: key) {
    $on = on ?? WOptionOn();
    $props = props ?? WOptionProp();
    $slots = slots ?? WOptionSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WOptionOn extends BaseOn {}

class WOptionProp extends BaseProp {}

class WOptionSlot extends BaseSlot {
  WOptionSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
