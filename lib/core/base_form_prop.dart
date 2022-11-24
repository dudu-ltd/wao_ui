// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';

import 'base_prop.dart';

abstract class FormFieldProp extends BaseProp {
  late ValueNotifier valueNotifier;

  FormFieldProp({ValueNotifier? valueNotifier, dynamic value}) {
    this.valueNotifier = valueNotifier ?? ValueNotifier(value);
  }

  set value(value) {
    valueNotifier.value = value;
  }

  get value {
    return valueNotifier.value;
  }
}
