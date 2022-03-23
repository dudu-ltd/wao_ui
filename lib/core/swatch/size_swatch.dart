import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

mixin Swatch<K, V> {
  late final Map<K, V> _swatch;

  /// Returns an element of the swatch table.
  V? operator [](K index) => _swatch[index];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return super == other &&
        other is Swatch<K, V> &&
        mapEquals<K, V>(other._swatch, _swatch);
  }

  @override
  String toString() =>
      '${objectRuntimeType(this, 'Swatch')}(primary value: ${super.toString()})';
}

mixin SizeSwatch<V> implements Swatch<String, V> {
  final List<String> _supportKeys = [
    'zero',
    'mini',
    'small',
    'medium',
    'large'
  ];
  V get zero => this[_supportKeys[0]]!;
  V get mini => this[_supportKeys[1]]!;
  V get small => this[_supportKeys[2]]!;
  V get medium => this[_supportKeys[3]]!;
  V get large => this[_supportKeys[4]]!;

  valid() {
    assert(_swatch.keys.toSet().containsAll(_supportKeys),
        'Keys suport $_supportKeys only');
  }
}

class WEdgeInsets extends EdgeInsets
    with SizeSwatch<EdgeInsets>, Swatch<String, EdgeInsets> {
  WEdgeInsets(
    EdgeInsets value,
    Map<String, EdgeInsets> swatch,
  ) : super.fromLTRB(
          value.left,
          value.top,
          value.right,
          value.bottom,
        ) {
    _swatch = swatch;
    valid();
  }
}

class WBorderRadius extends BorderRadius
    with SizeSwatch<BorderRadius>, Swatch<String, BorderRadius> {
  WBorderRadius(
    BorderRadius radius,
    Map<String, BorderRadius> swatch,
  ) : super.only(
          topLeft: radius.topLeft,
          topRight: radius.topRight,
          bottomLeft: radius.bottomLeft,
          bottomRight: radius.bottomRight,
        ) {
    _swatch = swatch;
    valid();
  }
}

class WFontSize with SizeSwatch<double>, Swatch<String, double> {
  WFontSize(double fontSize, Map<String, double> swatch) {
    _swatch = swatch;
    valid();
  }
}
