import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class _WAlertState extends WState<WAlert> {
  @override
  Widget wbuild(BuildContext context) {
    return Row(
      children: [
        Expanded(child: message),
        ...closeBtn,
      ],
    );
  }

  Widget get message {
    var messageContent = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.$props.title,
          maxLines: 2,
          softWrap: false,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: widget.style.fontSize,
            color: widget.style.color,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (widget.$props.description != null)
          Text(
            widget.$props.description!,
            maxLines: 2,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: (widget.style.fontSize ?? 14) - 2,
              color: widget.style.color,
            ),
          ),
      ],
    );

    return Row(
      mainAxisAlignment: widget.$props.center
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        if (widget.$props.showIcon)
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Icon(
              widget.style.icon,
              color: widget.style.color,
              size: widget.style.fontSize ?? 18,
            ),
          ),
        Flexible(child: messageContent),
      ],
    );
  }

  List<Widget> get closeBtn {
    return widget.$props.closable
        ? [
            InkWell(
              child: closeBtnContent,
              onTap: () {
                widget.$on.close?.call();
                widget.style.display = false;
                updateView();
              },
            )
          ]
        : [];
  }

  Widget get closeBtnContent {
    return widget.$props.closeText == null
        ? Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.close,
              size: 12,
              color: widget.style.color,
            ),
          )
        : Text(
            widget.$props.closeText!,
            style: TextStyle(color: widget.style.color),
          );
  }
}

class WAlert
    extends WStatefulWidget<WAlertOn, WAlertProp, WAlertSlot, WAlertStyle> {
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
  State<WAlert> createState() => _WAlertState();
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
    this.center = false,
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
