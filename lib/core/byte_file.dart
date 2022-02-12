import 'dart:typed_data';

import 'package:dio/dio.dart';

class ByteFile {
  late Uint8List bytes;
  late String name;
  ByteFile({
    required this.bytes,
    required this.name,
  });
}
