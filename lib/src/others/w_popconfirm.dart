import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/wao_ui.dart';

class WPopconfirm extends WStatelessWidget<WPopconfirmOn, WPopconfirmProp,
    WPopconfirmSlot, WPopconfirmStyle> {
  WPopconfirm({
    Key? key,
    WPopconfirmOn? on,
    WPopconfirmProp? props,
    WPopconfirmSlot? slots,
    WPopconfirmStyle? style,
  }) : super(key: key) {
    $on = on ?? WPopconfirmOn();
    $props = props ?? WPopconfirmProp();
    $slots = slots ?? WPopconfirmSlot(null);
    $style = style ?? WPopconfirmStyle();
    init();
  }

  @override
  Widget wbuild(BuildContext context) {
    return Container();
  }
}

class WPopconfirmOn extends BaseOn {}

class WPopconfirmProp extends BaseProp {
  late String? title;
  late String? confirmButtonText;
  late String? cancelButtonText;
  late String confirmButtonType;
  late String cancelButtonType;
  late IconData icon;
  late Color iconColor;
  late bool hideIcon;
  WPopconfirmProp({
    this.title,
    this.confirmButtonText,
    this.cancelButtonText,
    this.confirmButtonType = 'primary',
    this.cancelButtonType = 'text',
    this.icon = Icons.question_mark,
    iconColor = '#FF9900',
    this.hideIcon = false,
  }) {
    this.iconColor = ColorUtil.hexToColor(iconColor);
  }
}

class WPopconfirmSlot extends BaseSlot {
  Widget? reference;
  WPopconfirmSlot(defaultSlotBefore, {this.reference})
      : super(defaultSlotBefore);
}
