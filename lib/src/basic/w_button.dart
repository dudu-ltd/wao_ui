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

class WButton extends StatefulWidget
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
  FocusNode? focusNode;

  bool isHover = false;

  bool active = false;

  bool get focus {
    return focusNode?.hasFocus ?? false;
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

  @override
  State<WButton> createState() => _WButtonState();

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
}

class _WButtonState extends State<WButton> {
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode = FocusNode();
    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.styleWrap();
    var btn = Container(
      alignment: widget.style.textAlign,
      // constraints: BoxConstraints(minWidth: buttonMinWidth),
      padding: widget.style.padding,
      decoration: BoxDecoration(
        color: widget.style.backgroundColor,
        borderRadius: widget.style.borderRadius,
        // borderRadius: BorderRadius.circular(30),
        border: widget.style.border,
      ),
      child: content,
    );

    return MouseRegion(
      opaque: false,
      onEnter: (e) {
        widget.isHover = true;
        setState(() {});
      },
      onExit: (e) {
        widget.isHover = false;
        setState(() {});
      },
      cursor: widget.style.cursor!,
      child: Material(
        type: MaterialType.button,
        color: widget.style.backgroundColor,
        borderRadius: widget.style.borderRadius,
        // borderRadius: BorderRadius.circular(30),
        child: widget.$props.disabled
            ? btn
            : InkWell(
                focusNode: widget.focusNode,
                hoverColor: widget.style.borderColor,
                borderRadius: widget.style.borderRadius,
                // borderRadius: BorderRadius.circular(30),
                onTap: widget.$on.click,
                onTapDown: (e) => setState(() => widget.active = true),
                onTapUp: (e) => setState(() => widget.active = false),
                child: btn,
              ),
      ),
    );
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
        if (widget.$props.loading)
          WSpin(
            child: widget.iconCenter(Icons.rotate_right_rounded),
          ),
        if (widget.$props.icon != null) widget.iconCenter(widget.$props.icon!),
        widget.defaultSlot.first,
        if (widget.$props.iconRight != null)
          widget.iconCenter(widget.$props.iconRight!)
      ],
    );
  }

  double get buttonMinWidth {
    return widget.$style?.minWidth ?? cfgGlobal.button.minWidth ?? 30;
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

  bool isFirst = false;
  bool isLast = false;

  bool inGroup = false;

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
    this.isFirst = false,
    this.isLast = false,
  }) {
    this.size = size;
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

class WButtonGroup extends StatelessWidget
    with
        BaseMixins<WButtonGroupOn, WButtonGroupProp, WButtonGroupSlot,
            WButtonGroupStyle> {
  WButtonGroup({
    Key? key,
    WButtonGroupOn? on,
    WButtonGroupProp? props,
    WButtonGroupSlot? slots,
    WButtonGroupStyle? style,
  }) : super(key: key) {
    $on = on ?? WButtonGroupOn();
    $props = props ?? WButtonGroupProp();
    $slots = slots ?? WButtonGroupSlot(null);
    $style = style ?? WButtonGroupStyle();
  }

  @override
  List<SlotTranslator> get slotTranslatorsCustom {
    return <SlotTranslator>[
      SlotTranslator(WButton, (slot, i, conponent, len) {
        slot as WButton;
        slot.$props.inGroup = true;
        if (i == 0) {
          slot.$props.isFirst = true;
        }
        if (i == len - 1) {
          slot.$props.isLast = true;
        }
        return slot;
      })
    ];
  }

  @override
  Widget build(BuildContext context) {
    return $row;
  }
}

class WButtonGroupOn extends BaseOn {}

class WButtonGroupProp extends BaseProp {}

class WButtonGroupSlot extends BaseSlot {
  WButtonGroupSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
