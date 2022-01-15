import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WCheckbox extends StatefulWidget
    implements BaseWidget<WCheckboxOn, WCheckboxProp, WCheckboxSlot> {
  @override
  late final WCheckboxOn $on;

  @override
  late final WCheckboxProp $props;

  @override
  late final WCheckboxSlot $slots;

  WCheckbox({
    Key? key,
    WCheckboxOn? on,
    WCheckboxProp? props,
    WCheckboxSlot? slots,
  }) : super(key: key) {
    $on = on ?? WCheckboxOn();
    $props = props ?? WCheckboxProp();
    $slots = slots ?? WCheckboxSlot(null);
  }

  @override
  _WCheckboxState createState() => _WCheckboxState();
}

class _WCheckboxState extends State<WCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCheckboxOn extends BaseOn {
  Function? change;
}

class WCheckboxProp extends BaseProp {
  late ValueNotifier<dynamic> value;
  late dynamic label;
  late dynamic trueLabel;
  late dynamic falseLabel;
  late bool disabled;
  late bool border;
  late String size;
  late String name;
  late bool checked;
  late bool indeterminate;

  WCheckboxProp({
    ValueNotifier? value,
    dynamic label,
    dynamic trueLabel,
    dynamic falseLabel,
    bool? disabled,
    bool? border,
    String? size,
    String? name,
    bool? checked,
    bool? indeterminate,
  }) {
    this.value = value ?? ValueNotifier([]);
    // 选中状态的值（只有在checkbox-group或者绑定对象类型为array时有效）
    this.label = label;
    this.disabled = disabled ?? false;
    this.border = border ?? false;
    this.size = size ?? 'medium';
    this.name = name ?? '';
    // 选中时的值
    this.trueLabel = trueLabel;
    // 没有选中时的值
    this.falseLabel = falseLabel;
    this.checked = checked ?? false;
    this.indeterminate = indeterminate ?? false;
  }
}

class WCheckboxSlot extends BaseSlot {
  WCheckboxSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WCheckboxGroup extends StatelessWidget
    implements
        BaseWidget<WCheckboxGroupOn, WCheckboxGroupProp, WCheckboxGroupSlot> {
  @override
  late final WCheckboxGroupOn $on;

  @override
  late final WCheckboxGroupProp $props;

  @override
  late final WCheckboxGroupSlot $slots;

  WCheckboxGroup({
    Key? key,
    WCheckboxGroupOn? on,
    WCheckboxGroupProp? props,
    WCheckboxGroupSlot? slots,
  }) : super(key: key) {
    $on = on ?? WCheckboxGroupOn();
    $props = props ?? WCheckboxGroupProp();
    $slots = slots ?? WCheckboxGroupSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCheckboxGroupOn extends BaseOn {}

class WCheckboxGroupProp extends BaseProp {}

class WCheckboxGroupSlot extends BaseSlot {
  WCheckboxGroupSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WCheckboxButton extends StatelessWidget
    implements
        BaseWidget<WCheckboxButtonOn, WCheckboxButtonProp,
            WCheckboxButtonSlot> {
  @override
  late final WCheckboxButtonOn $on;

  @override
  late final WCheckboxButtonProp $props;

  @override
  late final WCheckboxButtonSlot $slots;

  WCheckboxButton({
    Key? key,
    WCheckboxButtonOn? on,
    WCheckboxButtonProp? props,
    WCheckboxButtonSlot? slots,
  }) : super(key: key) {
    $on = on ?? WCheckboxButtonOn();
    $props = props ?? WCheckboxButtonProp();
    $slots = slots ?? WCheckboxButtonSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WCheckboxButtonOn extends BaseOn {}

class WCheckboxButtonProp extends BaseProp {}

class WCheckboxButtonSlot extends BaseSlot {
  WCheckboxButtonSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
