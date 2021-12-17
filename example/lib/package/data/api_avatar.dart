import 'package:flutter/material.dart';
import 'package:wao_ui/src/data/w_avatar.dart';

class ApiAvatar extends StatelessWidget {
  const ApiAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultIconAvatarGroup = [
      WAvatar(props: WAvatarProp(size: 'large')),
      WAvatar(props: WAvatarProp(size: 'medium')),
      WAvatar(props: WAvatarProp(size: 'small')),
    ];
    var customIconAvatarGroup = [
      WAvatar(
        props: WAvatarProp(icon: const Icon(Icons.person_add), size: 'large'),
      ),
      WAvatar(
        props: WAvatarProp(icon: const Icon(Icons.person_add), size: 'medium'),
      ),
      WAvatar(
        props: WAvatarProp(icon: const Icon(Icons.person_add), size: 'small'),
      ),
    ];
    var imgSrc =
        'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png';
    var imgAvatarGroup = [
      WAvatar(props: WAvatarProp(src: imgSrc, size: 'large')),
      WAvatar(props: WAvatarProp(src: imgSrc, size: 'medium')),
      WAvatar(props: WAvatarProp(src: imgSrc, size: 'small')),
    ];
    var squareAvatarGroup = [
      WAvatar(props: WAvatarProp(shape: 'square', src: imgSrc, size: 'large')),
      WAvatar(props: WAvatarProp(shape: 'square', src: imgSrc, size: 'medium')),
      WAvatar(props: WAvatarProp(shape: 'square', src: imgSrc, size: 'small')),
    ];
    imgSrc =
        'https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg';
    var fitAvatarGroup = [
      WAvatar(props: WAvatarProp(shape: 'square', src: imgSrc, fit: 'fill')),
      WAvatar(props: WAvatarProp(shape: 'square', src: imgSrc, fit: 'contain')),
      WAvatar(props: WAvatarProp(shape: 'square', src: imgSrc, fit: 'cover')),
      WAvatar(props: WAvatarProp(shape: 'square', src: imgSrc, fit: 'none')),
      WAvatar(
          props: WAvatarProp(shape: 'square', src: imgSrc, fit: 'scaleDown')),
    ];
    var fitSquareAvatarGroup = [
      WAvatar(
          props: WAvatarProp(
              size: '100', shape: 'square', src: imgSrc, fit: 'fill')),
      WAvatar(
          props: WAvatarProp(
              size: '100', shape: 'square', src: imgSrc, fit: 'contain')),
      WAvatar(
          props: WAvatarProp(
              size: '100', shape: 'square', src: imgSrc, fit: 'cover')),
      WAvatar(
          props: WAvatarProp(
              size: '100', shape: 'cirsquarecle', src: imgSrc, fit: 'none')),
      WAvatar(
          props: WAvatarProp(
              size: '100', shape: 'square', src: imgSrc, fit: 'scaleDown')),
    ];
    var fitCircleAvatarGroup = [
      WAvatar(
          props: WAvatarProp(
              size: '100', shape: 'circle', src: imgSrc, fit: 'fill')),
      WAvatar(
          props: WAvatarProp(
              size: '100', shape: 'circle', src: imgSrc, fit: 'contain')),
      WAvatar(
          props: WAvatarProp(
              size: '100', shape: 'circle', src: imgSrc, fit: 'cover')),
      WAvatar(
          props: WAvatarProp(
              size: '100', shape: 'circle', src: imgSrc, fit: 'none')),
      WAvatar(
          props: WAvatarProp(
              size: '100', shape: 'circle', src: imgSrc, fit: 'scaleDown')),
      WAvatar(
          props: WAvatarProp(
              size: '100', shape: 'circle', src: imgSrc, fit: 'fitWidth')),
      WAvatar(
          props: WAvatarProp(
              size: '100', shape: 'circle', src: imgSrc, fit: 'fitHeight')),
    ];
    return Container(
      child: ListView(children: [
        Row(children: defaultIconAvatarGroup),
        Row(children: customIconAvatarGroup),
        Row(children: imgAvatarGroup),
        Row(children: squareAvatarGroup),
        Row(children: fitAvatarGroup),
        Row(children: fitCircleAvatarGroup),
        Row(children: fitSquareAvatarGroup),
      ]),
    );
  }
}
