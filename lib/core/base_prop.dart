// ignore_for_file: avoid_init_to_null

import 'package:flutter/material.dart';

class BaseProp {}

// 通过 value 属性驱动的 W组件属性类。
mixin ValueDriveProp<T> on BaseProp {
  ValueNotifier<T?>? $value = null;

  T? get value => $value?.value;

  set value(T? t) {
    if ($value == null) {
      $value = ValueNotifier(t);
    } else {
      $value!.value = t;
    }
  }

  $addValueListener(Function() fn) {
    $value ??= ValueNotifier(null);
    $value?.addListener(fn);
  }

  $removeValueListener(Function() fn) {
    $value?.removeListener(fn);
  }

  $valueNotifyListeners() {
    $value?.notifyListeners();
  }
}
