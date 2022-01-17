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
