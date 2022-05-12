import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

import '../../demos.dart';

regist() {
  avatarCircleHtw;
  avatarSquareHtw;
  avatarCircleWth;
  avatarSquareWth;
  avatarIcon1;
  avatarIcon1c;
  avatarIcon2;
  avatarIcon2q;
}

var avatarIcon1 = Demo(
  'avatarIcon1',
  Row(children: [
    WAvatar(),
    WAvatar()..$props.size = 'medium',
    WAvatar()..$props.size = 'small',
  ]),
  r'''
  // 默认图标，以下是默认值
  // style.size：large
  // style.padding：0
  // style.background：WStyle.basicColor.shade50, 
                           //  Colors.transparent
  // style.color: WStyle.primary
  // icon: Icons.person

  Row(children: [
    WAvatar(),
    WAvatar()..$props.size = 'medium',
    WAvatar()..$props.size = 'small',
  ])
  ''',
);
var avatarIcon1c = Demo(
  'avatarIcon1c',
  Row(children: [
    WAvatar()
      ..$props.icon = const Icon(Icons.person_add)
      ..$props.size = 'medium'
      ..$style.margin = const EdgeInsets.symmetric(
        horizontal: 45,
      ),
    WAvatar()
      ..$props.icon = const Icon(Icons.face)
      ..$props.size = 'medium'
      ..$style.margin = const EdgeInsets.symmetric(
        horizontal: 45,
      ),
    WAvatar()
      ..$props.icon = const Icon(Icons.star)
      ..$props.size = 'medium'
      ..$style.margin = const EdgeInsets.symmetric(
        horizontal: 45,
      ),
  ]),
  r'''
  Row(children: [
    WAvatar()
      ..$props.icon = const Icon(Icons.person_add)
      ..$props.size = 'large'
      ..$style.padding = const EdgeInsets.symmetric(
        horizontal: 45,
      ),
    WAvatar()
      ..$props.icon = const Icon(Icons.person_add)
      ..$props.size = 'medium'
      ..$style.padding = const EdgeInsets.symmetric(
        horizontal: 45,
      ),
    WAvatar()
      ..$props.icon = const Icon(Icons.person_add)
      ..$props.size = 'small'
      ..$style.padding = const EdgeInsets.symmetric(
        horizontal: 45,
      ),
  ])
  ''',
);

var avatarIcon2 = Demo(
  'avatarIcon2',
  Row(children: [
    WAvatar()
      ..$props.size = 'large'
      ..$style.margin = const EdgeInsets.symmetric(
        horizontal: 40,
      )
      ..$style.color = Colors.white
      ..$style.backgroundColor = Colors.blue,
    WAvatar()
      ..$props.size = 'large'
      ..$style.margin = const EdgeInsets.symmetric(
        horizontal: 40,
      )
      ..$style.color = Colors.white
      ..$style.backgroundColor = CfgGlobal.successColor,
    WAvatar()
      ..$props.size = 'large'
      ..$style.margin = const EdgeInsets.symmetric(
        horizontal: 40,
      )
      ..$style.color = Colors.white
      ..$style.backgroundColor = Colors.purple,
  ]),
  r'''
  Row(children: [
    WAvatar()
      ..$props.size = 'large'
      ..$style.padding = const EdgeInsets.symmetric(
        horizontal: 40,
      )
      ..$style.color = Colors.white
      ..$style.backgroundColor = Colors.blue,
    WAvatar()
      ..$props.size = 'large'
      ..$style.padding = const EdgeInsets.symmetric(
        horizontal: 40,
      )
      ..$style.color = Colors.white
      ..$style.backgroundColor = CfgGlobal.successColor,
    WAvatar()
      ..$props.size = 'large'
      ..$style.padding = const EdgeInsets.symmetric(
        horizontal: 40,
      )
      ..$style.color = Colors.white
      ..$style.backgroundColor = Colors.purple,
  ])
  ''',
);
var avatarIcon2q = Demo(
  'avatarIcon2q',
  Row(children: [
    WAvatar()
      ..$props.size = 'large'
      ..$props.shape = 'square'
      ..$style.margin = const EdgeInsets.symmetric(
        horizontal: 40,
      )
      ..$style.color = Colors.white
      ..$style.backgroundColor = Colors.blue,
    WAvatar()
      ..$props.size = 'large'
      ..$props.shape = 'square'
      ..$style.margin = const EdgeInsets.symmetric(
        horizontal: 40,
      )
      ..$style.color = Colors.white
      ..$style.backgroundColor = CfgGlobal.successColor,
    WAvatar()
      ..$props.size = 'large'
      ..$props.shape = 'square'
      ..$style.margin = const EdgeInsets.symmetric(
        horizontal: 40,
      )
      ..$style.color = Colors.white
      ..$style.backgroundColor = Colors.purple,
  ]),
  r'''
  Row(children: [
    WAvatar()
      ..$props.size = 'large'
      ..$props.shape = 'square'
      ..$style.padding = const EdgeInsets.symmetric(
        horizontal: 40,
      )
      ..$style.color = Colors.white
      ..$style.backgroundColor = Colors.blue,
    WAvatar()
      ..$props.size = 'large'
      ..$props.shape = 'square'
      ..$style.padding = const EdgeInsets.symmetric(
        horizontal: 40,
      )
      ..$style.color = Colors.white
      ..$style.backgroundColor = CfgGlobal.successColor,
    WAvatar()
      ..$props.size = 'large'
      ..$props.shape = 'square'
      ..$style.padding = const EdgeInsets.symmetric(
        horizontal: 40,
      )
      ..$style.color = Colors.white
      ..$style.backgroundColor = Colors.purple,
  ])
  ''',
);

var htwImg = 'assets:assets/image/htw.jpg';

var avatarCircleHtw = Demo(
  'avatarCircleHtw',
  Wrap(spacing: 24, runSpacing: 16, children: [
    Padding(
      padding: const EdgeInsets.only(left: 14),
      child: SizedBox(
        height: 80,
        child: WImage()..$props.src = htwImg,
      ),
    ),
    const ColoredBox(
        color: Colors.black12,
        child: SizedBox(
          height: 80,
          width: 2,
        )),
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = htwImg
      ..$props.fit = 'fill',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = htwImg
      ..$props.fit = 'contain',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = htwImg
      ..$props.fit = 'cover',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = htwImg
      ..$props.fit = 'none',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = htwImg
      ..$props.fit = 'scaleDown',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = htwImg
      ..$props.fit = 'fitWidth',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = htwImg
      ..$props.fit = 'fitWidth',
  ]),
  r'''
  Wrap(spacing: 24, runSpacing: 16, children: [
    Padding(
      padding: const EdgeInsets.only(left: 14),
      child: SizedBox(
        height: 80,
        child: WImage()..$props.src = htwImg,
      ),
    ),
    const ColoredBox(
        color: Colors.black12,
        child: SizedBox(
          height: 80,
          width: 2,
        )),
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = htwImg
      ..$props.fit = 'fill',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = htwImg
      ..$props.fit = 'contain',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = htwImg
      ..$props.fit = 'cover',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = htwImg
      ..$props.fit = 'none',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = htwImg
      ..$props.fit = 'scaleDown',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = htwImg
      ..$props.fit = 'fitWidth',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = htwImg
      ..$props.fit = 'fitWidth',
  ]),
  ''',
);

var avatarSquareHtw = Demo(
  'avatarSquareHtw',
  Wrap(
    spacing: 56,
    runSpacing: 16,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 42),
        child: SizedBox(height: 80, child: WImage()..$props.src = htwImg),
      ),
      const ColoredBox(
          color: Colors.black12,
          child: SizedBox(
            height: 80,
            width: 2,
          )),
      WAvatar(
          props: WAvatarProp(
        size: '80',
        shape: 'square',
        src: htwImg,
        fit: 'fill',
      )),
      WAvatar(
          props: WAvatarProp(
        size: '80',
        shape: 'square',
        src: htwImg,
        fit: 'contain',
      )),
      WAvatar(
          props: WAvatarProp(
        size: '80',
        shape: 'square',
        src: htwImg,
        fit: 'cover',
      )),
      WAvatar(
          props: WAvatarProp(
        size: '80',
        shape: 'square',
        src: htwImg,
        fit: 'none',
      )),
      WAvatar(
          props: WAvatarProp(
        size: '80',
        shape: 'square',
        src: htwImg,
        fit: 'scaleDown',
      )),
    ],
  ),
  r'''
  Wrap(
    spacing: 56,
    runSpacing: 16,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 42),
        child: SizedBox(height: 80, child: WImage()..$props.src = htwImg),
      ),
      const ColoredBox(
          color: Colors.black12, child: SizedBox(height: 80, width: 2,)),
      WAvatar(
          props: WAvatarProp(
              size: '80', shape: 'square', src: htwImg, fit: 'fill',)),
      WAvatar(
          props: WAvatarProp(
              size: '80', shape: 'square', src: htwImg, fit: 'contain',)),
      WAvatar(
          props: WAvatarProp(
              size: '80', shape: 'square', src: htwImg, fit: 'cover',)),
      WAvatar(
          props: WAvatarProp(
              size: '80', shape: 'square', src: htwImg, fit: 'none',)),
      WAvatar(
          props: WAvatarProp(
              size: '80', shape: 'square', src: htwImg, fit: 'scaleDown',)),
    ],
  )
  ''',
);

var wthImg = 'assets:assets/image/wth.jpg';
var avatarSquareWth = Demo(
  'avatarSquareWth',
  Wrap(
    spacing: 44,
    runSpacing: 16,
    children: [
      SizedBox(height: 80, child: WImage()..$props.src = wthImg),
      const ColoredBox(
          color: Colors.black12,
          child: SizedBox(
            height: 80,
            width: 2,
          )),
      WAvatar(
          props: WAvatarProp(
        size: '80',
        shape: 'square',
        src: wthImg,
        fit: 'fill',
      )),
      WAvatar(
          props: WAvatarProp(
        size: '80',
        shape: 'square',
        src: wthImg,
        fit: 'contain',
      )),
      WAvatar(
          props: WAvatarProp(
        size: '80',
        shape: 'square',
        src: wthImg,
        fit: 'cover',
      )),
      WAvatar(
          props: WAvatarProp(
        size: '80',
        shape: 'square',
        src: wthImg,
        fit: 'none',
      )),
      WAvatar(
          props: WAvatarProp(
        size: '80',
        shape: 'square',
        src: wthImg,
        fit: 'scaleDown',
      )),
    ],
  ),
  r'''
    var  imgSrc =
        'https://img2.baidu.com/it/u=1759827931,3703597115&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=264';
  Wrap(
    spacing: 44,
    runSpacing: 16,
    children: [
      SizedBox(height: 80, child: WImage()..$props.src = wthImg),
      const ColoredBox(
          color: Colors.black12, child: SizedBox(height: 80, width: 2,)),
      WAvatar(
          props: WAvatarProp(
              size: '80', shape: 'square', src: wthImg, fit: 'fill',)),
      WAvatar(
          props: WAvatarProp(
              size: '80', shape: 'square', src: wthImg, fit: 'contain',)),
      WAvatar(
          props: WAvatarProp(
              size: '80', shape: 'square', src: wthImg, fit: 'cover',)),
      WAvatar(
          props: WAvatarProp(
              size: '80', shape: 'square', src: wthImg, fit: 'none',)),
      WAvatar(
          props: WAvatarProp(
              size: '80', shape: 'square', src: wthImg, fit: 'scaleDown',)),
    ]
  ''',
);

var avatarCircleWth = Demo(
  'avatarCircleWth',
  Wrap(spacing: 12, runSpacing: 16, children: [
    SizedBox(height: 80, child: WImage()..$props.src = wthImg),
    const ColoredBox(
        color: Colors.black12,
        child: SizedBox(
          height: 80,
          width: 2,
        )),
    WAvatar(props: WAvatarProp())
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = wthImg
      ..$props.fit = 'fill',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = wthImg
      ..$props.fit = 'contain',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = wthImg
      ..$props.fit = 'cover',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = wthImg
      ..$props.fit = 'none',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = wthImg
      ..$props.fit = 'scaleDown',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = wthImg
      ..$props.fit = 'fitWidth',
    WAvatar()
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = wthImg
      ..$props.fit = 'fitHeight',
  ]),
  r'''
  var  imgSrc =
      'https://img2.baidu.com/it/u=1759827931,3703597115&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=264';
  Wrap(spacing: 12, runSpacing: 16, children: [
    SizedBox(height: 80, child: WImage()..$props.src = wthImg),
    const ColoredBox(
        color: Colors.black12, child: SizedBox(height: 80, width: 2,)),
    WAvatar(props: WAvatarProp())
      ..$props.size = '80'
      ..$props.shape = 'circle'
      ..$props.src = wthImg
      ..$props.fit = 'fill',
    WAvatar(
        props: WAvatarProp(
            size: '80', shape: 'circle', src: wthImg, fit: 'contain',)),
    WAvatar(
        props: WAvatarProp(
            size: '80', shape: 'circle', src: wthImg, fit: 'cover',)),
    WAvatar(
        props:
            WAvatarProp(size: '80', shape: 'circle', src: wthImg, fit: 'none',)),
    WAvatar(
        props: WAvatarProp(
            size: '80', shape: 'circle', src: wthImg, fit: 'scaleDown',)),
    WAvatar(
        props: WAvatarProp(
            size: '80', shape: 'circle', src: wthImg, fit: 'fitWidth',)),
    WAvatar(
        props: WAvatarProp(
            size: '80', shape: 'circle', src: wthImg, fit: 'fitHeight',)),
  ])
  ''',
);
