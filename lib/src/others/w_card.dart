import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

class WCard extends StatelessWidget
    implements BaseWidget<WCardOn, WCardProp, WCardSlot, WCardStyle> {
  @override
  late final WCardOn $on;
  @override
  late final WCardProp $props;
  @override
  late final WCardSlot $slots;
  @override
  late WCardStyle $style;

  WCard({
    Key? key,
    WCardOn? on,
    WCardProp? props,
    WCardSlot? slots,
    WCardStyle? style,
  }) : super(key: key) {
    $on = on ?? WCardOn();
    $props = props ?? WCardProp();
    $slots = slots ?? WCardSlot(null);
    $style = style ?? WCardStyle();
  }

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return MouseRegion(
        onEnter: (event) {
          isHover = true;
          setState(() {});
        },
        onExit: (event) {
          isHover = false;
          setState(() {});
        },
        child: borderWrapper(
          ColoredBox(
            color: backgroundColor,
            child: shadowWrapper(
              SizedBox(
                width: width,
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(maxWidth: width ?? double.maxFinite),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if ($slots.header != null) ...[
                        paddingWrapper($slots.header!, padding, true),
                        const Divider(height: 1),
                      ],
                      paddingWrapper(
                        Wrap(
                          spacing: spacing,
                          direction: Axis.vertical,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: $slots.defaultSlot ?? [],
                        ),
                        padding,
                        padding != null,
                      ),
                    ],
                  ),
                ),
              ),
              need: needShadow,
              backgroundColor: backgroundColor,
              color: borderColor,
            ),
          ),
          Border.all(color: borderColor),
          true,
        ),
      );
    });
  }

  Color get borderColor {
    return $style.borderColor ??
        cfgGlobal.card.borderColor ??
        ColorUtil.hexToColor('#ebeef5');
  }

  Color get backgroundColor {
    return $style.backgroundColor ??
        cfgGlobal.card.backgroundColor ??
        Colors.white;
  }

  bool get needShadow {
    return $props.shadow == 'always' || ($props.shadow == 'hover' && isHover);
  }

  double get spacing {
    return $style.spacing ?? cfgGlobal.card.spacing ?? 8;
  }

  double? get width {
    return $style.width ?? cfgGlobal.card.width;
  }

  EdgeInsets? get padding {
    return $style.padding ?? cfgGlobal.card.padding;
  }
}

class WCardOn extends BaseOn {}

class WCardProp extends BaseProp {
  late String? header;
  late Object bodyStyle;

  /// always | hover | never
  late String shadow;
  WCardProp({
    this.header,
    this.bodyStyle = const {'padding': '20px'},
    this.shadow = 'always',
  });
}

class WCardSlot extends BaseSlot {
  Widget? header;
  WCardSlot(defaultSlotBefore, {this.header}) : super(defaultSlotBefore);
}
