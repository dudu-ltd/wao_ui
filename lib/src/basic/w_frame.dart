import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:wao_ui/wao_ui.dart';

import '../../core/env.dart';

class WFrame
    extends WStatelessWidget<WFrameOn, WFrameProp, WFrameSlot, WFrameStyle> {
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
  Widget wbuild(BuildContext context) {
    Widget? title = isPc
        ? WindowTitleBarBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                $slots.icon != null
                    ? MoveWindow(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: $slots.icon,
                        ),
                      )
                    : Container(),
                if ($slots.header != null)
                  MoveWindow(
                    child: $slots.header,
                  ),
                Expanded(child: MoveWindow()),
                if (isPc) getButtions()
              ],
            ),
          )
        : FractionallySizedBox(widthFactor: 1, child: $slots.header);
    var appBar = AppBar(
      shadowColor: Colors.transparent,
      toolbarHeight: 30,
      iconTheme: IconThemeData().copyWith(size: 14, opacity: kIsWeb ? 0 : 1),
      backgroundColor: Colors.white,
      foregroundColor: CfgGlobal.primaryColor,
      actions: [if (isPc) getButtions()],
      toolbarTextStyle: TextStyle(fontSize: 14),
      flexibleSpace: title,
      leading: $slots.icon,
      titleSpacing: 0,
    );
    return Scaffold(
      appBar: isPc && $props.showWindowTitleBarBox ? appBar : null,
      body: Flex(
        direction: Axis.vertical,
        children: [
          // title ?? Container(),
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

class WFrameProp extends BaseProp {
  bool showWindowTitleBarBox = true;
  WFrameProp({this.showWindowTitleBarBox = true});
}

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
