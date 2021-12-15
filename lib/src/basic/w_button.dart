import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';

// TODO 修改按钮前景色
// TODO 使 icon 跟 defaultSlot 并存
class WButton extends StatelessWidget
    implements BaseWidget<WButtonOn, WButtonProp, WButtonSlot> {
  @override
  late WButtonOn $on;

  @override
  late WButtonProp $props;

  @override
  late WButtonSlot $slots;

  WButton(
    dynamic defaultSlot, {
    Key? key,
    WButtonOn? on,
    WButtonProp? props,
    WButtonSlot? slots,
  }) : super(key: key) {
    $on = on ?? WButtonOn();
    $props = props ?? WButtonProp();
    $slots = slots ?? WButtonSlot();
    $slots.defaultSlotBefore = defaultSlot;
  }

  @override
  Widget build(BuildContext context) {
    var radius = Radius.circular(
      $props.circle
          ? cfgGlobal.borderRadius.circle
          : $props.round
              ? cfgGlobal.borderRadius.round
              : cfgGlobal.borderRadius.val($props.size),
    );
    var paddingV = cfgGlobal.padding.val($props.size);
    var paddingH = paddingV / ($props.circle ? 1 : .5);
    var baseColor = cfgGlobal.color.val($props.type);
    return MouseStateBuilder(builder: (context, mouseState) {
      TypeButtonColor colors =
          TypeButtonColor.byPlain(baseColor, $props.plain, mouseState);
      handleDefaultSlot(colors);
      return InkWell(
        splashColor: colors.splashColor.withOpacity(.3),
        focusColor: colors.focus,
        hoverColor: colors.hover,
        // highlightColor: colors.highlight,
        borderRadius: BorderRadius.all(radius),
        onTap: $on.click,
        child: Container(
          padding: EdgeInsets.fromLTRB(paddingH, paddingV, paddingH, paddingV),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(radius),
            border: Border.all(
              width: 1,
              color: cfgGlobal.color.val($props.type),
            ),
          ),
          child: $slots.defaultSlot![0],
        ),
      );
    });
  }

  handleDefaultSlot(TypeButtonColor colors) {
    $slots.defaultSlot = [
      $slots.defaultSlotBefore == null
          ? Text('', style: TextStyle(color: colors.inner))
          : $slots.defaultSlotBefore is IconData
              ? Icon(
                  $slots.defaultSlotBefore,
                  color: colors.inner,
                )
              : $slots.defaultSlotBefore is Widget
                  ? $slots.defaultSlotBefore
                  : $slots.defaultSlotBefore is String
                      ? Text(
                          $slots.defaultSlotBefore,
                          style: TextStyle(color: colors.inner),
                        )
                      : Container(),
    ];
  }
}

class TypeButtonColor {
  late Color splashColor;
  late Color display;
  late Color hover;
  late Color inner;
  late Color focus;
  late Color highlight;
  TypeButtonColor({
    required this.splashColor,
    required this.display,
    required this.hover,
    required this.inner,
    required this.focus,
    required this.highlight,
  });
  factory TypeButtonColor.byPlain(
      MaterialColor baseColor, bool plain, mouseState) {
    TypeButtonColor result;
    if (plain) {
      result = TypeButtonColor(
        splashColor: baseColor.shade100,
        display: baseColor.shade100,
        hover: baseColor.shade400,
        inner: mouseState.isMouseOver ? baseColor.shade50 : baseColor.shade600,
        focus: baseColor.shade500,
        highlight: baseColor.shade700,
      );
    } else {
      result = TypeButtonColor(
        splashColor: baseColor.shade500,
        display: baseColor.shade400,
        hover: baseColor.shade50,
        inner: mouseState.isMouseOver ? baseColor.shade900 : baseColor.shade600,
        focus: baseColor.shade300,
        highlight: baseColor.shade100,
      );
    }
    return result;
  }
}

class WButtonOn extends BaseOn {
  late void Function() click;
  WButtonOn({click}) {
    this.click = click ?? () {};
  }
}

var buttonSize = [
  'mini',
  'small',
  'medium',
  'large',
];

var buttonTypes = [
  'primary',
  'success',
  'warning',
  'danger',
  'info',
  'text',
];

class WButtonProp extends BaseProp {
  late String size;
  late String type;
  late bool plain;
  late bool round;
  late bool circle;
  late bool loading;
  late bool disabled;
  IconData? icon;
  late bool autofocus;

  WButtonProp({
    size,
    type,
    plain,
    round,
    circle,
    loading,
    disabled,
    icon,
    autofocus,
  }) {
    this.size = buttonSize.contains(size) ? size : 'small';
    this.type = buttonTypes.contains(type) ? type : 'info';
    this.plain = plain ?? false;
    this.round = round ?? false;
    this.circle = circle ?? false;
    this.loading = loading ?? false;
    this.disabled = disabled ?? false;
    this.icon = icon;
    this.autofocus = autofocus ?? false;
  }
}

class WButtonSlot extends BaseSlot {
  @override
  setDefaultSlot() {}
}
