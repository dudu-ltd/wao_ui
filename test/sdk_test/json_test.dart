import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test Json decode', () {
    var text = 'CorvusYe';
    var a;
    try {
      a = JsonDecoder().convert(text);
    } catch (e) {
      a = text;
    }
    print(a.toString());
  });

  test(' text JsonEncode ', () {
    var a = 0;
    var b = JsonEncoder().convert(a);
    print(b);
    var c = b.startsWith('[');
    print(c);
  });

  test("test encode and decode String", () {
    var text = 'CorvusYe';
    var a = JsonEncoder().convert(text);
    print(a);
    var b = JsonDecoder().convert(a);
    print(b);
  });
}
