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

  bool get isHover {
    return mouseState?.isMouseOver ?? false;
  }

  void styleWrap() {
    style.merge(cfgGlobal.button);
    style.wrap(
      [
        $style?.mini ?? cfgGlobal.button.mini,
        $style?.small ?? cfgGlobal.button.small,
        $style?.medium ?? cfgGlobal.button.medium,
        $style?.primary ?? cfgGlobal.button.primary,
        $style?.success ?? cfgGlobal.button.success,
        $style?.warning ?? cfgGlobal.button.warning,
        $style?.danger ?? cfgGlobal.button.danger,
        $style?.info ?? cfgGlobal.button.info,
        $style?.text ?? cfgGlobal.button.text,
        $style?.isRound ?? cfgGlobal.button.isRound,
        $style?.isCircle ?? cfgGlobal.button.isCircle,
        $style?.isDisabled ?? cfgGlobal.button.isDisabled,
        $style?.isPlain ?? cfgGlobal.button.isPlain,
        $style?.hover ?? cfgGlobal.button.hover,
        $style?.active ?? cfgGlobal.button.active,
      ],
      this,
    );
  }

  var mouseState;

  @override
  Widget build(BuildContext context) {
    return MouseStateBuilder(
      builder: (context, mouseState) {
        this.mouseState = mouseState;
        styleWrap();
        var btn;
        btn = Container(
          alignment: style.textAlign,
          constraints: BoxConstraints(minWidth: buttonMinWidth),
          padding: style.padding,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(style.radius!),
            border: style.border,
          ),
          child: content,
        );
        btn = MouseRegion(
          cursor: style.cursor!,
          child: btn,
        );
        return _inkWellWrapper(btn, radius);
      },
    );
  }

  Widget get content {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if ($props.icon != null)
          Icon(
            $props.icon,
            color: style.color,
            size: style.fontSize,
          ),
        defaultSlot.first,
        if ($props.iconRight != null)
          Icon(
            $props.iconRight,
            color: style.color,
            size: style.fontSize,
          ),
      ],
    );
  }

  Widget _inkWellWrapper(Widget btn, Radius radius) {
    if ($props.loading) return btn;

    return Material(
      color: style.backgroundColor,
      borderRadius: BorderRadius.all(style.radius!),
      child: $props.disabled
          ? btn
          : InkWell(
              splashColor: CfgGlobal.color($props.type).shade900,
              focusColor: CfgGlobal.color($props.type).shade700,
              hoverColor: CfgGlobal.color($props.type).shade700,
              highlightColor: CfgGlobal.color($props.type).shade900,
              borderRadius: BorderRadius.all(style.radius!),
              onTap: $on.click,
              child: btn,
            ),
    );
  }

  @override
  List<SlotTranslator> get slotTranslatorsCustom {
    return <SlotTranslator>[
      SlotTranslator(
        IconData,
        (s, i, c, l) {
          return Icon(
            $slots.$,
            color: style.color,
          );
        },
      ),
      SlotTranslator(
        Null,
        (s, i, c, l) => Text('', style: TextStyle(color: style.color)),
      ),
      SlotTranslator(
        String,
        (s, i, c, l) {
          return Text(
            $slots.$,
            style: TextStyle(
              color: style.color,
              fontSize: style.fontSize,
            ),
          );
        },
      ),
    ];
  }

  double get buttonMinWidth {
    return $style?.minWidth ?? cfgGlobal.button.minWidth ?? 30;
  }

  Radius get radius {
    return $style?.radius ??
        cfgGlobal.button.radius ??
        Radius.circular(
          $props.circle
              ? cfgGlobal.borderRadius.circle
              : $props.round
                  ? cfgGlobal.borderRadius.round
                  : cfgGlobal.borderRadius.val($props.size),
        );
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

  bool get typeIsPrimary {
    return type == 'primary';
  }

  bool get typeIsSuccess {
    return type == 'success';
  }

  bool get typeIsWarning {
    return type == 'warning';
  }

  bool get typeIsDanger {
    return type == 'danger';
  }

  bool get typeIsInfo {
    return type == 'info';
  }

  bool get typeIsEmpty {
    return type == null;
  }

  bool get sizeIsMini {
    return size == 'mini';
  }

  bool get sizeIsSmall {
    return size == 'small';
  }

  bool get sizeIsMedium {
    return size == 'medium';
  }
}

class WButtonSlot extends BaseSlot {
  WButtonSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
