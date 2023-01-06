import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

import '../../demos.dart';

regist() {
  var carouselBasicHover = Demo(
    'carouselBasicHover',
    WCarousel()
      ..$props.trigger = 'hover'
      ..$style.height = 250
      ..$slots.$ = List.generate(
        4,
        (index) => WCarouselItem()
          ..$slots.$ = ColoredBox(
            color: const Color(0xFF99a9bf).withAlpha(
              50 * index + 50,
            ),
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ),
    r'''
    WCarousel()
      ..$props.trigger = 'hover'
      ..$style.height = 250
      ..$slots.$ = List.generate(
        4,
        (index) => WCarouselItem()
          ..$slots.$ = ColoredBox(
            color: const Color(0xFF99a9bf).withAlpha(
              50 * index + 50,
            ),
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      )''',
  );

  var carouselBasicClick = Demo(
    'carouselBasicClick',
    WCarousel()
      ..$props.trigger = 'click'
      ..$style.height = 250
      ..$slots.$ = List.generate(
        4,
        (index) => WCarouselItem()
          ..$slots.$ = ColoredBox(
            color: const Color(0xFF99a9bf).withAlpha(
              50 * index + 50,
            ),
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ),
    r'''
    WCarousel()
      ..$props.trigger = 'click'
      ..$style.height = 250
      ..$slots.$ = List.generate(
        4,
        (index) => WCarouselItem()
          ..$slots.$ = ColoredBox(
            color: const Color(0xFF99a9bf).withAlpha(
              50 * index + 50,
            ),
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      )''',
  );

  var carouselGuide = Demo(
    'carouselGuide',
    WCarousel()
      ..$style.height = 250
      ..$props.indicatorPosition = 'outside'
      ..$slots.$ = List.generate(
        4,
        (index) => WCarouselItem()
          ..$slots.$ = ColoredBox(
            color: const Color(0xFF99a9bf).withAlpha(
              50 * index + 50,
            ),
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ),
    r'''
    WCarousel()
      ..$style.height = 250
      ..$props.indicatorPosition = 'outside'
      ..$slots.$ = List.generate(
        4,
        (index) => WCarouselItem()
          ..$slots.$ = ColoredBox(
            color: Color(0xFF99a9bf).withAlpha(
              50 * index + 50,
            ),
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      )''',
  );

  var picList = [
    'https://t7.baidu.com/it/u=1819248061,230866778&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=963301259,1982396977&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=1575628574,1150213623&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=737555197,308540855&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=91673060,7145840&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=2291349828,4144427007&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=1297102096,3476971300&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=852388090,130270862&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=4283365501,347124022&fm=193&f=GIF',
  ];
  var carouselImg = Demo(
    'carouselImg',
    WCarousel()
      ..$style.height = 600
      ..$props.type = 'card'
      ..$props.interval = 4000
      ..$props.trigger = 'hover'
      ..$slots.$ = List.generate(
        picList.length,
        (index) => WImage()
          ..$props.src = picList[index]
          ..$props.fit = BoxFit.fitWidth,
      ),
    r'''
    var picList = [
      'https://t7.baidu.com/it/u=1819248061,230866778&fm=193&f=GIF',
      'https://t7.baidu.com/it/u=963301259,1982396977&fm=193&f=GIF',
      'https://t7.baidu.com/it/u=1575628574,1150213623&fm=193&f=GIF',
      'https://t7.baidu.com/it/u=737555197,308540855&fm=193&f=GIF',
      'https://t7.baidu.com/it/u=91673060,7145840&fm=193&f=GIF',
      'https://t7.baidu.com/it/u=2291349828,4144427007&fm=193&f=GIF',
      'https://t7.baidu.com/it/u=1297102096,3476971300&fm=193&f=GIF',
      'https://t7.baidu.com/it/u=852388090,130270862&fm=193&f=GIF',
      'https://t7.baidu.com/it/u=4283365501,347124022&fm=193&f=GIF',
    ];

    WCarousel()
      ..$style.height = 600
      ..$props.type = 'card'
      ..$props.interval = 4000
      ..$props.trigger = 'hover'
      ..$slots.$ = List.generate(
        picList.length,
        (index) => WImage()
          ..$props.src = picList[index]
          ..$props.fit = BoxFit.fitWidth,
      )
    ''',
  );

  var carouselArrow = Demo(
    'carouselArrow',
    WCarousel()
      ..$style.height = 250
      ..$props.arrow = 'always'
      ..$props.interval = 5000
      ..$slots.$ = List.generate(
        4,
        (index) => WCarouselItem()
          ..$slots.$ = ColoredBox(
            color: const Color(0xFF99a9bf).withAlpha(
              50 * index + 50,
            ),
          ),
      ),
    r'''
  
    ''',
  );

  var carouselCard = Demo(
    'carouselCard',
    WCarousel()
      ..$style.height = 300
      ..$props.type = 'card'
      ..$props.interval = 4000
      ..$slots.$ = List.generate(
        6,
        (i) {
          i = i + 1;
          return ColoredBox(
            color: Color.fromARGB(
              255,
              0x99 * i,
              0xa9 * i,
              0xbf * i,
            ),
            child: Center(
              child: Text(
                '$i',
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    r'''
    WCarousel()
      ..$style.height = 500
      ..$props.type = 'card'
      ..$props.interval = 4000
      ..$slots.$ = List.generate(
        6,
        (i) {
          i = i + 1;
          return ColoredBox(
            color: Color.fromARGB(
              255,
              0x99 * i,
              0xa9 * i,
              0xbf * i,
            ),
            child: Center(
              child: Text(
                '$i',
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      )''',
  );

  var carouselDirection = Demo(
    'carouselDirection',
    WCarousel()
      ..$style.height = 250
      ..$props.direction = Axis.vertical
      ..$props.autoplay = false
      ..$slots.$ = List.generate(
        3,
        (index) {
          return ColoredBox(
            color: const Color(0xFF99a9bf).withAlpha(
              50 * index + 50,
            ),
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    r'''
    WCarousel()
      ..$style.height = 250
      ..$props.direction = Axis.vertical
      ..$props.autoplay = false
      ..$slots.$ = List.generate(
        3,
        (index) {
          return ColoredBox(
            color: Color(0xFF99a9bf).withAlpha(
              50 * index + 50,
            ),
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      )
    ''',
  );
}
