import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:wao_ui/wao_ui.dart';
import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';

// TODO 修改按钮前景色
// TODO 使 icon 跟 defaultSlot 并存
class WButton extends StatelessWidget
    with BaseMixins<WButtonOn, WButtonProp, WButtonSlot, WButtonStyle> {
  WButton({
    Key? key,
    WButtonOn? on,
    WButtonProp? props,
    WButtonSlot? slots,
    WButtonStyle? style,
  }) : super(key: key) {
    $on = on ?? WButtonOn();
    $props = props ?? WButtonProp();
    $slots = slots ?? WButtonSlot(null);
    $style = style ?? WButtonStyle();
    init();
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
    var paddingH = paddingV / ($props.circle ? 1 : .4);
    var baseColor = cfgGlobal.color.val($props.type);
    return MouseStateBuilder(
      builder: (context, mouseState) {
        TypeButtonColor colors = TypeButtonColor.byPlain(
            baseColor, $props.plain, mouseState, $props.type);
        handleDefaultSlot(colors);
        var btn = Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(minWidth: buttonMinWidth),
          padding: EdgeInsets.fromLTRB(
            $props.icon != null && !$props.circle ? paddingH - 4 : paddingH,
            paddingV,
            $props.iconRight != null && !$props.circle
                ? paddingH - 4
                : paddingH,
            paddingV,
          ),
          decoration: BoxDecoration(
            color: $props.active ? colors.focus : null,
            borderRadius: BorderRadius.all(radius),
            border: !$props.typeIsText
                ? Border.all(
                    width: 1,
                    color: colors.borderColor,
                  )
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if ($props.icon != null)
                Icon(
                  $props.icon,
                  color: colors.inner,
                  size: 16,
                ),
              defaultSlot.first,
              if ($props.iconRight != null)
                Icon(
                  $props.iconRight,
                  color: colors.inner,
                  size: 16,
                ),
            ],
          ),
        );
        return _inkWellWrapper(btn, colors, radius);
      },
    );
  }

  double get buttonMinWidth {
    return $style?.minWidth ?? cfgGlobal.button.minWidth ?? 30;
  }

  Widget _inkWellWrapper(Widget btn, TypeButtonColor colors, Radius radius) {
    if ($props.loading) return btn;

    return Material(
      color: colors.background,
      borderRadius: BorderRadius.all(radius),
      child: InkWell(
        splashColor: colors.splashColor.withOpacity(.3),
        focusColor: colors.focus,
        hoverColor: colors.hover,
        highlightColor: colors.highlight,
        borderRadius: BorderRadius.all(radius),
        onTap: $on.click,
        child: btn,
      ),
    );
  }

  handleDefaultSlot(TypeButtonColor colors) {
    $defaultSlot = [
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
  late Color background;
  late Color splashColor;
  late Color display;
  late Color hover;
  late Color inner;
  late Color focus;
  late Color highlight;
  late Color borderColor;
  TypeButtonColor({
    required this.background,
    required this.splashColor,
    required this.display,
    required this.hover,
    required this.inner,
    required this.focus,
    required this.highlight,
    required this.borderColor,
  });
  factory TypeButtonColor.byPlain(
      MaterialColor baseColor, bool plain, mouseState, type) {
    TypeButtonColor result;
    if (type == null) {
      baseColor = cfgGlobal.color.primary;
      if (plain) {
        result = TypeButtonColor(
            background: CfgGlobal.blankColor.withAlpha(150),
            splashColor: CfgGlobal.blankColor,
            display: CfgGlobal.blankColor,
            hover: CfgGlobal.blankColor.withAlpha(150),
            inner: mouseState.isMouseOver
                ? cfgGlobal.color.primary.shade400
                : Colors.grey,
            focus: CfgGlobal.blankColor,
            highlight: CfgGlobal.blankColor,
            borderColor: mouseState.isMouseOver
                ? cfgGlobal.color.primary.shade400
                : Colors.grey.shade300);
      } else {
        result = TypeButtonColor(
            background: CfgGlobal.blankColor.withAlpha(150),
            splashColor: baseColor.shade100,
            display: baseColor.shade50,
            hover: CfgGlobal.blankColor.withAlpha(150),
            inner: mouseState.isMouseOver
                ? cfgGlobal.color.primary.shade400
                : Colors.grey,
            focus: baseColor.shade50,
            highlight: baseColor.shade100,
            borderColor: mouseState.isMouseOver
                ? cfgGlobal.color.primary.shade400
                : Colors.grey.shade300);
      }
    } else {
      if (plain) {
        result = TypeButtonColor(
          background: baseColor.withAlpha(50),
          splashColor: baseColor.shade100,
          display: baseColor.shade100,
          hover: baseColor.shade400,
          inner:
              mouseState.isMouseOver ? baseColor.shade50 : baseColor.shade600,
          focus: baseColor.shade500,
          highlight: baseColor.shade700,
          borderColor: baseColor,
        );
      } else {
        result = TypeButtonColor(
          background: baseColor.withAlpha(255),
          splashColor: baseColor.shade500,
          display: baseColor.shade400,
          hover: baseColor.shade300,
          inner: type == 'text' ? CfgGlobal.primaryColor : baseColor.shade50,
          focus: baseColor.shade300,
          highlight: baseColor.shade100,
          borderColor: baseColor,
        );
      }
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
  late String? type;
  late bool plain;
  late bool round;
  late bool circle;
  late bool loading;
  late bool disabled;
  IconData? icon;
  IconData? iconRight;
  late bool autofocus;

  late bool active;

  WButtonProp({
    size,
    type,
    plain,
    round,
    circle,
    loading,
    disabled,
    icon,
    iconRight,
    autofocus,
    active,
  }) {
    this.size = buttonSize.contains(size) ? size : 'small';
    this.type = buttonTypes.contains(type) ? type : null;
    this.plain = plain ?? false;
    this.round = round ?? false;
    this.circle = circle ?? false;
    this.loading = loading ?? false;
    this.disabled = disabled ?? false;
    this.icon = icon;
    this.iconRight = iconRight;
    this.autofocus = autofocus ?? false;
    this.active = active ?? false;
  }

  bool get typeIsText {
    return type == 'text';
  }
}

class WButtonSlot extends BaseSlot {
  WButtonSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
