// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:typed_data';

class ByteFile {
  late Uint8List bytes;
  late String name;
  ByteFile({
    required this.bytes,
    required this.name,
  });
}
