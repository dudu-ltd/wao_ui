import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_style.dart';

abstract class BaseWidget<O extends BaseOn, P extends BaseProp,
    S extends BaseSlot, T extends BaseStyle> extends Widget {
  final O $on;
  final P $props;
  final S $slots;
  final T $style;

  const BaseWidget({
    Key? key,
    required this.$props,
    required this.$slots,
    required this.$style,
    required this.$on,
  }) : super(key: key);
}
