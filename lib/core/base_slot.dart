import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_observable/simple_observable.dart';

class BaseSlot {
  List<Widget>? defaultSlot;
  dynamic _defaultSlotBefore;

  dynamic get defaultSlotBefore {
    return _defaultSlotBefore;
  }

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

  set defaultSlotBefore(defaultSlotBefore) {
    _defaultSlotBefore = defaultSlotBefore;
    setDefaultSlot();
  }

  setDefaultSlot() {
    if (_defaultSlotBefore is Widget) {
      defaultSlot = [_defaultSlotBefore];
    } else if (_defaultSlotBefore is List<Widget>) {
      defaultSlot = _defaultSlotBefore;
    } else {
      setDefaultSlotSub();
    }
  }

  setDefaultSlotSub() {}

  BaseSlot(defaultSlotBefore) {
    this.defaultSlotBefore = defaultSlotBefore;
  }
}
