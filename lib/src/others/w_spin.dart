// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';

class WSpin extends StatefulWidget {
  Widget child;
  late Duration duration;
  WSpin({Key? key, required this.child, Duration? duration}) : super(key: key) {
    this.duration = duration ?? CfgGlobal.duration;
  }

  @override
  State<WSpin> createState() => _WSpinState();
}

class _WSpinState extends State<WSpin> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    neverStop();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void neverStop() {
    _controller.forward(from: 0).whenComplete(neverStop);
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }
}
