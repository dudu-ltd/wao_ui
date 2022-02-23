import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';

class WAvatar extends StatelessWidget
    with BaseMixins<WAvatarOn, WAvatarProp, WAvatarSlot, WAvatarStyle> {
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
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(
      //       $props.isCircle
      //           ? cfgGlobal.borderRadius.circle
      //           : cfgGlobal.borderRadius.val($props.size),
      //     ),
      //   ),
      // ),
      width: $props.isCustomSize
          ? double.parse($props.size)
          : cfgGlobal.avatarSize.val($props.size),
      child: $props.isCircle ? ClipOval(child: sizedBox) : sizedBox,
    );
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
      img = Image.network(
        $props.src!,
        fit: BoxFit.values.firstWhere((element) => element.name == $props.fit),
      );
    } else {
      img = Icon(
        $props.icon!.icon,
        size: cfgGlobal.avatarSize.val($props.size) * .6,
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
    if (src == null && icon == null) icon = const Icon(Icons.person);
  }
}

class WAvatarSlot extends BaseSlot {
  WAvatarSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
