import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';
import '../../core/utils/color_util.dart';

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
            valueNotifier: widget.$props._valueListener,
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
    print(super.multiple);
    _valueListener = ValueNotifier(null);
    this.value = value;
    this.props = props ?? {};
    this.showAllLevels = showAllLevels ?? true;
    this.separator = separator ?? '/';
    this.filterMethod = filterMethod;
    this.debounce = debounce ?? 300;
    this.beforeFilter = beforeFilter;
  }
  bool get expandTriggerHover {
    return props['expandTrigger'] == 'hover';
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
  List panelPicked = [];

  @override
  void initState() {
    panelData.add(widget.$props.options);
  }

  @override
  Widget build(BuildContext context) {
    trigger(node) {
      var nextLevel = node.$props.option['children'];
      print(nextLevel);
      if (nextLevel != null) {
        // 数据原始形态 [ 一级menu , [...动态添加二级、三级...] ]
        panelData = panelData.sublist(0, node.$props.level + 1);
        panelData.add(node.$props.option['children']);
        // 选中值的原始形态 []
        panelPicked = panelPicked.sublist(0, node.$props.level);
        panelPicked.add(node.$props.option['value']);
        setState(() {});
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(panelData.length, (index) {
        var levelPanel = panelData[index];
        return WCascaderMenu(
          props: WCascaderMenuProp(
            picked: panelData,
            options: levelPanel,
            level: index,
            props: widget.$props.props,
          ),
          style: widget.$style.cascaderMenu,
          on: WCascaderMenuOn(expand: trigger),
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
    Map<String, dynamic>? props,
    ValueNotifier<dynamic>? valueNotifier,
  }) : super(
          options: options,
          props: props,
          value: value,
        ) {
    _valueListener = valueNotifier ?? ValueNotifier(null);
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
              on: WCascaderNodeOn(expand: $on.expand),
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
  WCascaderMenuOn({this.expand});
}

class WCascaderMenuProp extends BaseProp {
  late List<Map<String, dynamic>> options;
  late List picked;
  late List pickedValue;
  late int level;
  late Map<String, dynamic> props;
  WCascaderMenuProp({
    required this.options,
    this.level = 0,
    this.picked = const [],
    this.pickedValue = const [],
    this.props = const {},
  });
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

  bool _isSelected = false;
  bool _isActive = false;

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
        return Listener(
          onPointerUp: isExpandTriggerHover($props.props)
              ? null
              : (e) => $on.expand?.call(this),
          onPointerHover: isExpandTriggerHover($props.props)
              ? (e) {
                  print('hover==========');
                  $on.expand?.call(this);
                }
              : (e) {
                  print('hover false');
                },
          child: Align(
            alignment: Alignment.centerLeft,
            child: ColoredBox(
              color: state.isMouseOver && !isDisabled($props.props)
                  ? ColorUtil.hexToColor('#f5f7fa')
                  : const Color.fromARGB(0, 255, 255, 255),
              child: FractionallySizedBox(
                widthFactor: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                  child: Text($props.option['label'] ?? ''),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

bool isExpandTriggerHover(Map<String, dynamic> props) {
  return props['expandTrigger'] == 'hover';
}

bool isDisabled(Map<String, dynamic> props) {
  return props['disabled'] ?? false;
}

class WCascaderNodeOn extends BaseOn {
  Function(WCascaderNode)? expand;
  WCascaderNodeOn({this.expand});
}

class WCascaderNodeProp extends BaseProp {
  late Map<String, dynamic> option;
  late List picked;
  late List pickedValue;
  late int level;
  late Map<String, dynamic> props;
  WCascaderNodeProp({
    required this.option,
    this.level = 0,
    this.picked = const [],
    this.pickedValue = const [],
    this.props = const {},
  }) {
    print(props);
  }
}

class WCascaderNodeSlot extends BaseSlot {
  WCascaderNodeSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
