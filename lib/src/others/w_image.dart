// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class WImage
    extends WStatelessWidget<WImageOn, WImageProp, WImageSlot, WImageStyle> {
  WImage({
    Key? key,
    WImageOn? on,
    WImageProp? props,
    WImageSlot? slots,
    WImageStyle? style,
  }) : super(key: key) {
    $on = on ?? WImageOn();
    $props = props ?? WImageProp();
    $slots = slots ?? WImageSlot(null);
    $style = style ?? WImageStyle();
    init();
  }

  @override
  Widget wbuild(BuildContext context) {
    errorBuilder(context, object, track) {
      return $slots.error ?? Icon(Icons.error);
    }

    Widget loadingBuilder(context, wdg, loadingProgress) {
      if (loadingProgress == null) return wdg;

      return $slots.placeholder ??
          WProgress(
              props: WProgressProp(
            format: (p) => p == 100 ? '满' : '${p.toInt()}%',
            percentage: loadingProgress.cumulativeBytesLoaded /
                (loadingProgress.expectedTotalBytes ?? 1) *
                100,
            // type: 'circle',
          ));
    }

    if ($props.src != null) {
      if ($props.src!.startsWith('assets:')) {
        print('use assets');
        return Image.asset(
          $props.src!.replaceFirst('assets:', ''),
          fit: $props.fit,
          errorBuilder: errorBuilder,
          // loadingBuilder: loadingBuilder,
        );
      }
      return Image.network(
        $props.src!,
        fit: $props.fit,
        errorBuilder: errorBuilder,
        loadingBuilder: loadingBuilder,
      );
    }
    return Container(child: $slots.error ?? const Text('加载失败'));
  }
}

class WImageOn extends BaseOn {
  Function(dynamic)? load;
  Function(dynamic)? error;
  WImageOn({this.load, this.error});
}

class WImageProp extends BaseProp {
  late String? src;
  late BoxFit? fit;
  late String? alt;
  late String? referrerPolicy;
  late bool lazy;
  late String? scrollContainer;
  late List previewSrcList;
  late int zIndex;
  WImageProp({
    this.src,
    this.fit,
    this.alt,
    this.referrerPolicy,
    this.lazy = false,
    this.scrollContainer,
    this.previewSrcList = const [],
    this.zIndex = 2000,
  });
}

class WImageSlot extends BaseSlot {
  Widget? placeholder;
  Widget? error;
  WImageSlot(defaultSlotBefore, {this.placeholder, this.error})
      : super(defaultSlotBefore);
}
