import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';

class WRadio
    extends WStatefulWidget<WRadioOn, WRadioProp, WRadioSlot, WRadioStyle> {
  WRadio({
    Key? key,
    WRadioOn? on,
    WRadioProp? props,
    WRadioSlot? slots,
    WRadioStyle? style,
  }) : super(key: key) {
    $on = on ?? WRadioOn();
    $props = props ?? WRadioProp();
    $slots = slots ?? WRadioSlot(null);
    $style = style ?? WRadioStyle();
    init();
  }

  @override
  _WRadioState createState() => _WRadioState();

  @override
  // TODO: implement slotTranslatorsCustom
  List<SlotTranslator> get slotTranslatorsCustom => [
        SlotTranslator(
          WRadioGroup,
          (slot, i, c, l) {
            slot as WRadioGroup;
            slot.$style.button = $style.button;
            return slot;
          },
        ),
      ];
}

class _WRadioState extends WState<WRadio> {
  @override
  void initState() {
    super.initState();
    widget.$props.value.addListener(valueChange);
  }

  @override
  Widget wbuild(BuildContext context) {
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
              widget.$props.value.value = widget.$props.label;
            }),
      child: borderWrapper(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SizedBox(
                width: height,
                height: height,
                child: CustomPaint(
                  painter: _RadioIconPainter(
                    widget.$props.isSelected,
                    widget.$props.disabled,
                    labelColor: labelColor,
                    iconRadius: iconRadius,
                  ),
                ),
              ),
            ),
            widget.$slots.$ is Widget
                ? widget.$slots.$
                : Text(
                    widget.$slots.$ ?? 'null',
                    style: TextStyle(
                      color: labelColor,
                      fontSize: height + 1,
                    ),
                  )
          ]),
        ),
        Border.fromBorderSide(BorderSide(width: 1, color: borderColor)),
        widget.$props.border,
        borderRadius: widget.style.borderRadius,
      ),
    );
  }

  @override
  void dispose() {
    widget.$props.value.removeListener(valueChange);
    super.dispose();
  }

  void valueChange() {
    setState(() {});
  }

  Color get borderColor {
    return widget.$props.disabled && widget.$props.isSelected
        ? CfgGlobal.primaryColor.shade300
        : widget.$props.isSelected
            ? CfgGlobal.primaryColor
            : Colors.grey.shade300;
  }

  double get height {
    return iconRadius * 2;
  }

  double get iconRadius {
    return cfgGlobal.radio.val(widget.$props.size);
  }

  Color get labelColor {
    return widget.$props.disabled
        ? Colors.grey.shade400
        : widget.$props.isSelected
            ? CfgGlobal.primaryColor
            : Colors.black87;
  }
}

class _RadioIconPainter extends CustomPainter {
  late bool selected;
  late bool disabled;
  late bool isMedium;
  late bool isSmall;
  late bool isMini;
  late double iconRadius;
  late Color labelColor;

  _RadioIconPainter(
    this.selected,
    this.disabled, {
    this.isMedium = true,
    this.isSmall = false,
    this.isMini = false,
    required this.iconRadius,
    this.labelColor = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var p = Paint();
    if (selected) {
      if (!disabled) {
        p.color = CfgGlobal.primaryColor;
        canvas.drawCircle(Offset(iconRadius, iconRadius), iconRadius, p);
        p.color = Colors.white;
        canvas.drawCircle(Offset(iconRadius, iconRadius), 2, p);
      } else {
        p.color = Colors.grey.shade400;
        canvas.drawCircle(Offset(iconRadius, iconRadius), iconRadius, p);
        p.color = Colors.grey.shade100;
        canvas.drawCircle(Offset(iconRadius, iconRadius), iconRadius - 1, p);
        p.color = Colors.grey.shade400;
        canvas.drawCircle(Offset(iconRadius, iconRadius), iconRadius - 3, p);
      }
    } else {
      p.color = disabled ? Colors.grey.shade400 : Colors.grey.shade600;
      canvas.drawCircle(Offset(iconRadius, iconRadius), iconRadius, p);
      p.color = disabled ? Colors.grey.shade100 : Colors.white;
      canvas.drawCircle(Offset(iconRadius, iconRadius), iconRadius - 1, p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WRadioOn extends BaseOn {
  Function? change;
}

class WRadioProp extends BaseProp {
  late ValueNotifier value;
  late dynamic label;
  late bool disabled;
  late bool border;
  late String size;
  String? name;
  WRadioProp({
    ValueNotifier? value,
    dynamic label,
    bool? disabled,
    bool? border,
    String? size,
    String? name,
  }) {
    this.value = value ?? ValueNotifier('');
    this.label = label;
    this.disabled = disabled ?? false;
    this.border = border ?? false;
    this.size = size ?? 'medium';
    this.name = name ?? '';
  }

  bool get isSelected {
    return value.value == label;
  }
}

class WRadioSlot extends BaseSlot {
  WRadioSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WRadioGroup extends WStatelessWidget<WRadioGroupOn, WRadioGroupProp,
    WRadioGroupSlot, WRadioGroupStyle> {
  WRadioGroup({
    Key? key,
    WRadioGroupOn? on,
    WRadioGroupProp? props,
    WRadioGroupSlot? slots,
    WRadioGroupStyle? style,
  }) : super(key: key) {
    $on = on ?? WRadioGroupOn();
    $props = props ?? WRadioGroupProp();
    $slots = slots ?? WRadioGroupSlot(null);
    $style = style ?? WRadioGroupStyle();
    init();
  }

  @override
  List<SlotTranslator> get slotTranslatorsCustom {
    return [
      SlotTranslator(
        WRadio,
        (slot, i, component, len) {
          slot.$props
            ..value = $props.value
            ..disabled |= $props.disabled
            ..size = $props.size;
          slot as WRadio;
          slot.$style.merge(style.button);
          return slot;
        },
      ),
      SlotTranslator(
        WRadioButton,
        (slot, i, component, len) {
          slot.$props
            .._value = $props.value
            ..disabled |= $props.disabled
            .._size = $props.size
            ..isFirst = i == 0
            ..isLast = i == len - 1;

          slot as WRadioButton;

          slot.$style.merge(style.button);
          return slot;
        },
      )
    ];
  }

  @override
  Widget wbuild(BuildContext context) {
    var children = <Widget>[];
    int len = defaultSlot.length;
    for (var i = 0; i < len; i++) {
      children.add(
        marginWrapper(
          defaultSlot[i],
          const EdgeInsets.only(left: 8),
          needMargin: i != 0 && $first is WRadio,
        ),
      );
    }
    return Row(children: children);
  }
}

class WRadioGroupOn extends BaseOn {}

class WRadioGroupProp extends BaseProp {
  late ValueNotifier value;
  late String size;
  late bool disabled;
  late Color textColor;
  Color? fill;
  WRadioGroupProp({
    ValueNotifier? value,
    bool? disabled,
    String? size,
    String? textColor,
    String? fill,
  }) {
    this.value = value ?? ValueNotifier('');
    this.disabled = disabled ?? false;
    textColor = textColor ?? '#FFFFFF';
    this.textColor = ColorUtil.hexToColor(textColor);
    this.size = size ?? 'medium';
    fill = fill ?? '#409EFF';
    this.fill = ColorUtil.hexToColor(fill);
  }
}

class WRadioGroupSlot extends BaseSlot {
  WRadioGroupSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class _WRadioButtonState extends WState<WRadioButton> {
  @override
  void initState() {
    super.initState();
    widget.$props._value.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget wbuild(BuildContext context) {
    return Listener(
      onPointerUp: widget.$props.disabled
          ? (e) {}
          : ((e) {
              widget.$props._value.value = widget.$props.label;
            }),
      child: MouseStateBuilder(
        builder: (context, state) {
          return Container(
            padding: widget.style.padding,
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
            ? CfgGlobal.primaryColor
            : Colors.grey.shade300;
  }

  Color get backgroudColor {
    return widget.$props.disabled && widget.$props.isSelected
        ? CfgGlobal.primaryColor.shade200
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

class WRadioButton extends WStatefulWidget<WRadioButtonOn, WRadioButtonProp,
    WRadioButtonSlot, WRadioButtonStyle> {
  WRadioButton({
    Key? key,
    WRadioButtonOn? on,
    WRadioButtonProp? props,
    WRadioButtonSlot? slots,
    WRadioButtonStyle? style,
  }) : super(key: key) {
    $on = on ?? WRadioButtonOn();
    $props = props ?? WRadioButtonProp();
    $slots = slots ?? WRadioButtonSlot(null);
    $style = style ?? WRadioButtonStyle();
    init();
  }

  @override
  _WRadioButtonState createState() => _WRadioButtonState();
}

class WRadioButtonOn extends BaseOn {}

class WRadioButtonProp extends BaseProp {
  late dynamic label;
  late bool disabled;
  late bool isFirst;
  late bool isLast;
  late ValueNotifier _value;
  String? _size;
  String? name;
  WRadioButtonProp({
    dynamic label,
    bool? isFirst,
    bool? isLast,
    bool? disabled,
    String? name,
  }) {
    this.label = label;
    this.disabled = disabled ?? false;
    this.isFirst = isFirst ?? false;
    this.isLast = isLast ?? false;
    this.name = name ?? '';
  }
  bool get isSelected {
    return _value.value == label;
  }
}

class WRadioButtonSlot extends BaseSlot {
  WRadioButtonSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
