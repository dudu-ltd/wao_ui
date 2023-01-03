// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:wao_ui/src/others/w_spin.dart';
import 'package:wao_ui/wao_ui.dart';

class WButton
    extends WStatefulWidget<WButtonOn, WButtonProp, WButtonSlot, WButtonStyle> {
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

  @override
  bool get useBox => false;
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
    ];
  }
}

class _WButtonState extends WState<WButton> {
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
    super.dispose();
    focusNode.dispose();
  }

  Widget get content {
    return Wrap(
      alignment: WrapAlignment.center,
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
    return widget.$style.minWidth ?? cfgGlobal.button.minWidth ?? 30;
  }

  @override
  Widget wbuild(BuildContext context) {
    var btn = widget.boxWrapper(content, context);

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
      cursor: widget.style.cursor ?? SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.$on.click,
        onTapDown: (e) => setState(() => widget.active = true),
        onTapUp: (e) => setState(() => widget.active = false),
        child: btn,
      ),
    );
  }
}

class WButtonOn extends BaseOn {
  void Function()? click;
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

class WButtonProp extends BaseProp with HasFirstAndLastProp {
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
    bool? isFirst,
    bool? isLast,
    this.inGroup = false,
  }) {
    this.isFirst = isFirst ?? this.isFirst;
    this.isLast = isLast ?? this.isLast;
    this.size = size ?? 'large';
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

  WButtonProp copy() {
    return WButtonProp(
      size: this.size,
      type: this.type,
      plain: this.plain,
      round: this.round,
      circle: this.circle,
      loading: this.loading,
      disabled: this.disabled,
      icon: this.icon,
      iconRight: this.iconRight,
      autofocus: this.autofocus,
      active: this.active,
      inGroup: this.inGroup,
      isFirst: this.isFirst,
      isLast: this.isLast,
    );
  }

  @override
  String toString() {
    return '''
      size = $size,
      type = $type,
      plain = $plain,
      round = $round,
      circle = $circle,
      loading = $loading,
      disabled = $disabled,
      icon = $icon,
      iconRight = $iconRight,
      autofocus = $autofocus,
      active = $active,
      isFirst = $isFirst,
      isLast = $isLast,
    ''';
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

class WButtonGroup extends WStatelessWidget<WButtonGroupOn, WButtonGroupProp,
    WButtonGroupSlot, WButtonGroupStyle> {
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
    init();
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
  Widget wbuild(BuildContext context) {
    return $props.direction == Axis.horizontal ? $row : $col;
  }
}

class WButtonGroupOn extends BaseOn {}

class WButtonGroupProp extends BaseProp {
  Axis direction = Axis.horizontal;
}

class WButtonGroupSlot extends BaseSlot {
  WButtonGroupSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WIconButtonGroup extends WStatelessWidget<WIconButtonGroupOn,
    WIconButtonGroupProp, WIconButtonGroupSlot, WIconButtonGroupStyle> {
  WIconButtonGroup({
    Key? key,
    WIconButtonGroupOn? on,
    WIconButtonGroupProp? props,
    WIconButtonGroupSlot? slots,
    WIconButtonGroupStyle? style,
  }) : super(key: key) {
    $on = on ?? WIconButtonGroupOn();
    $props = props ?? WIconButtonGroupProp();
    $slots = slots ?? WIconButtonGroupSlot(null);
    $style = style ?? WIconButtonGroupStyle();
    init();
  }
  @override
  Widget wbuild(BuildContext context) {
    return WButtonGroup()
      ..$props.direction = $props.direction
      ..$slots.$ = [
        ...icons,
        ...($slots.defaultSlot ?? []),
      ]
      ..$style.merge($style);
  }

  get icons {
    var cmdBtns = <Widget>[];
    $props.commands?.forEach((key, value) {
      if (key is Widget) {
        cmdBtns.add(key);
        return;
      }
      var cmdBtn = WButton(
        props: $props.copy(),
      )
        ..$props.icon = key
        ..$on.click = value;
      cmdBtns.add(cmdBtn);
    });
    return cmdBtns;
  }
}

class WIconButtonGroupOn extends BaseOn {}

class WIconButtonGroupProp extends WButtonProp {
  Axis direction = Axis.horizontal;
  Map<dynamic, Function()>? commands;
}

class WIconButtonGroupSlot extends BaseSlot {
  WIconButtonGroupSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WIconButtonGroupStyle extends BaseStyle {
  @override
  WIconButtonGroupStyle newInstance() {
    return WIconButtonGroupStyle();
  }
}
