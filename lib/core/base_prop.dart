// ignore_for_file: avoid_init_to_null

import 'package:flutter/material.dart';

class BaseProp {}

// 通过 value 属性驱动的 W组件属性类。
mixin ModelDriveProp<T> on BaseProp {
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
