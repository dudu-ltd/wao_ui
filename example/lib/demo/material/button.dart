import 'package:example/demo/demos.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

registMaterialButton() {
  var textButton = Demo(
    'textButton',
    TextButton(
      child: const Text('按钮'),
      onPressed: () {},
    ),
    r'''
    TextButton(
      child: const Text('按钮'),
      onPressed: () {},
    ),
    ''',
    'TextButton',
  );

  var elevatedButton = Demo(
    'elevatedButton',
    ElevatedButton(
      // style: ElevatedButton.styleFrom(
      //   // Foreground color
      //   // onPrimary: Colors.red.shade100,
      //   // Background color
      //   primary: Colors.red.shade800,
      // ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      child: const Text('按钮'),
      onPressed: () {},
    ),
    r'''
    ElevatedButton(
      child: const Text('按钮'),
      onPressed: () {},
    ),
    ''',
    'ElevatedButton',
  );

  var outlinedButton = Demo(
    'outlinedButton',
    OutlinedButton(
      child: const Text('按钮'),
      onPressed: () {},
    ),
    r'''
    OutlinedButton(
      child: const Text('按钮'),
      onPressed: () {},
    ),
    ''',
    'OutlinedButton',
  );

  var iconButton = Demo(
    'iconButton',
    IconButton(
      icon: const Icon(
        Icons.edit,
        color: Colors.blue,
      ),
      onPressed: () {},
    ),
    r'''
    IconButton(
      icon: const Icon(
        Icons.edit,
        color: Colors.blue,
      ),
      onPressed: () {},
    ),
    ''',
    'IconButton',
  );

  var floatingActionButton = Demo(
    'floatingActionButton',
    FloatingActionButton(
      mini: true,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
        size: 18,
      ),
      onPressed: () {},
    ),
    r'''
    FloatingActionButton(
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
      onPressed: () {},
    ),
    ''',
    'FloatingActionButton',
  );
}
