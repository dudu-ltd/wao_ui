import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';

class WRadio extends StatefulWidget
    implements BaseWidget<WRadioOn, WRadioProp, WRadioSlot> {
  @override
  late final WRadioOn $on;

  @override
  late final WRadioProp $props;

  @override
  late final WRadioSlot $slots;

  WRadio({
    Key? key,
    WRadioOn? on,
    WRadioProp? props,
    WRadioSlot? slots,
  }) : super(key: key) {
    $on = on ?? WRadioOn();
    $props = props ?? WRadioProp();
    $slots = slots ?? WRadioSlot(null);
  }
  @override
  _WRadioState createState() => _WRadioState();
}

class _WRadioState extends State<WRadio> {
  @override
  void initState() {
    super.initState();
    widget.$props.value.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
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
            Text(
              widget.$slots.defaultSlotBefore,
              style: TextStyle(
                color: labelColor,
                fontSize: height + 1,
              ),
            )
          ]),
        ),
        Border.fromBorderSide(BorderSide(width: 1, color: borderColor)),
        widget.$props.border,
        borderRadius: BorderRadius.all(
          Radius.circular(
            cfgGlobal.borderRadius.val(widget.$props.size),
          ),
        ),
      ),
    );
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

class WRadioGroup extends StatelessWidget
    implements BaseWidget<WRadioGroupOn, WRadioGroupProp, WRadioGroupSlot> {
  @override
  late final WRadioGroupOn $on;

  @override
  late final WRadioGroupProp $props;

  @override
  late final WRadioGroupSlot $slots;

  WRadioGroup({
    Key? key,
    WRadioGroupOn? on,
    WRadioGroupProp? props,
    WRadioGroupSlot? slots,
  }) : super(key: key) {
    $on = on ?? WRadioGroupOn();
    $props = props ?? WRadioGroupProp();
    $slots = slots ?? WRadioGroupSlot(null);
    if ($slots.defaultSlot != null) {
      var len = $slots.defaultSlot!.length;
      for (var i = 0; i < len; i++) {
        var child = $slots.defaultSlot![i];
        if (child is WRadio) {
          child.$props.value = $props.value;
          child.$props.disabled |= $props.disabled;
          child.$props.size = $props.size;
        } else if (child is WRadioButton) {
          child.$props._value = $props.value;
          child.$props.disabled |= $props.disabled;
          child.$props._size = $props.size;
          child.$props.isFirst = i == 0;
          child.$props.isLast = i == len - 1;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    if ($slots.hasDefault) {
      int len = $slots.defaultSlot!.length;
      for (var i = 0; i < len; i++) {
        children.add(
          marginWrapper(
            $slots.defaultSlot![i],
            const EdgeInsets.only(left: 8),
            needMargin: i != 0 && $slots.first is WRadio,
          ),
        );
      }
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
    this.textColor = Color(int.parse(textColor.replaceAll('#', '0xFF')));
    this.size = size ?? 'medium';
    fill = fill ?? '#409EFF';
    this.fill = Color(int.parse(fill.replaceAll('#', '0xFF')));
  }
}

class WRadioGroupSlot extends BaseSlot {
  WRadioGroupSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class _WRadioButtonState extends State<WRadioButton> {
  @override
  void initState() {
    super.initState();
    widget.$props._value.addListener(() {
      setState(() {});
    });
  }

  double get paddingV {
    return cfgGlobal.padding.val(widget.$props._size);
  }

  double get paddingH {
    return paddingV * 2;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: widget.$props.disabled
          ? (e) {}
          : ((e) {
              widget.$props._value.value = widget.$props.label;
            }),
      child: MouseStateBuilder(
        builder: (context, state) {
          return Container(
            padding:
                EdgeInsets.fromLTRB(paddingH, paddingV, paddingH, paddingV),
            decoration: BoxDecoration(
              color: backgroudColor,
              borderRadius: borderRadius,
              border: border,
            ),
            child: Text(
              widget.$slots.defaultSlotBefore,
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

class WRadioButton extends StatefulWidget
    implements BaseWidget<WRadioButtonOn, WRadioButtonProp, WRadioButtonSlot> {
  @override
  late final WRadioButtonOn $on;

  @override
  late final WRadioButtonProp $props;

  @override
  late final WRadioButtonSlot $slots;

  @override
  _WRadioButtonState createState() => _WRadioButtonState();
  WRadioButton({
    Key? key,
    WRadioButtonOn? on,
    WRadioButtonProp? props,
    WRadioButtonSlot? slots,
  }) : super(key: key) {
    $on = on ?? WRadioButtonOn();
    $props = props ?? WRadioButtonProp();
    $slots = slots ?? WRadioButtonSlot(null);
  }
}

class WRadioButtonOn extends BaseOn {}

class WRadioButtonProp extends BaseProp {
  late ValueNotifier _value;
  late dynamic label;
  late bool disabled;
  late bool isFirst;
  late bool isLast;
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
