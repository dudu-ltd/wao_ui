import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_observable/simple_observable.dart';

class BaseSlot {
  List<Widget>? defaultSlot;
  dynamic _defaultSlotBefore;

  dynamic get defaultSlotBefore {
    return _defaultSlotBefore;
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
    }
  }

  BaseSlot();
}
