// ignore_for_file: avoid_init_to_null

import 'package:flutter/material.dart';

class BaseProp {}

class FormFieldProp extends BaseProp
    with HasFirstAndLastProp, HasSizeProp, HasDisabledProp, ModelDriveProp {
  FormFieldProp([ValueNotifier? $model, dynamic model]) {
    this.$model = $model ?? this.$model;
    this.model = model ?? model;
  }
}

mixin HasFirstAndLastProp {
  bool isFirst = false;
  bool isLast = false;
}

mixin HasSizeProp {
  late String size;
}

mixin HasDisabledProp {
  bool disabled = false;
}

mixin VisibleProp {
  ValueNotifier<bool>? _visible;
  ValueNotifier get $visible {
    return _visible = _visible ?? ValueNotifier(false);
  }

  set visible(bool visible) {
    $visible.value = visible;
  }

  bool get visible {
    return $visible.value;
  }

  $addVisibleListener(Function() fn) {
    $visible.addListener(fn);
  }

  $removeVisibleListener(Function() fn) {
    $visible.removeListener(fn);
  }
}

// 通过 value 属性驱动的 W组件属性类。
mixin ModelDriveProp<T> {
  ValueNotifier<T?>? $model = null;

  T? get model => $model?.value;

  set model(T? t) {
    if ($model == null) {
      $model = ValueNotifier(t);
    } else {
      $model!.value = t;
    }
  }

  $addModelListener(Function() fn) {
    $model ??= ValueNotifier(null);
    $model?.addListener(fn);
  }

  $removeModelListener(Function() fn) {
    $model?.removeListener(fn);
  }

  $modelNotifyListeners() {
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    $model?.notifyListeners();
  }
}
