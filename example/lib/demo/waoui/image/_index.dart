import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

import '../../demos.dart';

var wthImg = 'assets:assets/image/wth.jpg';
regist() {
  var imageFits = Demo(
    'imageFits',
    Wrap(
      runSpacing: 8,
      spacing: 8,
      children: List.generate(
        BoxFit.values.length,
        (index) {
          return Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(BoxFit.values[index].toString()),
                WImage()
                  ..$style.width = 100
                  ..$style.height = 100
                  ..$props.src = wthImg
                  ..$props.fit = BoxFit.values[index],
              ],
            ),
          );
        },
      ),
    ),
    r'''
    WImage()
      ..$style.width = 100
      ..$style.height = 100
      ..$props.src = 'assets:assets/image/wth.jpg'
      ..$props.fit = BoxFit.cover,
    ''',
  );
}
