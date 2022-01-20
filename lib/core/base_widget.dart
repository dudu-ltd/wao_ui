import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_style.dart';

// ignore: must_be_immutable
abstract class BaseWidget<O extends BaseOn, P extends BaseProp,
    S extends BaseSlot, T extends BaseStyle> extends Widget {
  late O $on;
  late P $props;
  late S $slots;
  late T $style;

  BaseWidget({Key? key}) : super(key: key);
}
