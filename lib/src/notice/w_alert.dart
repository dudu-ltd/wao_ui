import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class WAlert
    extends WStatelessWidget<WAlertOn, WAlertProp, WAlertSlot, WAlertStyle> {
  WAlert({
    Key? key,
    WAlertOn? on,
    WAlertProp? props,
    WAlertSlot? slots,
    WAlertStyle? style,
  }) : super(key: key) {
    $on = on ?? WAlertOn();
    $props = props ?? WAlertProp();
    $slots = slots ?? WAlertSlot(null);
    $style = style ?? WAlertStyle();
    init();
  }

  @override
  Widget wbuild(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            $props.title,
            style: TextStyle(
              fontSize: style.fontSize,
              color: style.color,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.close,
              size: 12,
              color: style.color,
            ),
          ),
        ),
      ],
    );
  }
}

class WAlertOn extends BaseOn {
  Function()? close;
  WAlertOn({this.close});
}

class WAlertProp extends BaseProp {
  late String title;
  late String type;
  String? description;
  late bool closable;
  late bool center;
  String? closeText;
  late bool showIcon;
  String? effect;
  WAlertProp({
    this.title = '',
    this.type = 'info',
    this.description,
    this.closable = true,
    this.center = true,
    this.closeText,
    this.showIcon = false,
    this.effect,
  });

  bool get effectIsDark {
    return effect == 'dark';
  }
}

class WAlertSlot extends BaseSlot {
  WAlertSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
