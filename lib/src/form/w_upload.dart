import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WUpload extends StatelessWidget
    implements BaseWidget<WUploadOn, WUploadProp, WUploadSlot> {
  @override
  late WUploadOn $on;

  @override
  late WUploadProp $props;

  @override
  late WUploadSlot $slots;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WUploadOn extends BaseOn {}

class WUploadProp extends BaseProp {}

class WUploadSlot extends BaseSlot {}
