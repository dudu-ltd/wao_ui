import 'dart:io';

import 'package:flutter/foundation.dart';

var isPc =
    !kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS);
