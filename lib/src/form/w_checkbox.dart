import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';
import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';

class WCheckbox extends WStatefulWidget<WCheckboxOn, WCheckboxProp,
    WCheckboxSlot, WCheckboxStyle> {
  WCheckbox({
    Key? key,
    WCheckboxOn? on,
    WCheckboxProp? props,
    WCheckboxSlot? slots,
    WCheckboxStyle? style,
  }) : super(key: key) {
    $on = on ?? WCheckboxOn();
    $props = props ?? WCheckboxProp();
    $slots = slots ?? WCheckboxSlot(null);
    $style = style ?? WCheckboxStyle();
    init();
  }

  @override
  _WCheckboxState createState() => _WCheckboxState();
}

class _WCheckboxState extends WState<WCheckbox> {
  late ValueNotifier<bool> indeterminate = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    widget.$props._indeterminate.addListener(valueChange);
    widget.$props.$addModelListener(valueChange);
  }

  @override
  Widget wbuild(BuildContext context) {
    indeterminate.value = widget.$props.indeterminate;
    return MouseStateBuilder(
      builder: (context, state) {
        return InkWell(
          hoverColor:
              widget.$props.isSelected ? CfgGlobal.primaryColor.shade50 : null,
          splashColor:
              widget.$props.isSelected ? CfgGlobal.primaryColor.shade100 : null,
          highlightColor:
              widget.$props.isSelected ? CfgGlobal.primaryColor.shade100 : null,
          onTap: widget.$props.disabled
              ? null
              : (() {
                  print('change checkbox');
                  print(widget.$props.model);
                  if (widget.$props.model is bool) {
                    widget.$props.model = !widget.$props.model;
                  } else {
                    if (widget.$props.model.contains(widget.$props.label)) {
                      widget.$props.model.remove(widget.$props.label);
                    } else {
                      widget.$props.model.add(widget.$props.label);
                    }
                  }
                  widget.$props.$modelNotifyListeners();
                  widget.$on.change?.call(widget.$props.model);
                }),
          child: borderWrapper(
            Padding(
              padding: padding,
              child: Row(children: [
                Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      width: height,
                      height: height,
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          border: Border.all(
                              color: borderColor(state.isMouseOver), width: 1),
                          borderRadius: widget.style.borderRadius),
                      child: Icon(
                        statusIcon,
                        color: statusIconColor,
                        size: height - 2,
                      ),
                    )),
                widget.$slots.$ is Widget
                    ? widget.$slots.$
                    : Text(
                        widget.$slots.$ ?? widget.$props.label ?? 'null',
                        style: TextStyle(
                          color: labelColor,
                          fontSize: height + 1,
                        ),
                      )
              ]),
            ),
            Border.fromBorderSide(
                BorderSide(width: 1, color: borderColor(false))),
            widget.$props.border,
            borderRadius: widget.style.borderRadius,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    widget.$props._indeterminate.removeListener(valueChange);
    widget.$props.$removeModelListener(valueChange);
    super.dispose();
  }

  void valueChange() => setState;

  Color borderColor(bool highlight) {
    return widget.$props.disabled
        ? Colors.grey.shade400
        : (widget.$props.isSelected || widget.$props.indeterminate || highlight)
            ? CfgGlobal.primaryColor
            : Colors.grey.shade300;
  }

  IconData? get statusIcon {
    return widget.$props.indeterminate
        ? Icons.horizontal_rule_rounded
        : widget.$props.isSelected
            ? Icons.check
            : null;
  }

  Color get statusIconColor {
    return widget.$props.disabled ? Colors.grey : Colors.white;
  }

  double get height {
    return cfgGlobal.checkbox.val(widget.$props.size);
  }

  Color get labelColor {
    return widget.$props.disabled
        ? Colors.grey.shade400
        : widget.$props.isSelected
            ? CfgGlobal.primaryColor
            : Colors.black87;
  }

  Color get backgroundColor {
    return widget.$props.disabled
        ? CfgGlobal.primaryColor.shade50
        : widget.$props.isSelected || widget.$props.indeterminate
            ? CfgGlobal.primaryColor
            : Colors.white;
  }

  EdgeInsets get padding {
    return widget.$style.padding ??
        cfgGlobal.checkbox.padding ??
        const EdgeInsets.all(8.0);
  }
}

class WCheckboxOn extends BaseOn {
  Function? change;
  WCheckboxOn({this.change});
}

class WCheckboxProp extends BaseProp with ModelDriveProp {
  late dynamic label;
  late dynamic trueLabel;
  late dynamic falseLabel;
  late bool disabled;
  late bool _disabled;
  late bool border;
  late String size;
  late String name;
  late bool checked;
  late ValueNotifier _indeterminate;

  set indeterminate(val) {
    _indeterminate.value = val;
  }

  bool get indeterminate {
    return _indeterminate.value;
  }

  WCheckboxProp({
    dynamic model,
    dynamic label,
    dynamic trueLabel,
    dynamic falseLabel,
    bool? disabled,
    bool? border,
    String? size,
    String? name,
    bool? checked,
    bool? indeterminate,
  }) {
    assert(model == null || model is bool || model is List);
    this.model = model ?? [];
    // 选中状态的值（只有在checkbox-group或者绑定对象类型为array时有效）
    this.label = label;
    this.disabled = disabled ?? false;
    this._disabled = this.disabled;
    this.border = border ?? false;
    this.size = size ?? 'medium';
    this.name = name ?? '';
    // 选中时的值
    this.trueLabel = trueLabel;
    // 没有选中时的值
    this.falseLabel = falseLabel;
    this.checked = checked ?? false;
    _indeterminate = ValueNotifier(indeterminate ?? false);
  }
  bool get isSelected {
    if (label == null && model is bool) return model;
    return model.contains(label);
  }
}

class WCheckboxSlot extends BaseSlot {
  WCheckboxSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WCheckboxGroup extends WStatelessWidget<WCheckboxGroupOn,
    WCheckboxGroupProp, WCheckboxGroupSlot, WCheckboxGroupStyle> {
  WCheckboxGroup({
    Key? key,
    WCheckboxGroupOn? on,
    WCheckboxGroupProp? props,
    WCheckboxGroupSlot? slots,
    WCheckboxGroupStyle? style,
  }) : super(key: key) {
    $on = on ?? WCheckboxGroupOn();
    $props = props ?? WCheckboxGroupProp();
    $slots = slots ?? WCheckboxGroupSlot(null);
    $style = style ?? WCheckboxGroupStyle();
    init();
  }

  void sizeLimit() {
    var checked = 0;
    var len = defaultSlot.length;
    for (var i = 0; i < len; i++) {
      var child = defaultSlot[i];
      if (child is WCheckbox) {
        if (child.$props.isSelected) checked++;
      } else if (child is WCheckboxButton) {
        if (child.$props.isSelected) checked++;
      }
    }
    if (checked > $props.min && ($props.max == null || checked < $props.max!)) {
      for (var i = 0; i < len; i++) {
        var child = defaultSlot[i];
        if (child is WCheckbox) {
          child.$props.disabled = child.$props._disabled;
        } else if (child is WCheckboxButton) {
          child.$props.disabled = child.$props._disabled;
        }
      }
    } else if (($props.max != null && checked >= $props.max!)) {
      for (var i = 0; i < len; i++) {
        var child = defaultSlot[i];
        if (child is WCheckbox) {
          if (!child.$props.isSelected) {
            child.$props.disabled = true;
          } else {
            child.$props.disabled = child.$props._disabled;
          }
        } else if (child is WCheckboxButton) {
          if (!child.$props.isSelected) {
            child.$props.disabled = true;
          } else {
            child.$props.disabled = child.$props._disabled;
          }
        }
      }
    } else if (checked == $props.min) {
      for (var i = 0; i < len; i++) {
        var child = defaultSlot[i];
        if (child is WCheckbox) {
          if (child.$props.isSelected) {
            child.$props.disabled = true;
          } else {
            child.$props.disabled = child.$props._disabled;
          }
        } else if (child is WCheckboxButton) {
          if (child.$props.isSelected) {
            child.$props.disabled = true;
          } else {
            child.$props.disabled = child.$props._disabled;
          }
        }
      }
    }
  }

  @override
  List<SlotTranslator> get slotTranslatorsCustom {
    return [
      SlotTranslator(
        WCheckbox,
        (child, i, c, l) {
          child as WCheckbox;
          child.$props.$model = $props.$model;
          child.$props.disabled |= $props.disabled;
          child.$props._disabled = child.$props.disabled;
          child.$props.size = $props.size;
          return child;
        },
      ),
      SlotTranslator(
        WCheckboxButton,
        (child, i, c, len) {
          child as WCheckboxButton;
          child.$props.$model = $props.$model;
          child.$props.disabled |= $props.disabled;
          child.$props._disabled = child.$props.disabled;
          child.$props._size = $props.size;
          child.$props.isFirst = i == 0;
          child.$props.isLast = i == len - 1;
          return child;
        },
      )
    ];
  }

  @override
  beforeBuild() {
    $props.$addModelListener(() {
      $on.change?.call($props.model);
      sizeLimit();
    });
    sizeLimit();
    return super.beforeBuild();
  }

  @override
  Widget wbuild(BuildContext context) {
    var children = <Widget>[];
    int len = defaultSlot.length;
    for (var i = 0; i < len; i++) {
      children.add(
        marginWrapper(
          defaultSlot[i],
          const EdgeInsets.only(left: 12),
          needMargin: i != 0 && $first is WCheckbox,
        ),
      );
    }
    return Row(children: children);
  }
}

class WCheckboxGroupOn extends BaseOn {
  Function? change;
  WCheckboxGroupOn({this.change});
}

// TODO 对以下进行兼容
// late num? min;
// late num? max;
// late Color textColor;
// late Color fill;
class WCheckboxGroupProp extends BaseProp with ModelDriveProp {
  late String size;
  late bool disabled;
  late num min;
  late num? max;
  late Color textColor;
  late Color fill;

  WCheckboxGroupProp({
    List? model,
    String? size,
    bool? disabled,
    num? min,
    num? max,
    String? textColor,
    String? fill,
  }) {
    this.model = model ?? [];
    this.size = size ?? 'medium';
    this.disabled = disabled ?? false;
    this.min = min ?? 0;
    this.max = max;
    this.textColor = textColor != null
        ? ColorUtil.hexToColor(textColor)
        : ColorUtil.hexToColor('#FFFFFF');
    this.fill = fill != null
        ? ColorUtil.hexToColor(fill)
        : ColorUtil.hexToColor('#409EFF');
  }
}

class WCheckboxGroupSlot extends BaseSlot {
  WCheckboxGroupSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WCheckboxButton extends WStatefulWidget<WCheckboxButtonOn,
    WCheckboxButtonProp, WCheckboxButtonSlot, WCheckboxButtonStyle> {
  WCheckboxButton({
    Key? key,
    WCheckboxButtonOn? on,
    WCheckboxButtonProp? props,
    WCheckboxButtonSlot? slots,
    WCheckboxButtonStyle? style,
  }) : super(key: key) {
    $on = on ?? WCheckboxButtonOn();
    $props = props ?? WCheckboxButtonProp();
    $slots = slots ?? WCheckboxButtonSlot(null);
    $style = style ?? WCheckboxButtonStyle();
    init();
  }

  @override
  _WCheckboxButtonState createState() => _WCheckboxButtonState();
}

class _WCheckboxButtonState extends WState<WCheckboxButton> {
  @override
  void initState() {
    super.initState();
    widget.$props.$addModelListener(() {
      setState(() {});
    });
  }

  @override
  Widget wbuild(BuildContext context) {
    return Listener(
      onPointerUp: widget.$props.disabled
          ? null
          : ((e) {
              if (widget.$props.model is bool) {
                widget.$props.model = !widget.$props.model;
              } else {
                if (widget.$props.model.contains(widget.$props.label)) {
                  widget.$props.model.remove(widget.$props.label);
                } else {
                  widget.$props.model.add(widget.$props.label);
                }
              }
              widget.$props.$modelNotifyListeners();
            }),
      child: MouseStateBuilder(
        builder: (context, state) {
          return Container(
            padding: CfgGlobal.roundPadding[widget.$props._size ?? 'large'],
            decoration: BoxDecoration(
              color: backgroudColor,
              borderRadius: borderRadius,
              border: border,
            ),
            child: widget.$slots.$ is Widget
                ? widget.$slots.$
                : Text(
                    widget.$slots.$ ?? 'null',
                    style: TextStyle(
                      color: state.isMouseOver &&
                              !widget.$props.isSelected &&
                              !widget.$props.disabled
                          ? CfgGlobal.primaryColor
                          : labelColor,
                      fontSize: height + 1,
                    ),
                  ),
          );
        },
      ),
    );
  }

  double get height {
    return iconRadius * 2;
  }

  Border get border {
    // var left = widget.$props.isFirst ? 5.0 : 0.0;
    // TODO 处理元素分隔 2 像素问题
    var borderSide = BorderSide(width: 1, color: borderColor);
    return Border.fromBorderSide(borderSide);
  }

  BorderRadius get borderRadius {
    var radius = cfgGlobal.radio.val(widget.$props._size!);
    var left = widget.$props.isFirst ? radius : 0.0;
    var right = widget.$props.isLast ? radius : 0.0;
    return BorderRadius.horizontal(
      left: Radius.circular(left),
      right: Radius.circular(right),
    );
  }

  double get iconRadius {
    return cfgGlobal.radio.val(widget.$props._size!);
  }

  Color get borderColor {
    return widget.$props.disabled && widget.$props.isSelected
        ? CfgGlobal.primaryColor.shade300
        : widget.$props.isSelected
            ? CfgGlobal.primaryColor.shade400
            : Colors.grey.shade300;
  }

  Color get backgroudColor {
    return widget.$props.disabled && widget.$props.isSelected
        ? CfgGlobal.primaryColor.shade100
        : widget.$props.isSelected
            ? CfgGlobal.primaryColor
            : widget.$props.disabled
                ? Colors.grey.shade100
                : Colors.white;
  }

  Color get labelColor {
    return widget.$props.disabled && widget.$props.isSelected
        ? CfgGlobal.primaryColor.shade900
        : widget.$props.isSelected
            ? Colors.white
            : widget.$props.disabled
                ? Colors.grey.shade700
                : Colors.black87;
  }
}

class WCheckboxButtonOn extends BaseOn {}

class WCheckboxButtonProp extends BaseProp with ModelDriveProp {
  late dynamic label;
  late dynamic trueLabel;
  late dynamic falseLabel;
  late bool disabled;
  late bool _disabled;
  String? name;
  late bool checked;
  late bool isFirst;
  late bool isLast;
  String? _size;

  WCheckboxButtonProp({
    dynamic label,
    dynamic trueLabel,
    dynamic falseLabel,
    bool? disabled,
    String? name,
    bool? checked,
    bool? isFirst,
    bool? isLast,
  }) {
    this.label = label;
    this.trueLabel = trueLabel;
    this.falseLabel = falseLabel;
    this.disabled = disabled ?? false;
    this._disabled = this.disabled;
    this.name = name;
    this.checked = checked ?? false;
    this.isFirst = isFirst ?? false;
    this.isLast = isLast ?? false;
  }
  bool get isSelected {
    if (label == null && model is bool) return model;
    return model.contains(label);
  }
}

class WCheckboxButtonSlot extends BaseSlot {
  WCheckboxButtonSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
