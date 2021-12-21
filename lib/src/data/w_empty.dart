import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';

class WEmpty extends StatelessWidget
    implements BaseWidget<WEmptyOn, WEmptyProp, WEmptySlot> {
  @override
  late final WEmptyOn $on;

  @override
  late final WEmptyProp $props;

  @override
  late final WEmptySlot $slots;

  WEmpty(
    Widget? defaultSlot, {
    Key? key,
    WEmptyOn? on,
    WEmptyProp? props,
    WEmptySlot? slots,
  }) : super(key: key) {
    $on = on ?? WEmptyOn();
    $props = props ?? WEmptyProp();
    $slots = slots ?? WEmptySlot(defaultSlot);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [image, description, ...($slots.defaultSlot ?? [])],
        ),
      ],
    );
  }

  Widget get description {
    var desc = $slots.description ??
        Text(
          $props.description ?? '',
          style: TextStyle(
            color: cfgGlobal.empty.descriptionColor,
          ),
        );
    return paddingWrapper(desc, cfgGlobal.empty.descriptionPadding, true);
  }

  Widget get image {
    return $slots.image ??
        ($props.image == null
            ? SizedBox(
                width: $props.imageSize,
                child: AspectRatio(
                  aspectRatio: .9,
                  child: SvgPicture.string(cfgGlobal.empty.imgSvg),
                ),
              )
            : Image.network($props.image!));
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
