import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WCascader extends StatelessWidget
    implements BaseWidget<WCascaderOn, WCascaderProp, WCascaderSlot> {
  @override
  late final WCascaderOn $on;

  @override
  late final WCascaderProp $props;

  @override
  late final WCascaderSlot $slots;

  WCascader({
    Key? key,
    WCascaderOn? on,
    WCascaderProp? props,
    WCascaderSlot? slots,
  }) : super(key: key) {
    $on = on ?? WCascaderOn();
    $props = props ?? WCascaderProp();
    $slots = slots ?? WCascaderSlot();
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
  /**
      value / v-model	选中项绑定值	-	—	—
      options	可选项数据源，键名可通过 Props 属性配置	array	—	—
      props	配置选项，具体见下表	object	—	—
      size	尺寸	string	medium / small / mini	—
      placeholder	输入框占位文本	string	—	请选择
      disabled	是否禁用	boolean	—	false
      clearable	是否支持清空选项	boolean	—	false
      show-all-levels	输入框中是否显示选中值的完整路径	boolean	—	true
      collapse-tags	多选模式下是否折叠Tag	boolean	-	false
      separator	选项分隔符	string	—	斜杠' / '
      filterable	是否可搜索选项	boolean	—	—
      filter-method	自定义搜索逻辑，第一个参数是节点node，第二个参数是搜索关键词keyword，通过返回布尔值表示是否命中	function(node, keyword)	-	-
      debounce	搜索关键词输入的去抖延迟，毫秒	number	—	300
      before-filter	筛选之前的钩子，参数为输入的值，若返回 false 或者返回 Promise 且被 reject，则停止筛选	function(value)	—	—
      popper-class	自定义浮层类名	string	—	—
   */
  dynamic value;
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
  late List<dynamic> Function(dynamic, String) filterMethod;
  late double debounce;
  late List<dynamic> Function(dynamic)? beforeFilter;
  late String poperClass;
}

class WCascaderSlot extends BaseSlot {
  /**
      -	自定义备选项的节点内容，参数为 { node, data }，分别为当前节点的 Node 对象和数据
      empty	无匹配选项时的内容
   */
}
