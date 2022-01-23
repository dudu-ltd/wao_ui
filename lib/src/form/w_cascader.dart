// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';
import '../../core/utils/color_util.dart';

var cascaderDefaultProp = {
  'expandTrigger': 'click', // or hover
  'multiple': false,
  'checkStrictly': false, // whether all nodes can be selected
  'emitPath':
      true, // wether to emit an array of all levels value in which node is located
  'lazy': false,
  'lazyLoad': () {},
  'value': 'value',
  'label': 'label',
  'children': 'children',
  'leaf': 'leaf',
  'disabled': 'disabled',
  'hoverThreshold': 500
};

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
            value: widget.$props.value,
            valueListener: parent.$props.$valueListener,
            options: widget.$props.options,
            props: widget.$props.props,
          ),
        );
      },
      props: widget.$props,
      style: WSelectStyle(panelMaxWidth: 300),
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
  late PanelPropDetail props;
  late bool showAllLevels;
  late String separator;
  late num debounce;
  List<dynamic> Function(dynamic)? beforeFilter;

  WCascaderProp({
    dynamic value,
    required this.options,
    PanelPropDetail? props,
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
        ) {
    $valueListener = ValueNotifier(null);
    this.props = props ?? PanelPropDetail();
    multiple = this.props.multiple;
    this.value = value;
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
  List menus = [];
  List panelPicked = [];

  @override
  void initState() {
    super.initState();
    menus.add(widget.$props.options);
  }

  trigger(WCascaderNode node) {
    var nextLevel = node.$props.props.getChildren(node.$props.option);
    if (nextLevel != null) {
      // 数据原始形态 [ 一级menu , [...动态添加二级、三级...] ]
      menus = menus.sublist(0, node.$props.level + 1);
      menus.add(nextLevel);
      // 选中值的原始形态 []
      panelPicked = panelPicked.sublist(0, node.$props.level);
      panelPicked.add(node.$props.option);
      setState(() {});
    }
  }

  click(WCascaderNode node) {
    var nextLevel = node.$props.props.getChildren(node.$props.option);
    // print(nextLevel);
    if (nextLevel == null) {
      panelPicked = panelPicked.sublist(0, node.$props.level);
      panelPicked.add(node.$props.option);
      setState(() {});
      widget.$props.value = selected();
      // widget.$props.$valueListener.notifyListeners();
    }
  }

  selected() {
    var result = [];
    for (var option in panelPicked) {
      result.add(widget.$props.props.getValue(option));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(menus.length, (index) {
        var levelPanel = menus[index];
        return WCascaderMenu(
          props: WCascaderMenuProp(
            picked: menus,
            pickedValue: panelPicked,
            options: levelPanel,
            level: index,
            props: widget.$props.props,
          ),
          style: widget.$style.cascaderMenu,
          on: WCascaderMenuOn(
            expand: trigger,
            click: click,
          ),
        );
      }),
    );
  }
}

class WCascaderPanelOn extends BaseOn {}

class WCascaderPanelProp extends WCascaderProp {
  WCascaderPanelProp({
    dynamic value,
    required List<dynamic> options,
    PanelPropDetail? props,
    ValueNotifier<dynamic>? valueListener,
  }) : super(
          options: options,
          props: props,
          value: value,
        ) {
    $valueListener = valueListener ?? ValueNotifier(null);
  }
}

class PanelPropDetail {
  late String expandTrigger;
  late bool multiple;
  late bool checkStrictly;
  late bool emitPath;
  late bool lazy;
  late Function(dynamic, dynamic) lazyLoad;
  late String value;
  late String label;
  late String children;
  late String leaf;
  late String disabled;
  late int hoverThreshold;

  PanelPropDetail({
    this.expandTrigger = 'click',
    this.multiple = false,
    this.checkStrictly = false,
    this.emitPath = true,
    this.lazy = false,
    void Function(dynamic, dynamic)? lazyLoad,
    this.value = 'value',
    this.label = 'label',
    this.children = 'children',
    this.leaf = 'leaf',
    this.disabled = 'disabled',
    this.hoverThreshold = 500,
  }) {
    this.lazyLoad = lazyLoad ?? (node, resolve) {};
  }

  bool get isExpandTriggerHover {
    return expandTrigger == 'hover';
  }

  bool isDisabled(Map<String, dynamic> option, {defaultValue = false}) {
    var disabledField = disabled;
    return option[disabledField] ?? defaultValue;
  }

  List? getChildren(Map<String, dynamic> option) {
    return option[children];
  }

  dynamic getValue(Map<String, dynamic> option) {
    return option[value];
  }
}

class WCascaderPanelSlot extends BaseSlot {
  WCascaderPanelSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WCascaderMenu extends StatelessWidget
    implements
        BaseWidget<WCascaderMenuOn, WCascaderMenuProp, WCascaderMenuSlot,
            WCascaderMenuStyle> {
  @override
  late final WCascaderMenuOn $on;

  @override
  late final WCascaderMenuProp $props;

  @override
  late final WCascaderMenuSlot $slots;

  @override
  late final WCascaderMenuStyle $style;

  WCascaderMenu({
    Key? key,
    WCascaderMenuOn? on,
    WCascaderMenuProp? props,
    WCascaderMenuSlot? slots,
    WCascaderMenuStyle? style,
  }) : super(key: key) {
    $on = on ?? WCascaderMenuOn();
    $props = props ?? WCascaderMenuProp(options: []);
    $slots = slots ?? WCascaderMenuSlot(null);
    $style = style ?? WCascaderMenuStyle();
  }

  @override
  Widget build(BuildContext context) {
    return borderWrapper(
      Container(
        constraints: BoxConstraints(
          maxWidth: menuMaxWidth,
          // minWidth: menuMinWidth,
          maxHeight: menuMaxHeight,
        ),
        width: menuMinWidth,
        child: ListView(
          children: List.generate(
            $props.options.length,
            (index) => WCascaderNode(
              props: WCascaderNodeProp(
                picked: $props.picked,
                pickedValue: $props.pickedValue,
                option: $props.options[index],
                level: $props.level,
                props: $props.props,
              ),
              on: WCascaderNodeOn(
                expand: $on.expand,
                click: $on.click,
              ),
            ),
          ),
        ),
      ),
      Border(right: BorderSide(color: menuBorderColor)),
      $props.level < $props.options.length,
    );
  }

  double get menuMaxWidth {
    return $style.maxWidth ?? cfgGlobal.cascaderMenu.maxWidth ?? 275.0;
  }

  double get menuMaxHeight {
    return $style.maxHeight ?? cfgGlobal.cascaderMenu.maxHeight ?? 275.0;
  }

  Color get menuBorderColor {
    return $style.borderColor ??
        cfgGlobal.cascaderMenu.borderColor ??
        Colors.grey.shade200;
  }

  double get menuMinWidth {
    return $style.minWidth ?? cfgGlobal.cascaderMenu.minWidth ?? 180.0;
  }
}

class WCascaderMenuOn extends BaseOn {
  Function(WCascaderNode)? expand;
  Function(WCascaderNode)? click;
  WCascaderMenuOn({this.expand, this.click});
}

class WCascaderMenuProp extends BaseProp {
  late List<Map<String, dynamic>> options;
  late List picked;
  late List pickedValue;
  late int level;
  late PanelPropDetail props;
  WCascaderMenuProp({
    required this.options,
    this.level = 0,
    this.picked = const [],
    this.pickedValue = const [],
    PanelPropDetail? props,
  }) {
    this.props = props ?? PanelPropDetail();
  }
}

class WCascaderMenuSlot extends BaseSlot {
  WCascaderMenuSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WCascaderNode extends StatelessWidget
    implements
        BaseWidget<WCascaderNodeOn, WCascaderNodeProp, WCascaderNodeSlot,
            WCascaderNodeStyle> {
  @override
  late final WCascaderNodeOn $on;

  @override
  late final WCascaderNodeProp $props;

  @override
  late final WCascaderNodeSlot $slots;

  @override
  late final WCascaderNodeStyle $style;

  bool get _isSelected {
    // print(
    //     '${$props.pickedValue} \n contains \n ${$props.option} \n is ${$props.pickedValue.contains($props.option)}');
    // print('======================');
    return $props.pickedValue.contains($props.option);
  }

  WCascaderNode({
    Key? key,
    WCascaderNodeOn? on,
    WCascaderNodeProp? props,
    WCascaderNodeSlot? slots,
    WCascaderNodeStyle? style,
  }) : super(key: key) {
    $on = on ?? WCascaderNodeOn();
    $props = props ?? WCascaderNodeProp(option: {});
    $slots = slots ?? WCascaderNodeSlot(null);
    $style = style ?? WCascaderNodeStyle();
  }

  @override
  Widget build(BuildContext context) {
    return MouseStateBuilder(
      builder: (context, state) {
        var disabled = $props.props.isDisabled($props.option);
        var item = Align(
          alignment: Alignment.centerLeft,
          child: ColoredBox(
            color: state.isMouseOver && !$props.props.isDisabled($props.option)
                ? ColorUtil.hexToColor('#f5f7fa')
                : const Color.fromARGB(0, 255, 255, 255),
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                child: itemText,
              ),
            ),
          ),
        );
        if (disabled) {
          return item;
        } else {
          return Listener(
            onPointerUp: clickCbk,
            onPointerHover: hoverCbk,
            child: item,
          );
        }
      },
    );
  }

  clickCbk(e) {
    if (!$props.props.isExpandTriggerHover) $on.expand?.call(this);
    $on.click?.call(this);
  }

  hoverCbk(e) {
    if ($props.props.isExpandTriggerHover) $on.expand?.call(this);
  }

  Widget get itemText {
    return Tooltip(
      waitDuration: const Duration(milliseconds: 1000),
      message: $props.option['label'] ?? '',
      child: Text(
        $props.option['label'] ?? '',
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 14,
          color: $props.props.isDisabled($props.option)
              ? disableColor
              : _isSelected
                  ? CfgGlobal.primaryColor
                  : ColorUtil.hexToColor('#606266'),
        ),
      ),
    );
  }

  Color get disableColor {
    return $style.disabledColor ??
        cfgGlobal.option.disabledColor ??
        Colors.grey.shade400;
  }
}

class WCascaderNodeOn extends BaseOn {
  Function(WCascaderNode)? expand;
  Function(WCascaderNode)? click;
  WCascaderNodeOn({this.expand, this.click});
}

class WCascaderNodeProp extends BaseProp {
  late Map<String, dynamic> option;
  late List picked;
  late List pickedValue;
  late int level;
  late PanelPropDetail props;
  WCascaderNodeProp({
    required this.option,
    this.level = 0,
    this.picked = const [],
    this.pickedValue = const [],
    PanelPropDetail? props,
  }) {
    // print(props);
    this.props = props ?? PanelPropDetail();
  }
}

class WCascaderNodeSlot extends BaseSlot {
  WCascaderNodeSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
