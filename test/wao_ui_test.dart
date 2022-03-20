import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wao_ui/core/base_style.dart';

import 'package:wao_ui/wao_ui.dart';

void main() {
  test('test border radius merge', () {
    var style = BaseStyle();
    List<BaseStyle> styles = <BaseStyle>[
      BaseStyle(borderRadius: BorderRadius.circular(15.0)),
      BaseStyle(),
      BaseStyle(borderRadius: BorderRadius.circular(4)),
      BaseStyle(
        borderBottomLeftRadius: Radius.zero,
        borderBottomRightRadius: Radius.zero,
      ),
    ];

    for (var s in styles) {
      style.merge(s, force: true);
    }
    print(style.borderRadius);
    assert(identical(style.borderRadius, BorderRadius.circular(4)));
  });
}
