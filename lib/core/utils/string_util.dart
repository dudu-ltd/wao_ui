// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class StringUtil {
  static double stringToSize(String str, BuildContext context) {
    var unit2 = str.substring(0, str.length - 2);
    var unit2Num = double.parse(unit2);
    var unit1 = str.substring(0, str.length - 1);
    if (str.endsWith('px')) {
      return double.parse(unit2);
    } else if (str.endsWith('vh')) {
      var sceenHeight = MediaQuery.of(context).size.height;
      return sceenHeight * unit2Num / 100;
    } else if (str.endsWith('vw')) {
      var sceenWidth = MediaQuery.of(context).size.width;
      return sceenWidth * unit2Num / 100;
    } else if (str.endsWith('%')) {
      var unit1Num = double.parse(unit1);
      var sceenWidth = MediaQuery.of(context).size.width;
      return sceenWidth * unit1Num / 100;
    } else {
      return 0.0;
    }
  }
}
