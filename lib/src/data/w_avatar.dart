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
  Widget wbuild(BuildContext context) {
    var width = $props.isCustomSize
        ? double.parse($props.size)
        : cfgGlobal.avatarSize.val($props.size);
    var content = Container(
      decoration: BoxDecoration(
        color: style.backgroundColor ?? CfgGlobal.basicColor.shade50,
      ),
      width: width,
      constraints: BoxConstraints(maxWidth: width),
      child: sizedBox,
    );
    return Padding(
      padding: style.padding ?? EdgeInsets.zero,
      child: $props.isCircle ? ClipOval(child: content) : content,
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
      img = WImage(
        props: WImageProp(
          src: $props.src,
          fit: BoxFit.values.firstWhere(
            (element) => element.name == $props.fit,
          ),
        ),
      );
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
