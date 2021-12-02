import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WAvatar extends StatelessWidget
    implements BaseWidget<WAvatarOn, WAvatarProp, WAvatarSlot> {
  @override
  late final WAvatarOn $on;

  @override
  late final WAvatarProp $props;

  @override
  late final WAvatarSlot $slots;

  WAvatar({
    Key? key,
    WAvatarOn? on,
    WAvatarProp? props,
    WAvatarSlot? slots,
  }) : super(key: key) {
    $on = on ?? WAvatarOn();
    $props = props ?? WAvatarProp();
    $slots = slots ?? WAvatarSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WAvatarOn extends BaseOn {}

class WAvatarProp extends BaseProp {}

class WAvatarSlot extends BaseSlot {}
