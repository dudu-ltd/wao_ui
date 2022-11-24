// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class WPopupRoute<T> extends PopupRoute<T> {
  ///
  WPopupRoute({
    required this.transitionDuration,
    this.barrierLabel,
    required this.child,
  });

  late Widget child;

  @override
  final Duration transitionDuration;

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? barrierLabel;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Builder(
      builder: (BuildContext context) {
        return CustomSingleChildLayout(
          delegate: WPopupLayoutDelegate(),
          child: child,
        );
      },
    );
  }
}

class WPopupLayoutDelegate extends SingleChildLayoutDelegate {
  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) => true;
}
