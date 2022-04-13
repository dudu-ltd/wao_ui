import 'dart:collection';

import 'package:flutter/material.dart';

void addSlot(dynamic slot, List<Widget> list) {
  if (slot == null) return;
  if (slot is Widget) {
    list.add(slot);
  } else if (slot is List<Widget>) {
    list.addAll(slot);
  } else if (slot is IconData) {
    list.add(Icon(slot));
  } else if (slot is String) {
    list.add(Text(slot));
  } else {
    throw Exception('除了 Widget、List<Widget>、IconData、String 以外的类型不支持!');
  }
}

// TODO 完善深度比较方法
bool contains(List<dynamic> list, dynamic item) {
  for (var element in list) {
    if (item.toString() == element.toString()) return true;
  }
  return false;
}

List<T> findByListKey<T>(Map<List<List>, T> map, List key) {
  var selectors = map.keys; // [[['.s', '.t'], ['.y', '.l', '.e']]]
  var result = <T>[];
  for (var entry in map.entries) {
    for (var selector in entry.key) {
      // [['.s', '.t'], ['.y', '.l', '.e']]
      if (key.toSet().containsAll(selector) && entry.value != null) {
        // print('${key.toSet()} containsAll $selector');
        result.add(entry.value!);
      }
    }
  }
  return result;
}
