import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';

class WResult extends StatelessWidget
    implements BaseWidget<WResultOn, WResultProp, WResultSlot> {
  @override
  late final WResultOn $on;

  @override
  late final WResultProp $props;

  @override
  late final WResultSlot $slots;

  WResult({
    Key? key,
    WResultOn? on,
    WResultProp? props,
    WResultSlot? slots,
  }) : super(key: key) {
    $on = on ?? WResultOn();
    $props = props ?? WResultProp();
    $slots = slots ?? WResultSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: cfgGlobal.result.outPadding,
      child: Column(
        children: [
          if (icon != null) mT18Wrapper(icon!),
          if (title != null) mT18Wrapper(title!),
          if (subTitle != null) mT18Wrapper(subTitle!),
          if (extra != null) mT18Wrapper(mT18Wrapper(extra!)),
        ],
      ),
    );
  }

  Widget mT18Wrapper(Widget child) {
    return Container(
      margin: cfgGlobal.result.itemMargin,
      child: child,
    );
  }

  Widget? get icon {
    return $slots.icon ??
        Icon(
          cfgGlobal.result.icon($props.icon),
          color: cfgGlobal.color.val($props.icon),
          size: 72,
        );
  }

  Widget? get title {
    return $slots.title ??
        Text(
          $props.title ?? '',
          style: TextStyle(
            fontSize: cfgGlobal.result.titleFontSize,
            color: cfgGlobal.result.titleColor,
          ),
        );
  }

  Widget? get subTitle {
    return $slots.subTitle ??
        Text(
          $props.subTitle ?? '',
          style: TextStyle(
            fontSize: cfgGlobal.result.subTitleFontSize,
            color: cfgGlobal.result.subTitleColor,
          ),
        );
  }

  Widget? get extra {
    return $slots.extra;
  }
}

class WResultOn extends BaseOn {}

class WResultProp extends BaseProp {
  String? title;
  String? subTitle;
  late String icon;
  WResultProp({this.title, this.subTitle, icon}) {
    this.icon = icon ?? 'info';
  }
}

class WResultSlot extends BaseSlot {
  Widget? icon;
  Widget? title;
  Widget? subTitle;
  Widget? extra;
  WResultSlot({this.icon, this.title, this.subTitle, this.extra});
}
