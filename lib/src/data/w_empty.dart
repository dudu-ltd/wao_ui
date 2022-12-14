// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:wao_ui/src/others/w_image.dart';

class WEmpty
    extends WStatelessWidget<WEmptyOn, WEmptyProp, WEmptySlot, WEmptyStyle> {
  WEmpty({
    Key? key,
    WEmptyOn? on,
    WEmptyProp? props,
    WEmptySlot? slots,
    WEmptyStyle? style,
  }) : super(key: key) {
    $on = on ?? WEmptyOn();
    $props = props ?? WEmptyProp();
    $slots = slots ?? WEmptySlot(null);
    $style = style ?? WEmptyStyle();
    init();
  }

  @override
  Widget wbuild(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [image, description, ...defaultSlot],
        ),
      ],
    );
  }

  Widget get description {
    var desc = $slots.description ??
        Text(
          $props.description ?? '',
          style: TextStyle(
            color: cfgGlobal.empty.description?.color ?? CfgGlobal.textColor,
          ),
        );
    return paddingWrapper(
      desc,
      padding: cfgGlobal.empty.description?.padding ?? CfgGlobal.padding.small,
      need: true,
    );
  }

  Widget get image {
    return $slots.image ??
        (SizedBox(
            width: $props.imageSize,
            child: $props.image == null
                ? AspectRatio(
                    aspectRatio: .9,
                    child: SvgPicture.string(
                        style.imgSvg ?? cfgGlobal.empty.imgSvg!),
                  )
                : (WImage()
                  ..$props.src = $props.image
                  ..$props.fit = BoxFit.cover)));
  }
}

class WEmptyOn extends BaseOn {}

class WEmptyProp extends BaseProp {
  String? image;
  String? description;
  late double imageSize;
  WEmptyProp({this.image, this.description, imageSize}) {
    this.imageSize = imageSize ?? cfgGlobal.empty.imageSize;
  }
}

class WEmptySlot extends BaseSlot {
  Widget? image;
  Widget? description;
  WEmptySlot(
    defaultSlotBefore, {
    this.image,
    this.description,
  }) : super(defaultSlotBefore);
}
