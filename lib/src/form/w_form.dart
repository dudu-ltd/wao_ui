import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class WForm extends StatelessWidget
    with BaseMixins<WFormOn, WFormProp, WFormSlot, WFormStyle> {
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

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WFormOn extends BaseOn {}

class WFormProp extends BaseProp {
  late Map<String, ValueNotifier<dynamic>> model;
  late dynamic rules;
  late bool inline;
  late String labelPosition;
  late String? labelWidth;
  late String? labelSuffix;
  late bool hideRequiredAsterisk;
  late bool showMessage;
  late bool inlineMessage;
  late bool statusIcon;
  late bool validateOnRuleChange;
  late String? size;
  late bool disabled;

  WFormProp({
    required Map<String, dynamic> model,
    dynamic rules,
    bool? inline,
    String? labelPosition,
    String? labelWidth,
    String? labelSuffix,
    bool? hideRequiredAsterisk,
    bool? showMessage,
    bool? inlineMessage,
    bool? statusIcon,
    bool? validateOnRuleChange,
    String? size,
    bool? disabled,
  }) {
    this.model = fieldValueListener(model);
    this.rules = rules;
    this.inline = inline ?? false;
    this.labelPosition = labelPosition ?? 'right';
    this.labelWidth = labelWidth;
    this.labelSuffix = labelSuffix;
    this.hideRequiredAsterisk = hideRequiredAsterisk ?? false;
    this.showMessage = showMessage ?? true;
    this.inlineMessage = inlineMessage ?? false;
    this.statusIcon = statusIcon ?? false;
    this.validateOnRuleChange = validateOnRuleChange ?? true;
    this.size = size;
    this.disabled = disabled ?? false;
  }

  Map<String, ValueNotifier<dynamic>> fieldValueListener(
      Map<String, dynamic> model) {
    return Map<String, ValueNotifier<dynamic>>();
  }
}

class WFormSlot extends BaseSlot {
  WFormSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
