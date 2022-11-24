// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

import '../../core/base_style.dart';

class WForm
    extends WStatelessWidget<WFormOn, WFormProp, WFormSlot, WFormStyle> {
  GlobalKey formKey = GlobalKey();

  WForm({
    Key? key,
    WFormOn? on,
    WFormProp? props,
    WFormSlot? slots,
    WFormStyle? style,
  }) : super(key: key) {
    $on = on ?? WFormOn();
    $props = props ?? WFormProp(model: {});
    $slots = slots ?? WFormSlot(null);
    $style = style ?? WFormStyle();
    init();
  }

  final Map<String, ModelDriveProp> _useForReset = {};

  reset() {
    for (var prop in _useForReset.values) {
      var v = prop.model;
      if (v is Map) {
        prop.model = {};
      } else if (v is List) {
        prop.model = [];
      } else if (v is Set) {
        prop.model = <dynamic>{};
      } else {
        prop.model = null;
      }
    }
  }

  @override
  List<SlotTranslator> get slotTranslatorsCustom => [
        SlotTranslator(
          WFormItem,
          (slot, i, c, l) {
            slot as WFormItem;
            if (i == 0) slot.$props.isFirst = true;
            if (i == l - 1) slot.$props.isLast = true;
            slot.belongTo = c;
            return slot;
          },
        )
      ];

  @override
  Widget wbuild(BuildContext context) {
    var items = defaultSlot;
    Timer(Duration(seconds: 1), () {
      FormState fs = formKey.currentState as FormState;
      fs.validate();
    });
    return Form(
      key: formKey,
      child: Wrap(
        direction: Axis.horizontal,
        runSpacing: 8,
        children: items,
      ),
    );
  }
}

class WFormOn extends BaseOn {}

class WFormProp extends FormFieldProp {
  late dynamic rules;
  late bool inline; // √
  late String labelPosition; // √
  late double? labelWidth; // √
  late String? labelSuffix;
  late bool hideRequiredAsterisk;
  late bool showMessage;
  late bool inlineMessage;
  late bool statusIcon;
  late bool validateOnRuleChange;

  WFormProp({
    required Map<String, dynamic> model,
    this.rules,
    bool? inline,
    String? labelPosition,
    this.labelWidth,
    this.labelSuffix,
    bool? hideRequiredAsterisk,
    bool? showMessage,
    bool? inlineMessage,
    bool? statusIcon,
    bool? validateOnRuleChange,
    String? size,
    bool? disabled,
  }) {
    this.size = size ?? 'large';
    this.model = model;
    this.inline = inline ?? false;
    this.labelPosition = labelPosition ?? 'right';
    this.hideRequiredAsterisk = hideRequiredAsterisk ?? false;
    this.showMessage = showMessage ?? true;
    this.inlineMessage = inlineMessage ?? false;
    this.statusIcon = statusIcon ?? false;
    this.validateOnRuleChange = validateOnRuleChange ?? true;
    this.disabled = disabled ?? false;
  }

  bool get isLabelPositionRight {
    return labelPosition == 'right';
  }

  bool get isLabelPositionLeft {
    return labelPosition == 'left';
  }

  bool get isLabelPositionTop {
    return labelPosition == 'top';
  }
}

class WFormSlot extends BaseSlot {
  WFormSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WFormItem extends WStatelessWidget<WFormItemOn, WFormItemProp,
    WFormItemSlot, WFormItemStyle> {
  WForm? belongTo;
  WFormItem({
    Key? key,
    WFormItemOn? on,
    WFormItemProp? props,
    WFormItemSlot? slots,
    WFormItemStyle? style,
  }) : super(key: key) {
    $on = on ?? WFormItemOn();
    $props = props ?? WFormItemProp();
    $slots = slots ?? WFormItemSlot(null);
    $style = style ?? WFormItemStyle();
    init();
  }

  final Map<String, Function(dynamic)?> _inputOnChange = {};

  @override
  List<SlotTranslator> get slotTranslatorsCustom => [
        SlotTranslator(
          null,
          (slot, i, c, l) {
            var p = slot.$props as FormFieldProp;
            c as WFormItem;
            assert(c.$props.prop != null,
                r'''WFormItem $props's prop can not be null when slot is an form widget. 
                (当插槽是表单元素时, WFormItem $props 的 prop 属性不能为空。)''');
            belongTo?._useForReset[c.$props.prop!] = p;
            p.model = belongTo?.$props.model[c.$props.prop];
            p.$model?.addListener(() {
              debugPrint('-------------p.\$model?.addListener----');
              belongTo?.$props.model[c.$props.prop] = p.model;
            });
            p.size = belongTo?.$props.size ?? 'large';
            p.disabled = belongTo?.$props.disabled ?? false;
            if (slot is WInput) {
              _inputOnChange.putIfAbsent(c.$props.prop!, () => slot.$on.change);
              slot.$on.change = (v) {
                belongTo?.$props.model[c.$props.prop] = v;
                _inputOnChange[c.$props.prop]?.call(v);
              };
            }
            return slot;
          },
          (slot) => slot is BaseMixins && slot.$props is FormFieldProp,
        )
      ];

  @override
  Widget wbuild(BuildContext context) {
    if (belongTo?.$props.isLabelPositionTop ?? false) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) label!,
          ...defaultSlot,
        ],
      );
    }
    return Row(
      children: [
        if (label != null) label!,
        Expanded(
          child: Wrap(children: defaultSlot),
        )
      ],
    );
  }

  Widget? get label {
    var label = slotToWidget($props.label, 0);
    return SizedBox(
      width: $props.labelWidth ?? belongTo?.$props.labelWidth,
      child: _labelAlignWrapper(label),
    );
  }

  _labelAlignWrapper(Widget? label) {
    Alignment labelAlignment = (belongTo?.$props.isLabelPositionRight ?? true)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Align(
      child: label,
      alignment: labelAlignment,
    );
  }
}

class WFormItemOn extends BaseOn {}

class WFormItemProp extends BaseProp with HasFirstAndLastProp {
  String? prop; // √
  String? label; // √
  double? labelWidth; // √
  bool required = false;
  dynamic rules;
  String? error;
  bool showMessage = true;
  bool inlineMessage = false;
  String? size;
}

class WFormItemSlot extends BaseSlot {
  WFormItemSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WFormItemStyle extends BaseStyle {
  @override
  WFormItemStyle newInstance() {
    return WFormItemStyle();
  }
}

enum FormValidTrigger {
  blur,
  change,
}

enum FormFieldType {
  string,
  number,
  boolean,
  method,
  regexp,
  creating,
  integer,
  float,
  array,
  object,
  enums,
  date,
  url,
  hex,
  email,
  any
}

class FormValidRule {
  bool? required;
  String? message;
  FormValidTrigger? trigger;
  double? min;
  double? max;
  FormFieldType? type;
  int? len;
  Map<String, FormValidRule>? fields;
  List? enums;
}
