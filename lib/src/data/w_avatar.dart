import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WAvatar extends StatelessWidget
    implements BaseWidget<WAvatarOn, WAvatarProp, WAvatarSlot> {
  @override
  late WAvatarOn $on;

  @override
  late WAvatarProp $props;

  @override
  late WAvatarSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WAvatarOn extends BaseOn {}

class WAvatarProp extends BaseProp {}

class WAvatarSlot extends BaseSlot {}
