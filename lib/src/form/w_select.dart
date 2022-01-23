// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, implementation_imports

import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/core/utils/layout_util.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:wao_ui/src/data/w_tag.dart';
import 'package:wao_ui/src/form/w_input.dart';
import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';

// TODO option disable 状态下，如果当前值刚好是禁用项，需要清掉
class WSelect extends StatefulWidget
    implements BaseWidget<WSelectOn, WSelectProp, WSelectSlot, WSelectStyle> {
  @override
  late final WSelectOn $on;
  @override
  late final WSelectProp $props;
  @override
  late final WSelectSlot $slots;
  @override
  late final WSelectStyle $style;

  late Widget Function(WSelect, _WSelectState)? panelInsideBuilder;

  WSelect({
    Key? key,
    WSelectOn? on,
    WSelectProp? props,
    WSelectSlot? slots,
    WSelectStyle? style,
    this.panelInsideBuilder,
  }) : super(key: key) {
    $on = on ?? WSelectOn();
    $props = props ?? WSelectProp();
    $slots = slots ?? WSelectSlot(null);
    $style = style ?? WSelectStyle();
  }

  @override
  _WSelectState createState() => _WSelectState();
  /**
      focus	使 input 获取焦点	-
      blur	使 input 失去焦点，并隐藏下拉框	-
   */
}

class _WSelectState extends State<WSelect>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController iconSpinController;
  late Animation<double> spin;
  late Animation<double> panelHeightAnimation;
  late Animation<double> panelOpacity;
  final ValueNotifier<bool> _isExpand = ValueNotifier(false);
  GlobalKey<WInputState> selectKey = GlobalKey<WInputState>();
  late Offset panelOffset = const Offset(0, 0);

  Function(void Function())? panelSetState;
  BuildContext? panelContext;

  late OverlayEntry panelOverlay;

  List options = [];

  @override
  void initState() {
    super.initState();
    _isExpand.addListener(changePanelAction);

    iconSpinController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    spin = Tween(begin: 0.0, end: -pi).animate(iconSpinController);

    panelOpacity = Tween(begin: 0.0, end: 255.0).animate(iconSpinController);

    panelHeightAnimation =
        Tween(begin: 0.0, end: panelHeight).animate(iconSpinController)
          ..addListener(() {
            setState(() {});
            panelSetState?.call(() {});
          });

    setEvent();
  }

  setEvent() {
    widget.$props.$valueListener.addListener(() {
      if (!widget.$props.multiple) hidePanel();
    });
    if (!widget.$slots.defalutEmpty) {
      _setEvent(widget.$slots.defaultSlot);
    }
  }

  _setEvent(List? slots) {
    slots?.forEach(
      (slot) {
        if (slot is WOption) {
          slot.$props.$multiple = widget.$props.multiple;
          options.add(slot);
          var fn = slot.$on.click ?? (e) {};
          slot.$props.$valueListener = widget.$props.$valueListener;
          slot.$on.click = (e) {
            onSelect(e);
            fn(e);
          };
        } else if (slot is WOptionGroup) {
          _setEvent(slot.$slots.defaultSlot);
        }
      },
    );
  }

  showPanel() {
    isExpand = true;
  }

  hidePanel() {
    isExpand = false;
  }

  showPanelAction() {
    OverlayEntry overlayEntry = OverlayEntry(builder: (content) {
      return panel;
    });
    panelOverlay = overlayEntry;
    Overlay.of(context)?.insert(overlayEntry);
  }

  hidePanelAction() {
    panelOverlay.remove();
  }

  clearValue() {
    if (widget.$props.multiple) {
      widget.$props.$valueListener.value.clear();
    } else {
      widget.$props.$valueListener.value = null;
    }
    widget.$props.$valueListener.notifyListeners();
    setState(() {});
  }

  set isExpand(expand) {
    _isExpand.value = expand;
  }

  get isExpand {
    return _isExpand.value;
  }

  changePanel() {
    isExpand = !isExpand;
  }

  changePanelAction() {
    if (isExpand) {
      showPanelAction();
      iconSpinController.forward();
    } else {
      iconSpinController.reverse().then((value) => hidePanelAction());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    // WidgetsBinding.instance!.focusManager
    //     .removeHighlightModeListener(_handleFocusHighlightModeChange);
    // focusNode!.removeListener(_handleFocusChanged);
    // _internalNode?.dispose();
    // WidgetsBinding.instance?.handleDrawFrame();
    hidePanelAction();
    super.dispose();
  }

  onSelect(option) {
    if (widget.$props.multiple) {
      var v = widget.$props.value as List;
      var contains = v.contains(option.value);
      contains ? v.remove(option.value) : v.add(option.value);
      widget.$props.value = widget.$props.$valueListener.value;
    } else {
      widget.$props.value = option.value;
    }
    setState(() {});
  }

  _updatePanel(BuildContext panelContext, panelSetState) {
    var itemRect = getPosition(context);
    var selectRect = getPosition(selectKey.currentContext!);
    var panelRect = getPosition(panelContext);

    panelSetState(() {
      var dx = itemRect.left - panelBorder;
      var dy = itemRect.top + selectRect.height;
      if (dx < 0) {
        dx = 0;
      }
      var win = MediaQuery.of(context).size;
      var screenWidth = win.width;
      var screenHeight = win.height;
      if (itemRect.left + panelRect.width > MediaQuery.of(context).size.width) {
        dx = screenWidth - panelRect.width;
      }

      if (dy + panelHeight > screenHeight) {
        dy = dy - panelRect.height - selectRect.height;
      }
      panelOffset = Offset(dx, dy);
    });
  }

  @override
  Widget build(BuildContext context) {
    var select = WInput(
      key: selectKey,
      props: widget.$props,
      on: widget.$props.disabled
          ? null
          : WInputOn(
              click: changePanel,
              focus: showPanel,
              blur: hidePanel,
              clear: clearValue,
            ),
      slots: WInputSlot(
        null,
        prefix: multipleValues,
        suffix: Transform.rotate(
          angle: spin.value,
          child: const Icon(Icons.expand_more),
        ),
      ),
      style: WInputStyle(width: panelWidth),
      $prefixSize: MainAxisSize.max,
      $prefixAlignment: MainAxisAlignment.start,
      $strictOneRow: false,
    );

    return select;
  }

  Widget? get multipleValues {
    return needMultiLabel ? multiLabel : singleLabel;
  }

  Widget? get singleLabel {
    var labels = valueLabels;
    if (labels.isEmpty) return null;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            labels.first['v'],
            style: TextStyle(fontSize: singleLabelFontSize),
          ),
        ),
        editInput,
      ],
    );
  }

  // TODO 兼容可编辑的属性
  Widget get editInput {
    return Container();
    // return Expanded(child: TextFormField());
  }

  double get singleLabelFontSize {
    return cfgGlobal.font.val(widget.$props.size);
  }

  Widget? get multiLabel {
    var labels = valueLabels;
    if (labels.isEmpty) return null;
    var children = <Widget>[];
    if (!widget.$props.collapseTags) {
      children = List.generate(labels.length, (i) {
        var m = labels[i];
        return toTag(m);
      });
    } else {
      var c = '+${labels.length - 1}';
      children = [
        toTag(labels[0]),
        if (labels.length > 1) toTag({'k': c, 'v': c}, closable: false),
      ];
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 140,
        child: Wrap(
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.start,
          direction: Axis.horizontal,
          spacing: 4,
          runSpacing: 4,
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...children,
            editInput,
          ],
        ),
      ),
    );
  }

  toTag(m, {closable = true}) {
    return WTag(
      on: closable
          ? WTagOn(
              close: () {
                widget.$props.$valueListener.value.remove(m['k']);
                widget.$props.value =
                    widget.$props.$valueListener.value.sublist(0);
                setState(() {});
              },
            )
          : null,
      props: WTagProp(
        closable: closable,
        size: 'mini',
        type: 'info',
      ),
      slots: WTagSlot(m['v']),
    );
  }

  bool get needMultiLabel {
    return widget.$props.multiple;
  }

  List<dynamic> get valueLabels {
    var result = [];
    for (var element in options) {
      if (element is WOption && element.$props.isSelected) {
        result.add({'k': element.$props.value, 'v': element.$props.label});
      }
    }
    return result;
  }

  Widget get panel {
    return StatefulBuilder(builder: (context, setState) {
      panelSetState = setState;
      panelContext = context;

      /// [!flutter中获取控件位置](https://www.jianshu.com/p/5874e5e13761)
      // 在控件渲染完成后执行的回调
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        _updatePanel(context, setState);
      });
      // var offset = panelOffset;
      return Positioned(
        top: panelOffset.dy,
        left: panelOffset.dx,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: panelHeightAnimation.value,
            minWidth: panelMinWidth,
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(panelOpacity.value ~/ 1, 255, 255, 255),
          ),
          //  TODO 为下拉框添加角标，child: angleWrapper(panelOutside),
          child: panelOutside,
        ),
      );
    });
  }

  double get panelWidth {
    return widget.$style.panelMaxWidth ?? cfgGlobal.select.panelMaxWidth ?? 240;
  }

  double get panelMinWidth {
    return widget.$style.panelMinWidth ?? cfgGlobal.select.panelMinWidth ?? 180;
  }

  // 为浮窗添加小箭头角标
  Widget angleWrapper(child) {
    var yOffset = (sqrt(12 * 12 * 2) / 2 - 2);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          left: 35,
          top: -yOffset,
          child: Transform.rotate(
            angle: pi / 4,
            child: shadowWrapper(
              borderWrapper(
                const ColoredBox(
                  color: Color.fromARGB(0, 255, 255, 255),
                  child: SizedBox(
                    height: 12,
                    width: 12,
                    child: Text(''),
                  ),
                ),
                Border(
                  top: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                  left: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                true,
                borderRadius: BorderRadius.circular(8.0),
              ),
              shadow: [
                const BoxShadow(
                  color: Color.fromARGB(25, 0, 0, 0),
                  offset: Offset(-3.0, -3.0),
                  blurRadius: 6.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget get panelOutside {
    return shadowWrapper(borderWrapper(
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
        child: panelInside,
      ),
      Border.all(color: Colors.grey.shade300, width: panelBorder),
      true,
    ));
  }

  double get panelBorder {
    return widget.$style.panelBorder ?? cfgGlobal.select.panelBorder ?? 1;
  }

  double get panelHeight {
    return widget.$style.panelHeight ?? cfgGlobal.select.panelHeight ?? 274.0;
  }

  Color get noDataTextColor {
    return widget.$style.noDataTextColor ??
        cfgGlobal.select.noDataTextColor ??
        Colors.grey.shade600;
  }

  Widget get panelInside {
    if (widget.panelInsideBuilder != null) {
      return widget.panelInsideBuilder!.call(widget, this);
    }
    var defaultPanelInside = widget.$slots.defalutEmpty
        ? Align(
            child: Text(
              widget.$props.noDataText,
              style: TextStyle(color: noDataTextColor),
            ),
            alignment: Alignment.topCenter,
          )
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.$slots.defaultSlot ?? [],
            ),
          );
    return SizedBox(
      width: panelMinWidth,
      child: defaultPanelInside,
    );
  }
}

class WSelectOn extends WInputOn {
  /**
      change	选中值发生变化时触发	目前的选中值
      visible-change	下拉框出现/隐藏时触发	出现则为 true，隐藏则为 false
      remove-tag	多选模式下移除tag时触发	移除的tag值
      clear	可清空的单选模式下用户点击清空按钮时触发	—
      blur	当 input 失去焦点时触发	(event: Event)
      focus	当 input 获得焦点时触发	(event: Event)
   */
  WSelectOn({
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

class WSelectProp extends WInputProp {
  late bool multiple;
  late String valueKey;
  late bool collapseTags;
  late num multipleLimit;
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
  late ValueNotifier<dynamic> $valueListener;

  WSelectProp({
    dynamic value,
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
    this.filterMethod,
    bool? remote,
    this.remoteMethod,
    bool? loading,
    String? loadingText,
    String? noMatchText,
    String? noDataText,
    this.popperClass,
    bool? reserveKeyword,
    bool? defaultFirstOption,
    bool? popperAppendToBody,
    bool? automaticDropdown,
  }) : super(
          disabled: disabled,
          size: size,
          clearable: clearable,
          name: name,
          autocomplete: autocomplete,
          autoComplete: autoComplete,
          placeholder: placeholder,
        ) {
    $valueListener = ValueNotifier(null);
    this.multiple = multiple ?? false;
    this.value = value;
    this.disabled = disabled ?? false;
    this.valueKey = valueKey ?? 'value';
    this.clearable = clearable ?? false;
    this.collapseTags = collapseTags ?? false;
    this.multipleLimit = multipleLimit ?? 0;
    this.autocomplete = autocomplete ?? 'off';
    this.autoComplete = autoComplete ?? 'off';
    this.placeholder = placeholder ?? '请选择';
    this.filterable = filterable ?? false;
    this.allowCreate = allowCreate ?? false;
    this.remote = remote ?? false;
    this.loading = loading ?? false;
    this.loadingText = loadingText ?? '加载中';
    this.noMatchText = noMatchText ?? '无匹配数据';
    this.noDataText = noDataText ?? '无数据';
    this.reserveKeyword = reserveKeyword ?? false;
    this.defaultFirstOption = defaultFirstOption ?? false;
    this.popperAppendToBody = popperAppendToBody ?? true;
    this.automaticDropdown = automaticDropdown ?? false;

    readonly = !this.allowCreate && !this.remote;
  }

  @override
  set value(value) {
    $valueListener.value = value;
    super.value = value is String ? value : jsonEncode(value);
  }

  @override
  dynamic get value {
    return $valueListener.value;
  }
}

class WSelectSlot extends BaseSlot {
  /*
      —	Option 组件列表
      prefix	Select 组件头部内容
      empty	无选项时的列表
   */
  WSelectSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WOptionGroup extends StatelessWidget
    implements
        BaseWidget<WOptionGroupOn, WOptionGroupProp, WOptionGroupSlot,
            WOptionGroupStyle> {
  @override
  late final WOptionGroupOn $on;

  @override
  late final WOptionGroupProp $props;

  @override
  late final WOptionGroupSlot $slots;

  @override
  late final WOptionGroupStyle $style;

  WOptionGroup({
    Key? key,
    WOptionGroupOn? on,
    WOptionGroupProp? props,
    WOptionGroupSlot? slots,
    WOptionGroupStyle? style,
  }) : super(key: key) {
    $on = on ?? WOptionGroupOn();
    $props = props ?? WOptionGroupProp(label: '');
    $slots = slots ?? WOptionGroupSlot(null);
    $style = style ?? WOptionGroupStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 8, 18, 8),
          child: Text(
            $props.label,
            style: TextStyle(color: Theme.of(context).hintColor, fontSize: 12),
          ),
        ),
        if (!$slots.defalutEmpty) ...$slots.defaultSlot!,
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
          child: Divider(
            color: Colors.grey.shade300,
            height: 1,
          ),
        ),
      ],
    );
  }
}

class WOptionGroupOn extends BaseOn {}

class WOptionGroupProp extends BaseProp {
  late String label;
  late bool disabled;
  WOptionGroupProp({required this.label, this.disabled = false});
}

class WOptionGroupSlot extends BaseSlot {
  WOptionGroupSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WOption extends StatelessWidget
    implements BaseWidget<WOptionOn, WOptionProp, WOptionSlot, WOptionStyle> {
  @override
  late final WOptionOn $on;
  @override
  late final WOptionProp $props;
  @override
  late final WOptionSlot $slots;
  @override
  late final WOptionStyle $style;

  WOption({
    Key? key,
    WOptionOn? on,
    WOptionProp? props,
    WOptionSlot? slots,
    WOptionStyle? style,
  }) : super(key: key) {
    $on = on ?? WOptionOn();
    $props = props ?? WOptionProp();
    $slots = slots ?? WOptionSlot(null);
    $style = style ?? WOptionStyle();
  }

  @override
  Widget build(BuildContext context) {
    return MouseStateBuilder(
      builder: (context, state) {
        return InkWell(
          hoverColor: !$props.disabled
              ? ColorUtil.hexToColor('#f5f7fa')
              : const Color.fromARGB(0, 255, 255, 255),
          onTap: itemClick,
          onHover: itemHover,
          child: Align(
            alignment: Alignment.centerLeft,
            child: ColoredBox(
              color: state.isMouseOver && !$props.disabled
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
          ),
        );
      },
    );
  }

  get itemClick {
    return !$props.disabled
        ? () {
            $on.click?.call($props);
            if ($props.$multiple) $props.$valueListener.notifyListeners();
          }
        : null;
  }

  get itemHover {
    return !$props.disabled
        ? (b) {
            $on.hover?.call($props);
            if ($props.$multiple) $props.$valueListener.notifyListeners();
          }
        : null;
  }

  Widget get itemText {
    return Tooltip(
      waitDuration: const Duration(milliseconds: 1000),
      message: $props.label ?? '',
      child: Text(
        $props.label ?? '',
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 14,
          color: $props.disabled
              ? disableColor
              : $props.isSelected
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

class WOptionOn extends BaseOn {
  Function(WOptionProp)? click;
  Function(WOptionProp)? hover;
  WOptionOn({this.click, this.hover});
}

class WOptionProp extends BaseProp {
  late ValueNotifier $valueListener;
  late bool $multiple;
  late dynamic value;
  late dynamic label;
  late bool disabled;
  WOptionProp({
    this.value,
    this.label,
    this.disabled = false,
    ValueNotifier? $valueListener,
    bool? multiple,
    dynamic selectValue,
  }) {
    $multiple = multiple ?? false;
    this.$valueListener = $valueListener ?? ValueNotifier(selectValue);
  }

  bool get isSelected {
    if (kDebugMode) {
      if ($multiple) {
        print(
            '${$valueListener.value} contains $value is ${$valueListener.value.contains(value)}');
      } else {
        print(
            '${$valueListener.value} equals $value = ${$valueListener.value == value}');
      }
    }
    return $multiple
        ? $valueListener.value.contains(value)
        : $valueListener.value == value;
  }
}

class WOptionSlot extends BaseSlot {
  WOptionSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
