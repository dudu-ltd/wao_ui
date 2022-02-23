import 'package:flutter/material.dart';

class BaseSlot {
  List<Widget>? defaultSlot;
  dynamic defaultSlotBefore;

  bool get hasDefault {
    return defaultSlot != null;
  }

  bool get defalutEmpty {
    return !hasDefault || defaultSlot!.isEmpty;
  }

  Widget get first {
    return defaultSlot == null ? Container() : defaultSlot![0];
  }

  Widget get col {
    if (hasDefault) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: defaultSlot!,
      );
    }
    return Column();
  }

  Widget get row {
    if (hasDefault) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: defaultSlot!,
      );
    }
    return Row();
  }

  List<Type> allowSlotTypes = [];

  setDefaultSlotSub() {}

  BaseSlot(this.defaultSlotBefore);
}
