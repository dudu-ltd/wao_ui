import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:wao_ui/wao_ui.dart';

class WFrame extends StatelessWidget
    with BaseMixins<WFrameOn, WFrameProp, WFrameSlot, WFrameStyle> {
  WFrame({
    Key? key,
    WFrameOn? on,
    WFrameProp? props,
    WFrameSlot? slots,
    WFrameStyle? style,
  }) : super(key: key) {
    $on = on ?? WFrameOn();
    $props = props ?? WFrameProp();
    $slots = slots ?? WFrameSlot(null);
    $style = style ?? WFrameStyle();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          WindowTitleBarBox(
            child: Row(
              children: [
                $slots.icon != null
                    ? MoveWindow(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: $slots.icon,
                        ),
                      )
                    : Container(),
                $slots.header != null
                    ? MoveWindow(
                        child: $slots.header,
                      )
                    : Container(),
                Expanded(child: MoveWindow()),
                getButtions()
              ],
            ),
          ),
          Expanded(child: $slots.main ?? Container()),
          $slots.footer ?? Container()
        ],
      ),
    );
  }

  Widget getButtions() {
    return Row(
      children: [
        MinimizeWindowButton(
          animate: true,
        ),
        MaximizeWindowButton(
          animate: true,
        ),
        CloseWindowButton(
          animate: true,
        )
      ],
    );
  }
}

class WFrameOn extends BaseOn {}

class WFrameProp extends BaseProp {}

class WFrameSlot extends BaseSlot {
  Widget? main;
  Widget? header;
  Widget? footer;
  Widget? icon;
  WFrameSlot(
    defaultSlotBefore, {
    this.main,
    this.header,
    this.footer,
    this.icon,
  }) : super(defaultSlotBefore);
}
