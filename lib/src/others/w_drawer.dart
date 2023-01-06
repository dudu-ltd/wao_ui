// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/string_util.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

class _WDrawerState extends WState<WDrawer> {
  late OverlayEntry panelOverlay;

  showPanelAction() {
    OverlayEntry overlayEntry = OverlayEntry(builder: (content) {
      return WDrawerView(
        on: WDrawerOn(close: () {
          widget.$on._close?.call();
          panelOverlay.remove();
        }),
        slots: widget.$slots,
        props: widget.$props,
        style: widget.$style,
      );
    });
    panelOverlay = overlayEntry;
    Overlay.of(
      context,
      rootOverlay: modalAppendToBody,
    )?.insert(overlayEntry);
  }

  @override
  void initState() {
    super.initState();
    widget.$props.visible?.addListener(() {
      if (widget.$props.visible?.value) showPanelAction();
    });
  }

  @override
  Widget wbuild(BuildContext context) {
    return const SizedBox(
      width: 0,
      height: 0,
    );
  }

  bool get modalAppendToBody {
    return widget.$props.modalAppendToBody;
  }
}

class WDrawer
    extends WStatefulWidget<WDrawerOn, WDrawerProp, WDrawerSlot, WDrawerStyle> {
  WDrawer({
    Key? key,
    WDrawerOn? on,
    WDrawerProp? props,
    WDrawerSlot? slots,
    WDrawerStyle? style,
  }) : super(key: key) {
    $on = on ?? WDrawerOn();
    $props = props ?? WDrawerProp();
    $slots = slots ?? WDrawerSlot(null);
    $style = style ?? WDrawerStyle();
    init();
  }
  @override
  State<WDrawer> createState() => _WDrawerState();
}

class WDrawerOn extends BaseOn {
  Function()? _close;
  WDrawerOn({close}) {
    _close = close;
  }
}

class WDrawerProp extends BaseProp {
  late bool appendToBody;
  Function(dynamic)? beforeClose;
  late bool closeOnPressEscape;
  late String? customClass;
  late bool destroyOnClose;
  late bool modal;
  late bool modalAppendToBody;
  late String direction;
  late bool showClose;
  late String size;
  late String? title;
  late bool wrapperClosable;
  late bool withHeader;
  late ValueNotifier? visible = ValueNotifier(false);

  WDrawerProp({
    /// TODO 待实现
    this.appendToBody = false,
    this.beforeClose,

    /// TODO 待实现
    this.closeOnPressEscape = true,

    /// TODO 待实现，请先使用 $style 进行样式控制。
    this.customClass,

    /// TODO 待实现
    this.destroyOnClose = false,
    this.modal = true,
    this.modalAppendToBody = true,
    this.direction = 'rtl',
    this.showClose = true,
    this.size = '30%',
    this.title,
    this.visible,
    this.wrapperClosable = true,
    this.withHeader = true,
  });

  bool get directionIsRtl {
    return direction == 'rtl';
  }

  bool get directionIsLtr {
    return direction == 'ltr';
  }

  bool get directionIsBtt {
    return direction == 'btt';
  }

  bool get directionIsTtb {
    return direction == 'ttb';
  }

  bool get directionIsH {
    return directionIsRtl || directionIsLtr;
  }

  bool get directionIsV {
    return directionIsBtt || directionIsTtb;
  }
}

class WDrawerSlot extends BaseSlot {
  WDrawerSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WDrawerView
    extends WStatefulWidget<WDrawerOn, WDrawerProp, WDrawerSlot, WDrawerStyle> {
  WDrawerView({
    Key? key,
    WDrawerOn? on,
    WDrawerProp? props,
    WDrawerSlot? slots,
    WDrawerStyle? style,
  }) : super(key: key) {
    $on = on ?? WDrawerOn();
    $props = props ?? WDrawerProp();
    $slots = slots ?? WDrawerSlot(null);
    $style = style ?? WDrawerStyle();
    init();
  }

  @override
  State<WDrawerView> createState() => _WDrawerViewState();
}

class _WDrawerViewState extends WState<WDrawerView>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController panelController;
  late Animation<Color?> panelBackgroundColor;
  Animation<double>? panelContentWidth = null;

  @override
  void initState() {
    super.initState();

    panelController = AnimationController(
      vsync: this,
      duration: CfgGlobal.duration,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        panelContentWidth =
            Tween(begin: -size, end: 0.0).animate(panelController)
              ..addListener(() {
                setState(() {});
              });
      });
    });
    panelBackgroundColor = ColorTween(
            begin: Colors.black.withAlpha(0), end: Colors.black.withAlpha(0x4f))
        .animate(panelController);
    panelController.forward();
  }

  @override
  void dispose() {
    panelController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget wbuild(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(0),
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (widget.$props.modal) modal,
          drawerPanel,
        ],
      ),
    );
  }

  Widget get modal {
    var mask = Container(
      color: panelBackgroundColor.value,
    );
    return widget.$props.wrapperClosable
        ? Listener(
            onPointerUp: (e) {
              hidePanelAction();
            },
            child: mask,
          )
        : mask;
  }

  Widget get drawerPanel {
    var offset = panelContentWidth?.value ?? -size;
    return Positioned(
      top: widget.$props.directionIsTtb ? offset : null,
      bottom: widget.$props.directionIsBtt ? offset : null,
      left: widget.$props.directionIsLtr ? offset : null,
      right: widget.$props.directionIsRtl ? offset : null,
      child: shadowWrapper(
        ColoredBox(
          color: Colors.white,
          child: SizedBox(
            // width: size,
            width: widget.$props.directionIsH
                ? size
                : MediaQuery.of(context).size.width,
            height: widget.$props.directionIsV
                ? size
                : MediaQuery.of(context).size.height,
            child: view,
          ),
        ),
        shadow: shadow,
      ),
    );
  }

  Widget get view {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.$props.withHeader) header,
        Expanded(child: body),
      ],
    );
  }

  Widget get header {
    return Padding(
      padding: EdgeInsets.all(titlePadding),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.$props.title ?? '',
              style: titleTextStyle,
            ),
          ),
          if (widget.$props.showClose)
            IconButton(
              icon: Icon(Icons.close_sharp),
              onPressed: hidePanelAction,
            ),
        ],
      ),
    );
  }

  Widget get body {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(bodyPadding),
        child: widget.$col,
      ),
    );
  }

  hidePanelAction() {
    print(widget.$props.beforeClose);
    if (widget.$props.beforeClose != null) {
      widget.$props.beforeClose?.call(closeAction);
    } else {
      closeAction();
    }
  }

  closeAction() {
    widget.$props.visible?.value = false;
    panelController.reverse().whenComplete(() {
      // panelController.dispose();
      widget.$on._close?.call();
    });
  }

  double get titlePadding {
    return widget.$style.titlePadding ?? cfgGlobal.drawer.titlePadding ?? 20;
  }

  double get bodyPadding {
    return widget.$style.bodyPadding ?? cfgGlobal.drawer.bodyPadding ?? 20;
  }

  TextStyle get titleTextStyle {
    return widget.$style.titleTextStyle ??
        cfgGlobal.drawer.titleTextStyle ??
        const TextStyle(
          decoration: TextDecoration.none,
          color: Color(0xFF72767b),
          fontSize: 16,
          fontWeight: FontWeight.normal,
        );
  }

  double get size {
    return StringUtil.stringToSize(widget.$props.size, context);
  }

  List<BoxShadow> get shadow {
    return widget.$style.boxShadow ??
        cfgGlobal.drawer.boxShadow ??
        const [
          BoxShadow(
            color: Color.fromARGB(255 * .2 ~/ 1, 0, 0, 0),
            offset: Offset(0.0, 8.0),
            blurRadius: 10.0,
            spreadRadius: -5,
          ),
          BoxShadow(
            color: Color.fromARGB(255 * .14 ~/ 1, 0, 0, 0),
            offset: Offset(0.0, 16.0),
            blurRadius: 24.0,
            spreadRadius: 2.0,
          ),
          BoxShadow(
            color: Color.fromARGB(255 * .12 ~/ 1, 0, 0, 0),
            offset: Offset(0.0, 6.0),
            blurRadius: 30.0,
            spreadRadius: 5.0,
          ),
        ];
  }
}
