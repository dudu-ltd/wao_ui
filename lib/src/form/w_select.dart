import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:wao_ui/src/form/w_input.dart';
import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';

class WSelect extends StatefulWidget
    implements BaseWidget<WSelectOn, WSelectProp, WSelectSlot> {
  @override
  late final WSelectOn $on;

  @override
  late final WSelectProp $props;

  @override
  late final WSelectSlot $slots;

  double panelHeight;

  @override
  _WSelectState createState() => _WSelectState();
  WSelect({
    Key? key,
    WSelectOn? on,
    WSelectProp? props,
    WSelectSlot? slots,
    this.panelHeight = 274.0,
  }) : super(key: key) {
    $on = on ?? WSelectOn();
    $props = props ?? WSelectProp();
    $slots = slots ?? WSelectSlot(null);
  }

  /**
      focus	使 input 获取焦点	-
      blur	使 input 失去焦点，并隐藏下拉框	-
   */
}

class _WSelectState extends State<WSelect> with SingleTickerProviderStateMixin {
  late AnimationController iconSpinController;
  late Animation<double> spin;
  late Animation<double> panelHeight;
  late Animation<double> panelOpacity;
  final ValueNotifier<bool> _isExpand = ValueNotifier(false);
  GlobalKey<WInputState> selectKey = GlobalKey<WInputState>();
  late Offset panelOffset = const Offset(0, 0);

  late OverlayEntry panelOverlay;

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
    hidePanel();
    super.dispose();
  }

  onSelect(option, select) {
    if (select.multiple) {
      var v = select.value as List;
      var contains = v.contains(option.value);
      contains ? v.remove(option.value) : v.add(option.value);
      widget.$props.value = select._value.value;
      setState(() {});
    } else {
      select.value = option.value;
    }
  }

  @override
  void initState() {
    super.initState();
    _isExpand.addListener(changePanelAction);

    iconSpinController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    spin = Tween(begin: 0.0, end: -pi).animate(iconSpinController);

    panelOpacity = Tween(begin: 255.0, end: 255.0).animate(iconSpinController);

    panelHeight = Tween(begin: widget.panelHeight, end: widget.panelHeight)
        .animate(iconSpinController)
      ..addListener(() {
        setState(() {});
      });

    /// [!flutter中获取控件位置](https://www.jianshu.com/p/5874e5e13761)
    // 在控件渲染完成后执行的回调
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _findRenderObject();
    });

    setEvent();
  }

  setEvent() {
    if (!widget.$slots.defalutEmpty) {
      widget.$slots.defaultSlot?.forEach(
        (slot) {
          if (slot is WOption) {
            var fn = slot.$on.click ?? (e) {};
            slot.$props._value = widget.$props._value;
            slot.$props._multiple = widget.$props.multiple;
            slot.$on.click = (e) {
              onSelect(e, widget.$props);
              fn(e);
              if (!widget.$props.multiple) hidePanel();
            };
          }
        },
      );
    }
  }

  /// [!flutter中获取控件位置](https://www.jianshu.com/p/5874e5e13761)
  // 如果控件用了Transform平移旋转等, 获取到的坐标也会变化
  _findRenderObject() {
    dynamic renderBox = selectKey.currentContext?.findRenderObject();

    // offset.dx , offset.dy 就是控件的左上角坐标
    var offset = renderBox.localToGlobal(Offset.zero);

    setState(() {
      var dx = offset.dx - (renderBox.size.width);
      var dy = offset.dy;
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
            ),
      slots: WInputSlot(
        null,
        suffix: Transform.rotate(
          angle: spin.value,
          child: const Icon(Icons.expand_more),
        ),
      ),
      $prefixSize: MainAxisSize.max,
    );

    return select;
  }

  Widget get panel {
    return StatefulBuilder(builder: (a, b) {
      // var offset = panelOffset;
      return Positioned(
        top: panelOffset.dy,
        left: panelOffset.dx,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: panelHeight.value,
          ),
          width: 200,
          decoration: BoxDecoration(
            color: Color.fromARGB(panelOpacity.value ~/ 1, 255, 255, 255),
          ),
          child: angleWrapper(panelOutside),
        ),
      );
    });
  }

  // 为浮窗添加小箭头角标
  Widget angleWrapper(child) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          left: 35,
          top: -(sqrt(12 * 12 * 2) / 2 - 2),
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
              ),
              shadow: [
                const BoxShadow(
                  color: Color.fromARGB(25, 0, 0, 0),
                  offset: Offset(-1.0, -1.0),
                  blurRadius: 12.0,
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
      colorWrapper(
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: panelInside,
        ),
        Colors.white,
        true,
      ),
      Border.all(color: Colors.grey.shade300, width: 1),
      true,
    ));
  }

  Widget get panelInside {
    return widget.$slots.defalutEmpty
        ? Text(widget.$props.noDataText)
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.$slots.defaultSlot ?? [],
            ),
          );
  }
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
  late ValueNotifier<dynamic> _value;

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
    _value = ValueNotifier(null);
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

  set value(value) {
    print(value);
    _value.value = value;
    super.value = multiple ? value.join(',') : value;
  }

  dynamic get value {
    return _value.value;
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

class WOptionGroup extends StatelessWidget
    implements BaseWidget<WOptionGroupOn, WOptionGroupProp, WOptionGroupSlot> {
  @override
  late final WOptionGroupOn $on;

  @override
  late final WOptionGroupProp $props;

  @override
  late final WOptionGroupSlot $slots;

  WOptionGroup({
    Key? key,
    WOptionGroupOn? on,
    WOptionGroupProp? props,
    WOptionGroupSlot? slots,
  }) : super(key: key) {
    $on = on ?? WOptionGroupOn();
    $props = props ?? WOptionGroupProp(label: '');
    $slots = slots ?? WOptionGroupSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Text($props.label);
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
    return MouseStateBuilder(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            $on.click?.call($props);
            if ($props._multiple) $props._value.notifyListeners();
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: 34,
            color: state.isMouseOver
                ? ColorUtil.hexToColor('#f5f7fa')
                : Colors.white,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              $props.label,
              style: TextStyle(
                fontSize: 14,
                color: $props.isSelected
                    ? CfgGlobal.primaryColor
                    : ColorUtil.hexToColor('#606266'),
              ),
            ),
          ),
        );
      },
    );
  }
}

class WOptionOn extends BaseOn {
  Function(WOptionProp)? click;
  WOptionOn({this.click});
}

class WOptionProp extends BaseProp {
  late ValueNotifier _value;
  late bool _multiple;
  late dynamic value;
  late dynamic label;
  late bool disabled;
  WOptionProp({
    this.value,
    this.label,
    this.disabled = false,
    bool? multiple,
    dynamic selectValue,
  }) {
    _multiple = multiple ?? false;
    _value = ValueNotifier(selectValue);
  }

  bool get isSelected {
    print('${_value.value} contains $value = ${_value.value.contains(value)}');
    return _multiple ? _value.value.contains(value) : _value.value == value;
  }
}

class WOptionSlot extends BaseSlot {
  WOptionSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
