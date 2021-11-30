import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WImage extends StatelessWidget
    implements BaseWidget<WImageOn, WImageProp, WImageSlot> {
  @override
  late WImageOn $on;

  @override
  late WImageProp $props;

  @override
  late WImageSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WImageOn extends BaseOn {}

class WImageProp extends BaseProp {}

class WImageSlot extends BaseSlot {}
