import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';

class WTag extends StatelessWidget
    with BaseMixins<WTagOn, WTagProp, WTagSlot, WTagStyle> {
  WTag({
    Key? key,
    WTagOn? on,
    WTagProp? props,
    WTagSlot? slots,
    WTagStyle? style,
  }) : super(key: key) {
    $on = on ?? WTagOn();
    $props = props ?? WTagProp();
    $slots = slots ?? WTagSlot(null);
    $style = style ?? WTagStyle();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      padding: style.padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [...tagMain, ...closeButton],
      ),
    );
  }

  List<Widget> get closeButton {
    return $props.closable
        ? [
            marginWrapper(
              closeButtonMain,
              EdgeInsets.only(left: $style?.padding?.left ?? 0),
            )
          ]
        : [];
  }

  Widget get closeButtonMain {
    return MouseStateBuilder(
      builder: (context, state) {
        return Listener(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: colorWrapper(
              Icon(
                Icons.close,
                color: state.isMouseOver ? Colors.white : fontColor,
                size: 16,
              ),
              closeButtonBackground,
              state.isMouseOver,
            ),
          ),
          onPointerUp: (e) => $on.close?.call(),
        );
      },
    );
  }

  List<Widget> get tagMain {
    if (defaultSlot != null) {
      return defaultSlot;
    } else {
      if ($slots.$ is String) {
        var text = $slots.$ as String;
        return [
          Tooltip(
            message: text,
            showDuration: const Duration(seconds: 1),
            child: Text(
              text,
              style: TextStyle(
                color: fontColor,
                fontSize: fontSize,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ];
      }
    }
    return [];
  }

  BoxDecoration get decoration {
    BoxDecoration decoration = BoxDecoration(
      color: backgroundColor,
      border: WBorder.all($props.size, $props.type),
      borderRadius: style.borderRadius,
    );
    return decoration;
  }

  Color get backgroundColor {
    return $props.isDark
        ? color
        : $props.isPlain
            ? Colors.white
            : color.shade200;
  }

  Color get fontColor {
    return $props.isDark ? Colors.white : color.shade700;
  }

  double get fontSize {
    return cfgGlobal.font.val($props.size);
  }

  MaterialColor get color {
    return CfgGlobal.color($props.type);
  }

  Color get closeButtonBackground {
    return $props.isDark ? color.shade200 : color;
  }
}

class WTagOn extends BaseOn {
  Function? click;
  Function()? close;
  WTagOn({this.click, this.close});
}

class WTagProp extends BaseProp {
  String? type;
  late bool closable;
  late bool disableTransitions;
  late bool hit;
  Color? color;
  String? size;
  String? effect;

  WTagProp({
    String? type,
    bool? closable,
    bool? disableTransitions,
    bool? hit,
    this.color,
    String? size,
    this.effect,
  }) {
    this.type = type ?? 'primary';
    this.closable = closable ?? false;
    this.disableTransitions = disableTransitions ?? false;
    this.hit = hit ?? false;
    this.size = size ?? 'small';
  }

  bool get isDark {
    return effect == 'dark';
  }

  bool get isPlain {
    return effect == 'plain';
  }
}

class WTagSlot extends BaseSlot {
  WTagSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
