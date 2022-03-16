import 'package:flutter/material.dart';

Map<String, Demo> demos = {};

class Demo {
  String name;
  Widget widget;
  String code;
  Demo(this.name, this.widget, this.code) {
    demos[name] = this;
  }
}
