// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:flutter/foundation.dart';

var isPc =
    !kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS);
