import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WUpload extends StatelessWidget
    implements BaseWidget<WUploadOn, WUploadProp, WUploadSlot> {
  @override
  late final WUploadOn $on;

  @override
  late final WUploadProp $props;

  @override
  late final WUploadSlot $slots;

  WUpload({
    Key? key,
    WUploadOn? on,
    WUploadProp? props,
    WUploadSlot? slots,
  }) : super(key: key) {
    $on = on ?? WUploadOn();
    $props = props ?? WUploadProp();
    $slots = slots ?? WUploadSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WUploadOn extends BaseOn {}

class WUploadProp extends BaseProp {}

class WUploadSlot extends BaseSlot {}
