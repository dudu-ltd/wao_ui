// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';
import '../../core/utils/collect_util.dart';
import '../../core/utils/color_util.dart';

// TODO 使用 WCheckboxGroup 与 WRadioGroup 重写赋值逻辑
///
///
///
///
///
///
///
///
///
///
///
///
///
class WCascader extends WStatefulWidget<WCascaderOn, WCascaderProp,
    WCascaderSlot, WCascaderStyle> {
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
    init();
  }

  @override
  _WCascaderState createState() => _WCascaderState();
}

class _WCascaderState extends WState<WCascader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget wbuild(BuildContext context) {
    return WSelect(
      panelInsideBuilder: (parent, state) {
        return WCascaderPanel(
          props: WCascaderPanelProp(
            value: widget.$props.value,
            $model: widget.$props.$model,
            options: widget.$props.options,
            props: widget.$props.props,
          ),
        );
      },
      valueLabelsGetter: () {
        if (widget.$props.model == null || widget.$props.model.isEmpty) {
          return [];
        }
        var result = [];
        var isMultiple = widget.$props.props.multiple;
        var pickedOptions = [];
        var pickedLabels = [];
        var menus = [];
        widget.$props.props.getSelected(
          widget.$props.model ?? [],
          widget.$props.options,
          pickedOptions,
          pickedLabels,
          menus,
        );
        if (!isMultiple) {
          result.add(
            {
              'k': widget.$props.model,
              'v': widget.$props.showAllLevels
                  ? pickedLabels.join(widget.$props.separator)
                  : pickedLabels.last
            },
          );
        } else {
          widget.$props.model;
          var index = 0;
          for (var valueArr in widget.$props.model) {
            var labels = pickedLabels[index];
            result.add({
              'k': valueArr,
              'v': widget.$props.showAllLevels
                  ? labels.join(widget.$props.separator)
                  : labels.last,
            });
            index++;
          }
        }
        return result;
      },
      props: widget.$props,
      style: WSelectStyle(panelMaxWidth: 300),
      on: WSelectOn(change: (v) {
        widget.$on.change?.call(v);
      }),
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
    ValueNotifier? $model,
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
          $model: $model,
        ) {
    this.props = props ?? PanelPropDetail();
    super.multiple = this.props.multiple;
    this.value = value;
    this.showAllLevels = showAllLevels ?? true;
    this.separator = separator ?? ' / ';
    this.filterMethod = filterMethod;
    this.debounce = debounce ?? 300;
    this.beforeFilter = beforeFilter;
    super.automaticDropup = !this.props.checkStrictly;
  }
}

class WCascaderSlot extends BaseSlot {
  /**
      -	自定义备选项的节点内容，参数为 { node, data }，分别为当前节点的 Node 对象和数据
      empty	无匹配选项时的内容
   */
  WCascaderSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

///
///
///
///
///
///
///
///
///
///
///
///
///
class WCascaderPanel extends WStatefulWidget<WCascaderPanelOn,
    WCascaderPanelProp, WCascaderPanelSlot, WCascaderPanelStyle> {
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
    init();
  }

  @override
  _WCascaderPanelState createState() => _WCascaderPanelState();
}

class _WCascaderPanelState extends WState<WCascaderPanel> {
  List menus = [];
  List panelPicked = [];

  @override
  void initState() {
    super.initState();
    List panelValuePicked =
        widget.$props.model == null ? [] : [...widget.$props.model];
    menus.add(widget.$props.options);
    widget.$props.props.getSelected(
      panelValuePicked,
      widget.$props.options,
      panelPicked,
      [],
      menus,
    );
  }

  @override
  Widget wbuild(BuildContext context) {
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

  trigger(WCascaderNode node) {
    addMenu(node);
    // 选中值的原始形态 []
    panelPicked = panelPicked.sublist(0, node.$props.level);
    panelPicked.add(node.$props.option);
    setState(() {});
  }

  addMenu(WCascaderNode node) {
    var nextLevel = node.$props.props.getChildren(node.$props.option);
    if (nextLevel != null) {
      menus = menus.sublist(0, node.$props.level + 1);
      menus.add(nextLevel);
    }
  }

  click(WCascaderNode node) {
    var nextLevel = node.$props.props.getChildren(node.$props.option);
    if (nextLevel == null || node.$props.props.checkStrictly) {
      pickValue(node);
    }
  }

  pickValue(WCascaderNode node) {
    // 最末端选项被选中
    panelPicked = panelPicked.sublist(0, node.$props.level);
    panelPicked.add(node.$props.option);
    if (widget.$props.props.multiple) {
      // 当前为多选模式
      var select = selected();
      if (contains(widget.$props.value, select)) {
        widget.$props.value
            .removeWhere((element) => element.toString() == select.toString());
        panelPicked.remove(node.$props.option);
      } else {
        widget.$props.value.add(select);
        panelPicked.add(node.$props.option);
      }
    } else {
      widget.$props.value = selected();
    }
    setState(() {});
  }

  selected() {
    var result = [];
    for (var option in panelPicked) {
      result.add(widget.$props.props.getValue(option));
    }
    return result;
  }
}

class WCascaderPanelOn extends BaseOn {}

class WCascaderPanelProp extends WCascaderProp {
  WCascaderPanelProp({
    dynamic value,
    required List<dynamic> options,
    PanelPropDetail? props,
    ValueNotifier<dynamic>? $model,
  }) : super(
          options: options,
          props: props,
          value: value,
          $model: $model,
        );
}

class WCascaderPanelSlot extends BaseSlot {
  WCascaderPanelSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

///
///
///
///
///
///
///
///
///
///
///
///
///
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

  dynamic getLabel(Map<String, dynamic> option) {
    return option[label];
  }

  getSelected(
    List picked,
    List<dynamic> options,
    List pickedOptions,
    List pickedLabels,
    List menus,
  ) {
    if (picked.isEmpty) return;
    if (multiple) {
      var valuesLen = picked.length;
      for (var i = 0; i < valuesLen; i++) {
        var pl = [];
        pickedLabels.add(pl);
        getSelectedOneValue(
          picked[i],
          options,
          pickedOptions,
          pl,
          [],
        );
      }
    } else {
      getSelectedOneValue(
        picked,
        options,
        pickedOptions,
        pickedLabels,
        menus,
      );
    }
  }

  getSelectedOneValue(
    List picked,
    List<dynamic> options,
    List pickedOptions,
    List pickedLabels,
    List menus,
  ) {
    if (picked.isEmpty) return;
    var p = picked[0];
    for (var option in options) {
      if (p == getValue(option)) {
        pickedOptions.add(option);
        pickedLabels.add(getLabel(option));
        var children = getChildren(option);
        if (children != null) {
          menus.add(children);
          getSelectedOneValue(
            picked.sublist(1),
            children,
            pickedOptions,
            pickedLabels,
            menus,
          );
        }
      }
    }
  }
}

///
///
///
///
///
///
///
///
class WCascaderMenu extends WStatelessWidget<WCascaderMenuOn, WCascaderMenuProp,
    WCascaderMenuSlot, WCascaderMenuStyle> {
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
    init();
  }

  @override
  Widget wbuild(BuildContext context) {
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

// TODO 排查为啥不需要使用 ModelDriveProp
class WCascaderMenuProp extends BaseProp {
  late List<Map<String, dynamic>> options;
  late List picked;
  late List pickedValue;
  late int level;
  late PanelPropDetail props;
  WCascaderMenuProp({
    required this.options,
    this.level = 0,
    List? picked,
    List? pickedValue,
    PanelPropDetail? props,
  }) {
    this.picked = picked ?? [];
    this.pickedValue = pickedValue ?? [];
    this.props = props ?? PanelPropDetail();
  }
}

class WCascaderMenuSlot extends BaseSlot {
  WCascaderMenuSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

///
///
///
///
///
///
///
///
///
///
///
///
///
class WCascaderNode extends WStatelessWidget<WCascaderNodeOn, WCascaderNodeProp,
    WCascaderNodeSlot, WCascaderNodeStyle> {
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
    init();
  }

  @override
  Widget wbuild(BuildContext context) {
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
                child: optionWithTip,
              ),
            ),
          ),
        );
        if (disabled) {
          return item;
        } else {
          return Listener(
            behavior: HitTestBehavior.deferToChild,
            onPointerUp: clickCbk,
            onPointerHover: hoverCbk,
            child: item,
          );
        }
      },
    );
  }

  Widget get optionWithTip {
    return Tooltip(
      waitDuration: const Duration(milliseconds: 1000),
      message: $props.props.getLabel($props.option) ?? '',
      child: complexOption,
    );
  }

  Widget get complexOption {
    if ($props.props.multiple) {
      return WCheckbox(
        props: WCheckboxProp(value: ValueNotifier([_isSelected]), label: true),
        slots: WCheckboxSlot(
          $props.props.getLabel($props.option),
        ),
        style: WCheckboxStyle(padding: EdgeInsets.zero),
      );
    }
    if ($props.props.checkStrictly) {
      return WRadio(
        props: WRadioProp(value: ValueNotifier(_isSelected), label: true),
        slots: WRadioSlot(
          $props.props.getLabel($props.option),
        ),
        style: WRadioStyle(padding: EdgeInsets.zero),
      );
    }
    return itemText;
  }

  Widget get itemText {
    return Text(
      $props.props.getLabel($props.option),
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 14,
        color: $props.props.isDisabled($props.option)
            ? disableColor
            : _isSelected
                ? CfgGlobal.primaryColor
                : ColorUtil.hexToColor('#606266'),
      ),
    );
  }

  Color get disableColor {
    return $style.disabledColor ??
        cfgGlobal.option.disabledColor ??
        Colors.grey.shade400;
  }

  clickCbk(e) {
    if (!$props.props.isExpandTriggerHover) $on.expand?.call(this);
    $on.click?.call(this);
  }

  hoverCbk(e) {
    if ($props.props.isExpandTriggerHover) $on.expand?.call(this);
  }
}

class WCascaderNodeOn extends BaseOn {
  Function(WCascaderNode)? expand;
  Function(WCascaderNode)? click;
  WCascaderNodeOn({this.expand, this.click});
}

// TODO 排查为啥不需要使用 ModelDriveProp
class WCascaderNodeProp extends BaseProp {
  late Map<String, dynamic> option;
  late List picked;
  late List pickedValue;
  late int level;
  late PanelPropDetail props;
  WCascaderNodeProp({
    required this.option,
    this.level = 0,
    List? picked,
    List? pickedValue,
    PanelPropDetail? props,
  }) {
    this.picked = picked ?? [];
    this.pickedValue = pickedValue ?? [];
    this.props = props ?? PanelPropDetail();
  }
}

class WCascaderNodeSlot extends BaseSlot {
  WCascaderNodeSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
