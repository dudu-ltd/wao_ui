import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

class WCascader extends StatefulWidget
    implements
        BaseWidget<WCascaderOn, WCascaderProp, WCascaderSlot, WCascaderStyle> {
  @override
  late final WCascaderOn $on;
  @override
  late final WCascaderProp $props;
  @override
  late final WCascaderSlot $slots;
  @override
  late final WCascaderStyle $style;

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
  _WCascaderState createState() => _WCascaderState();
}

class _WCascaderState extends State<WCascader> {
  @override
  Widget build(BuildContext context) {
    return WSelect(
      panelInsideBuilder: (parent, state) {
        return WCascaderPanel(
          props: WCascaderPanelProp(
            value: widget.$props._valueListener,
            options: widget.$props.options,
          ),
        );
      },
      props: widget.$props,
      style: WSelectStyle(panelMaxWidth: 600),
    );
  }
}

class WCascaderOn extends WSelectOn {
  /**
      change	当选中节点变化时触发	选中节点的值
      expand-change	当展开节点发生变化时触发	各父级选项值组成的数组
      blur	当失去焦点时触发	(event: Event)
      focus	当获得焦点时触发	(event: Event)
      visible-change	下拉框出现/隐藏时触发	出现则为 true，隐藏则为 false
      remove-tag	在多选模式下，移除Tag时触发	移除的Tag对应的节点的值
   */
  WCascaderOn({
    click,
    blur,
    focus,
    change,
    input,
    clear,
  }) : super(
          click: click,
          blur: blur,
          focus: focus,
          change: change,
          input: input,
          clear: clear,
        );
}

class WCascaderProp extends WSelectProp {
  late List<dynamic> options;
  late Map<String, dynamic> props;
  late bool showAllLevels;
  late String separator;
  late num debounce;
  List<dynamic> Function(dynamic)? beforeFilter;
  late ValueNotifier<dynamic> _valueListener;

  WCascaderProp({
    dynamic value,
    required this.options,
    Map<String, dynamic>? props,
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
    /**
     * 
     */
  }) : super(
          value: value,
          size: size,
          placeholder: placeholder,
          disabled: disabled,
          clearable: clearable,
          collapseTags: collapseTags,
          filterable: filterable,
          popperClass: popperClass,
          multiple: props?['multiple'],
        ) {
    _valueListener = ValueNotifier(null);
    this.value = value;
    this.props = props ?? {};
    this.showAllLevels = showAllLevels ?? true;
    this.separator = separator ?? '/';
    this.filterMethod = filterMethod;
    this.debounce = debounce ?? 300;
    this.beforeFilter = beforeFilter;
  }
}

class WCascaderSlot extends BaseSlot {
  /**
      -	自定义备选项的节点内容，参数为 { node, data }，分别为当前节点的 Node 对象和数据
      empty	无匹配选项时的内容
   */
  WCascaderSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WCascaderPanel extends StatefulWidget
    implements
        BaseWidget<WCascaderPanelOn, WCascaderPanelProp, WCascaderPanelSlot,
            WCascaderPanelStyle> {
  @override
  late final WCascaderPanelOn $on;

  @override
  late final WCascaderPanelProp $props;

  @override
  late final WCascaderPanelSlot $slots;

  @override
  late final WCascaderPanelStyle $style;

  WCascaderPanel({
    Key? key,
    WCascaderPanelOn? on,
    WCascaderPanelProp? props,
    WCascaderPanelSlot? slots,
    WCascaderPanelStyle? style,
  }) : super(key: key) {
    $on = on ?? WCascaderPanelOn();
    $props = props ?? WCascaderPanelProp(options: []);
    $slots = slots ?? WCascaderPanelSlot(null);
    $style = style ?? WCascaderPanelStyle();
  }

  @override
  _WCascaderPanelState createState() => _WCascaderPanelState();
}

class _WCascaderPanelState extends State<WCascaderPanel> {
  List panelData = [];

  @override
  void initState() {
    panelData.add(widget.$props.options);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(panelData.length, (index) {
        var levelPanel = panelData[index];
        return borderWrapper(
          levelPanelBuild(levelPanel, index),
          Border(right: BorderSide(color: levelBorderColor)),
          index < panelData.length,
        );
      }),
    );
  }

  Widget levelPanelBuild(List<Map<String, dynamic>> levelPanelData, int level) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: levelPanelMaxWidth,
        // minWidth: levelPanelMinWidth,
        maxHeight: 274,
      ),
      width: levelPanelMinWidth,
      child: ListView(
        children: List.generate(
          levelPanelData.length,
          (index) => panelNodeBuild(levelPanelData[index], level),
        ),
      ),
    );
  }

  Widget panelNodeBuild(Map<String, dynamic> option, int level) {
    return WOption(
      props: WOptionProp(
        $valueListener: widget.$props.value,
        label: option['label'],
        value: option['value'],
      ),
      on: WOptionOn(
        click: (e) {
          var nextLevel = option['children'];
          if (nextLevel != null) {
            panelData = panelData.sublist(0, level + 1);
            panelData.add(option['children']);
            setState(() {});
          }
        },
      ),
    );
  }

  Color get levelBorderColor {
    return widget.$style.levelBorderColor ??
        cfgGlobal.cascaderPanel.levelBorderColor ??
        Colors.grey.shade200;
  }

  double get levelPanelMaxWidth {
    return widget.$style.maxWidth ?? cfgGlobal.cascaderPanel.maxWidth ?? 275.0;
  }

  double get levelPanelMinWidth {
    return widget.$style.minWidth ?? cfgGlobal.cascaderPanel.minWidth ?? 180.0;
  }
}

class WCascaderPanelOn extends BaseOn {}

class WCascaderPanelProp extends BaseProp {
  late ValueNotifier<dynamic> value;
  late List<dynamic> options;
  late Map<String, dynamic> props;
  WCascaderPanelProp({
    ValueNotifier<dynamic>? value,
    required this.options,
    Map<String, dynamic>? props,
  }) {
    this.value = value ?? ValueNotifier('');
    this.props = props ?? {};
  }
}

class WCascaderPanelSlot extends BaseSlot {
  WCascaderPanelSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
