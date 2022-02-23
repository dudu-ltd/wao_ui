import 'package:flutter/material.dart';

class BaseSlot {
  List<Widget>? defaultSlot;
  dynamic defaultSlotBefore;

  List<Type> allowSlotTypes = [];

  setDefaultSlotSub() {}

  BaseSlot(this.defaultSlotBefore);
}
