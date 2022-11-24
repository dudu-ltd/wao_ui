// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class ColorUtil {
  static Color hexToColor(String colorHex) {
    return Color(int.parse(colorHex.replaceAll('#', '0xFF')));
  }
}
