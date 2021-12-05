import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WRadio extends StatelessWidget
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
    $slots = slots ?? WRadioSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WRadioOn extends BaseOn {
  Function? change;
}

class WRadioProp extends BaseProp {
  late dynamic value;
  late dynamic label;
  late bool disabled;
  late bool border;
  late String size;
  late String name;
  WRadioProp({
    dynamic value,
    dynamic label,
    bool? disabled,
    bool? border,
    String? size,
    String? name,
  }) {
    this.value = this.value;
    this.label = this.label;
    this.disabled = this.disabled;
    this.border = this.border;
    this.size = this.size;
    this.name = this.name;
  }
}

class WRadioSlot extends BaseSlot {}
