import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WCascader extends StatelessWidget
    implements
        BaseWidget<WCascaderOn, WCascaderProp, WCascaderSlot, WCascaderStyle> {
  @override
  late final WCascaderOn $on;
  @override
  late final WCascaderProp $props;
  @override
  late final WCascaderSlot $slots;
  @override
  late WCascaderStyle $style;

  WCascader({
    Key? key,
    WCascaderOn? on,
    WCascaderProp? props,
    WCascaderSlot? slots,
    WCascaderStyle? style,
  }) : super(key: key) {
    $on = on ?? WCascaderOn();
    $props = props ?? WCascaderProp(options: []);
    $slots = slots ?? WCascaderSlot(null);
    $style = style ?? WCascaderStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCascaderOn extends BaseOn {
  /**
      change	当选中节点变化时触发	选中节点的值
      expand-change	当展开节点发生变化时触发	各父级选项值组成的数组
      blur	当失去焦点时触发	(event: Event)
      focus	当获得焦点时触发	(event: Event)
      visible-change	下拉框出现/隐藏时触发	出现则为 true，隐藏则为 false
      remove-tag	在多选模式下，移除Tag时触发	移除的Tag对应的节点的值
   */
}

class WCascaderProp extends BaseProp {
  late ValueNotifier<dynamic> value;
  late List<dynamic> options;
  late Map<String, dynamic> props;
  late String size;
  late String placeholder;
  late bool disabled;
  late bool clearable;
  late bool showAllLevels;
  late bool collapseTags;
  late String separator;
  late bool filterable;
  List<dynamic> Function(dynamic, String)? filterMethod;
  late num debounce;
  List<dynamic> Function(dynamic)? beforeFilter;
  String? popperClass;

  WCascaderProp({
    ValueNotifier<dynamic>? value,
    required this.options,
    dynamic props,
    String? size,
    String? placeholder,
    bool? disabled,
    bool? clearable,
    bool? showAllLevels,
    bool? collapseTags,
    String? separator,
    bool? filterable,
    List<dynamic> Function(dynamic, String)? filterMethod,
    num? debounce,
    List<dynamic> Function(dynamic)? beforeFilter,
    String? popperClass,
  }) {
    this.value = value ?? ValueNotifier('');
    this.props = props;
    this.size = size ?? 'medium';
    this.placeholder = placeholder ?? '请选择';
    this.disabled = disabled ?? false;
    this.clearable = clearable ?? false;
    this.showAllLevels = showAllLevels ?? true;
    this.collapseTags = collapseTags ?? false;
    this.separator = separator ?? '/';
    this.filterable = filterable ?? false;
    this.filterMethod = filterMethod;
    this.debounce = debounce ?? 300;
    this.beforeFilter = beforeFilter;
    this.popperClass = popperClass;
  }
}

class WCascaderSlot extends BaseSlot {
  /**
      -	自定义备选项的节点内容，参数为 { node, data }，分别为当前节点的 Node 对象和数据
      empty	无匹配选项时的内容
   */
  WCascaderSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
