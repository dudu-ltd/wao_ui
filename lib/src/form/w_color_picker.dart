// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/src/mixins/has_overlay_mixin.dart';
import 'package:wao_ui/wao_ui.dart';

class _WColorPickerState extends WState<WColorPicker>
    with TickerProviderStateMixin, HasOverlayMixin {
  @override
  void initState() {
    super.initState();
    setAnimationWhenInit();
  }

  @override
  Widget wbuild(BuildContext context) {
    return WButton(
      key: buttonKey,
    )
      ..$props.icon = Icons.expand_more
      ..$props.size = widget.$props.size
      ..$on.click = (() {
        showPanelAction();
      });
  }

  GlobalKey buttonKey = GlobalKey();

  @override
  GlobalKey get triggerWidgetKey => buttonKey;

  @override
  Widget get panelInside {
    assert(widget.style.panel != null);
    return widget.boxWrapper(
      Column(
        children: [
          // 主色选择区
          mainColorArea,
          mainColorAdjust,
          // alpha bar, 透明度选择区
          alphaBar,
          // prepare color bar 预设值选择区
          prepareColorBar,
          // color value and handler 色值与按钮区
          valueAndHandler,
        ],
      ),
      context,
      widget.style.panel,
    );
  }

  double get width {
    return widget.style.panel!.width! -
        widget.style.panel!.paddingLeft! -
        widget.style.panel!.paddingRight!;
  }

  Widget get mainColorArea {
    var height = 30.0;
    return SizedBox(
      height: height,
      width: width,
      child: CustomPaint(
        painter: MainColorPainter(height: height, width: width),
      ),
    );
  }

  Widget get mainColorAdjust {
    return SizedBox(
      height: 180,
      width: width,
      child: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.transparent],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              transform: GradientRotation(180 / width),
            ),
          ),
        ),
      ]),
      // child: CustomPaint(
      //   painter: MainColorAdjustPainter(
      //       height: 180, width: width, color: Color.fromARGB(255, 255, 0, 0)),
      // ),
    );
  }

  Widget get alphaBar => SizedBox(
        height: 30,
        width: width,
      );

  Widget get prepareColorBar => SizedBox(
        // height: 30,
        width: width,
      );

  Widget get valueAndHandler => SizedBox(
        // height: 30,
        width: width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: WInput()),
            WButton()
              ..$props.plain = true
              ..$slots.$ = '清空',
            WButton()
              ..$props.type = 'primary'
              ..$slots.$ = '确定'
              ..$on.click = (() => showLicensePage(context: context))
          ],
        ),
      );
}

class MainColorAdjustPainter extends CustomPainter {
  late double height;
  late double width;
  late Color color;

  late double lineWidth;
  late double lineHeight;

  MainColorAdjustPainter(
      {required this.height, required this.width, required this.color}) {
    lineWidth = width / 256;
    lineHeight = height / 256;
  }

  Color trans2color(double x, double y) {
    if (color.red == 0xFF) {
      var xRate = x / width;
      var yRate = 1 - y / height;
      return Color.fromRGBO(
        ((color.red) * yRate).toInt(),
        ((color.green) * xRate).toInt(),
        ((color.blue) * xRate * yRate).toInt(),
        1,
      );
    } /* else if (color.green == 0xFF) {
      return Color.fromRGBO(
        (0xFF - color.red) ~/ x,
        0xFF - y.toInt(),
        (0xFF - color.blue) ~/ x,
        1,
      );
    } else if (color.blue == 0xFF) {
      return Color.fromRGBO(
        (0xFF - color.red) ~/ x,
        (0xFF - color.green) ~/ x,
        0xFF - y.toInt(),
        1,
      );
    }*/
    return color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();

    for (double y = 0; y < height; y++) {
      for (double x = 0; x < width; x++) {
        p.color = trans2color(x, y);
        canvas.drawLine(
          Offset(x - 1, y),
          Offset(x + 1, y + 2),
          p,
        );
      }
    }
  }

  @override
  bool shouldRepaint(MainColorAdjustPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MainColorAdjustPainter oldDelegate) => false;
}

class MainColorPainter extends CustomPainter {
  late double height;
  late double width;

  MainColorPainter({required this.height, required this.width}) {
    lineWidth = width / (256 * 6);
  }

  late double lineWidth;

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    var r = 255;
    var g = 0;
    var b = 0;
    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 255; j++) {
        p.color = Color.fromRGBO(r, g, b, 1);
        canvas.drawLine(
          Offset((i * 256 + j) * lineWidth, 0),
          Offset((i * 256 + j) * lineWidth, height),
          p,
        );
        if (i == 0) {
          g++;
        } else if (i == 1) {
          r--;
        } else if (i == 2) {
          b++;
        } else if (i == 3) {
          g--;
        } else if (i == 4) {
          r++;
        } else if (i == 5) {
          b--;
        }
      }
    }
  }

  @override
  bool shouldRepaint(MainColorPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MainColorPainter oldDelegate) => false;
}

class WColorPicker extends WStatefulWidget<WColorPickerOn, WColorPickerProp,
    WColorPickerSlot, WColorPickerStyle> {
  WColorPicker({
    Key? key,
    WColorPickerOn? on,
    WColorPickerProp? props,
    WColorPickerSlot? slots,
    WColorPickerStyle? style,
  }) : super(key: key) {
    $on = on ?? WColorPickerOn();
    $props = props ?? WColorPickerProp();
    $slots = slots ?? WColorPickerSlot(null);
    $style = style ?? WColorPickerStyle();
    init();
  }

  @override
  State<WColorPicker> createState() => _WColorPickerState();
}

class WColorPickerOn extends BaseOn {
  /**
      change	当绑定值变化时触发	当前值
      active-change	面板中当前显示的颜色发生改变时触发	当前显示的颜色值
   */
  Function? change;
  Function? activeChange;
  WColorPickerOn({this.change, this.activeChange});
}

class WColorPickerProp extends FormFieldProp {
  late ValueNotifier<dynamic> value;
  late bool showAlpha;
  late String colorFormat;
  String? popperClass;
  List<Color>? predefine;

  WColorPickerProp({
    ValueNotifier<Color>? $model,
    dynamic model,
    bool? disabled,
    String? size,
    bool? showAlpha,
    String? colorFormat,
    this.popperClass,
    this.predefine,
  }) : super($model, model) {
    this.disabled = disabled ?? false;
    this.size = size ?? 'large';
    this.showAlpha = showAlpha ?? false;
    this.colorFormat = colorFormat ?? (this.showAlpha ? 'hex' : 'rgb');
  }
}

class WColorPickerSlot extends BaseSlot {
  WColorPickerSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
