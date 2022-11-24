// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/theme/element/theme_element.dart';
import 'package:wao_ui/wao_ui.dart';

class WDialog extends WStatelessWidget<WDialogOn, WDialogProp, WDialogSlot,
    WDialogStyle> {
  WDialog({
    Key? key,
    WDialogOn? on,
    WDialogProp? props,
    WDialogSlot? slots,
    WDialogStyle? style,
  }) : super(key: key) {
    $on = on ?? WDialogOn();
    $props = props ?? WDialogProp();
    $slots = slots ?? WDialogSlot(null);
    $style = style ?? WDialogStyle();
    init();
  }

  bool _closeFromThen = false;

  Function(bool value)? show;

  setShow(BuildContext context) {
    show = ([bool visible = true]) {
      if (!visible) {
        if (!_closeFromThen) {
          Navigator.of(context, rootNavigator: true).pop();
        }
      } else if ($props.appendToBody) {
        showInWindow(context);
      } else {
        showInPage(context);
      }
    };
  }

  showInWindow(BuildContext context) {
    // todo 等 flutter 能支持多窗口时增加特性
    showInPage(context);
  }

  showInPage(context) {
    // ignore: prefer_function_declarations_over_variables
    var builder = (BuildContext context) {
      var title =
          $slots.title ?? ($props.title != null ? Text($props.title!) : null);

      $mainAxisAlign =
          $props.center ? MainAxisAlignment.center : MainAxisAlignment.start;
      var actionAxisAlign =
          $props.center ? MainAxisAlignment.center : MainAxisAlignment.end;
      return AlertDialog(
        // titlePadding: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 0.0),
        contentPadding: style.contentPadding ??
            EdgeInsets.fromLTRB(24, 20, 24, $slots.footer == null ? 20.0 : 0.0),
        // insetPadding: const EdgeInsets.all(20),
        buttonPadding: $slots.footer == null
            ? EdgeInsets.zero
            : style.footPadding ?? EdgeInsets.zero,
        titleTextStyle: const TextStyle(fontSize: 16.0, color: Colors.black),
        alignment: getAlign(context),
        title: title != null ? centerWrapper(title) : null,
        content: $row,
        actionsOverflowButtonSpacing: $style.footSpace,
        actionsAlignment: actionAxisAlign,
        actions: $slots.footer ?? [],
      );
    };
    showDialog(context: context, builder: builder).then((value) {
      _closeFromThen = true;
      $props.visible = false;
      _closeFromThen = false;
    });
  }

  centerWrapper(Widget child) {
    return $props.center
        ? Align(
            alignment: Alignment.center,
            child: child,
          )
        : child;
  }

  Alignment getAlign(BuildContext ctx) {
    var top = $props.top;
    if (top.endsWith('vh')) {
      double topRate = double.parse(top.substring(0, top.length - 2)) / 100;
      return Alignment(0.0, topRate - 0.5);
    } else if (top.endsWith('px')) {
      double y = double.parse(top.substring(0, top.length - 2));
      double h = MediaQuery.of(ctx).size.height;
      return Alignment(0.0, y / h - 0.5);
    } else {
      return top == 'topLeft'
          ? Alignment.topLeft
          : top == 'topCenter'
              ? Alignment.topCenter
              : top == 'topRight'
                  ? Alignment.topRight
                  : top == 'centerLeft'
                      ? Alignment.centerLeft
                      : top == 'centerRight'
                          ? Alignment.centerRight
                          : top == 'bottomLeft'
                              ? Alignment.bottomLeft
                              : top == 'bottomCenter'
                                  ? Alignment.bottomCenter
                                  : top == 'bottomRight'
                                      ? Alignment.bottomRight
                                      : Alignment.center;
    }
  }

  @override
  Widget wbuild(BuildContext context) {
    setShow(context);
    $props.$addVisibleListener(() => show!($props.visible));
    return $slots.btn != null
        ? InkWell(
            onTap: open,
            child: $slots.btn!,
          )
        : $props.btn != null
            ? TextButton(
                onPressed: open,
                child: Text($props.btn!),
              )
            : const Offstage();
  }

  open() {
    $props.visible = true;
  }
}

class WDialogOn extends BaseOn {}

class WDialogProp extends BaseProp with VisibleProp {
  String? title;
  late String? btn;
  late String width;
  late bool fullscreen;
  late String top;
  late bool modal;
  late bool modalAppendToBody;
  late bool appendToBody;
  late bool lockScroll;
  late String? customClass;
  late bool closeOnClickModal;
  late bool closeOnPressEscape;
  late bool showClose;
  late Function? beforeClose;
  late bool center;
  late bool destroyOnClose;

  WDialogProp({
    visible,
    btn,
    title,
    width,
    fullscreen,
    top,
    modal,
    modalAppendToBody,
    appendToBody,
    lockScroll,
    customClass,
    closeOnClickModal,
    closeOnPressEscape,
    showClose,
    this.beforeClose,
    center,
    destroyOnClose,
  }) {
    this.visible = visible ?? false;
    this.btn = btn;
    this.title = title;
    this.width = width ?? '50%';
    this.fullscreen = fullscreen ?? false;
    this.top = top ?? '15vh';
    this.modal = modal ?? true;
    this.modalAppendToBody = modalAppendToBody ?? true;
    this.appendToBody = appendToBody ?? false;
    this.lockScroll = lockScroll ?? true;
    this.customClass = customClass;
    this.closeOnClickModal = closeOnClickModal ?? true;
    this.closeOnPressEscape = closeOnPressEscape ?? true;
    this.showClose = showClose ?? true;
    this.center = center ?? false;
    this.destroyOnClose = destroyOnClose ?? false;
  }
}

class WDialogSlot extends BaseSlot {
  Widget? title;
  List<Widget>? footer;
  Widget? btn;
  WDialogSlot(defaultSlotBefroe, {this.title, this.footer, this.btn})
      : super(defaultSlotBefroe);
}
