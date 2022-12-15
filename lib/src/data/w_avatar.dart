// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:wao_ui/src/others/w_image.dart';

class WAvatar extends WStatelessWidget<WAvatarOn, WAvatarProp, WAvatarSlot,
    WAvatarStyle> {
  WAvatar({
    Key? key,
    WAvatarOn? on,
    WAvatarProp? props,
    WAvatarSlot? slots,
    WAvatarStyle? style,
  }) : super(key: key) {
    $on = on ?? WAvatarOn();
    $props = props ?? WAvatarProp();
    $slots = slots ?? WAvatarSlot(null);
    $style = style ?? WAvatarStyle();
    init();
  }

  @override
  beforeBuild() {
    var width = $props.isCustomSize
        ? double.parse($props.size)
        : cfgGlobal.avatarSize.val($props.size);
    style.width = width;
    style.maxWidth = width;
    style.height = width;
    return super.beforeBuild();
  }

  @override
  Widget wbuild(BuildContext context) {
    return $props.isCircle ? ClipOval(child: sizedBox) : sizedBox;
  }

  Widget get sizedBox {
    return AspectRatio(
      aspectRatio: 1,
      child: avatar,
    );
  }

  Widget get avatar {
    Widget img;
    if ($props.src != null) {
      img = WImage()
        ..$style.height = $style.height
        ..$style.width = $style.width
        ..$props.src = $props.src
        ..$props.fit = BoxFit.values.firstWhere(
          (element) => element.name == $props.fit,
        );
    } else if ($slots.$ != null) {
      return img = $slots.$;
    } else {
      img = Icon(
        $props.icon!.icon,
        color: style.color ?? CfgGlobal.primaryColor,
        size: style.fontSize,
      );
    }
    return img;
  }
}

class WAvatarOn extends BaseOn {}

var avatarSizeOpt = ['large', 'medium', 'small'];

class WAvatarProp extends BaseProp {
  Icon? icon;
  late String size;
  late String shape;
  String? src;
  String? srcSet;
  String alt = '';
  late String fit = 'cover';

  bool get isCustomSize {
    return !avatarSizeOpt.contains(size);
  }

  bool get isCircle {
    return shape == 'circle';
  }

  bool get isSquare {
    return shape == 'square';
  }

  WAvatarProp({
    this.icon,
    size,
    shape,
    this.src,
    srcSet,
    alt,
    fit,
  }) {
    this.size = size ?? 'large';
    this.shape = shape ?? 'circle';
    this.fit = fit ?? 'cover';
    if (src == null && icon == null) {
      icon = const Icon(
        Icons.person,
      );
    }
  }
}

class WAvatarSlot extends BaseSlot {
  WAvatarSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
