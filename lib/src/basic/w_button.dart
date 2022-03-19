import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:wao_ui/src/others/w_spin.dart';
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

  final FocusNode focusNode = FocusNode();

  var setState;

  bool isHover = false;

  bool active = false;

  bool get focus {
    return focusNode.hasFocus;
  }

  void styleWrap() {
    style.merge(cfgGlobal.button);
    style.wrap(
      [
        $style?.type ?? cfgGlobal.button.type,
        // $style?.mini ?? cfgGlobal.button.mini,
        // $style?.small ?? cfgGlobal.button.small,
        // $style?.medium ?? cfgGlobal.button.medium,
        // $style?.isRound ?? cfgGlobal.button.isRound,
        // $style?.isCircle ?? cfgGlobal.button.isCircle,
        // $style?.isDisabled ?? cfgGlobal.button.isDisabled,
        // $style?.isPlain ?? cfgGlobal.button.isPlain,
        // $style?.hover ?? cfgGlobal.button.hover,
        // $style?.active ?? cfgGlobal.button.active,
        // $style?.whenText ?? cfgGlobal.button.whenText,
        // $style?.whenTextHover ?? cfgGlobal.button.whenTextHover,
        // $style?.whenTextDisabled ?? cfgGlobal.button.whenTextDisabled,
      ],
      this,
    );
  }

  var mouseState;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      styleWrap();
      var btn = Container(
        alignment: style.textAlign,
        constraints: BoxConstraints(minWidth: buttonMinWidth),
        padding: style.padding,
        decoration: BoxDecoration(
          color: style.backgroundColor,
          borderRadius: BorderRadius.all(style.radius!),
          border: style.border,
        ),
        child: content,
      );

      return MouseRegion(
        opaque: false,
        onEnter: (e) {
          isHover = true;
          setState(() {});
        },
        onExit: (e) {
          isHover = false;
          setState(() {});
        },
        cursor: style.cursor!,
        child: Material(
          color: style.backgroundColor,
          borderRadius: BorderRadius.all(style.radius!),
          child: $props.disabled
              ? btn
              : InkWell(
                  focusNode: focusNode,
                  hoverColor: style.borderColor,
                  borderRadius: BorderRadius.all(style.radius!),
                  onTap: () => $on.click,
                  onTapDown: (e) => setState(() => active = true),
                  onTapUp: (e) => setState(() => active = false),
                  child: btn,
                ),
        ),
      );
    });
  }

  Widget get content {
    Widget box = const SizedBox(
      width: 5,
    );
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.spaceBetween,
      spacing: 5,
      children: [
        if ($props.loading)
          WSpin(
            child: iconCenter(Icons.rotate_right_rounded),
          ),
        if ($props.icon != null) iconCenter($props.icon!),
        defaultSlot.first,
        if ($props.iconRight != null) iconCenter($props.iconRight!)
      ],
    );
  }

  Widget iconCenter(IconData icon) {
    return SizedBox(
      height: (style.fontSize ?? 14) / CfgGlobal.fontRate,
      child: Icon(
        icon,
        color: style.color,
        size: (style.fontSize ?? 14) / CfgGlobal.fontRate,
      ),
    );
  }

  @override
  List<SlotTranslator> get slotTranslatorsCustom {
    return <SlotTranslator>[
      SlotTranslator(
        IconData,
        (s, i, c, l) {
          return iconCenter(s);
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
