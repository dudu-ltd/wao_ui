import 'package:flutter/material.dart';

import '../wao_ui.dart';

element() {
  CfgGlobal.primaryColor = const MaterialColor(
    0xFF409eff,
    <int, Color>{
      50: Color(0xFFecf5ff),
      100: Color(0xFFd9ecff),
      200: Color(0xFFc6e2ff),
      300: Color(0xFFb3d8ff),
      400: Color(0xFFa0cfff),
      500: Color(0xFF8cc5ff),
      600: Color(0xFF79bbff), //
      700: Color(0xFF66b1ff),
      800: Color(0xFF409EFF),
      900: Color(0xFF3a8ee6),
    },
  );

  CfgGlobal.successColor = const MaterialColor(
    0xFF85ce61,
    <int, Color>{
      50: Color(0xFFf0f9eb),
      100: Color(0xFFd9ecff),
      200: Color(0xFFc6e2ff),
      300: Color(0xFFc2e7b0),
      400: Color(0xFFa0cfff),
      500: Color(0xFF8cc5ff),
      600: Color(0xFF79bbff),
      700: Color(0xFF66b1ff),
      800: Color(0xFF85ce61),
      900: Color(0xFF67c23a),
    },
  );
  CfgGlobal.warningColor = const MaterialColor(
    0xFFebb563,
    <int, Color>{
      50: Color(0xFFfdf6ec),
      100: Color(0xFFd9ecff),
      200: Color(0xFFc6e2ff),
      300: Color(0xFFf5dab1),
      400: Color(0xFFa0cfff),
      500: Color(0xFF8cc5ff),
      600: Color(0xFF79bbff),
      700: Color(0xFF66b1ff),
      800: Color(0xFFebb563),
      900: Color(0xFFe6a23c),
    },
  );
  CfgGlobal.dangerColor = const MaterialColor(
    0xFFf78989,
    <int, Color>{
      50: Color(0xFFfef0f0),
      100: Color(0xFFd9ecff),
      200: Color(0xFFc6e2ff),
      300: Color(0xFFfbc4c4),
      400: Color(0xFFa0cfff),
      500: Color(0xFF8cc5ff),
      600: Color(0xFF79bbff),
      700: Color(0xFF66b1ff),
      800: Color(0xFFf78989),
      900: Color(0xFFf56c6c),
    },
  );
  CfgGlobal.infoColor = const MaterialColor(
    0xFF909399,
    <int, Color>{
      50: Color(0xFFf4f4f5),
      100: Color(0xFFd9ecff),
      200: Color(0xFFc6e2ff),
      300: Color(0xFFd3d4d6),
      400: Color(0xFFa0cfff),
      500: Color(0xFF8cc5ff),
      600: Color(0xFF79bbff),
      700: Color(0xFF66b1ff),
      800: Color(0xFF909399),
      900: Color(0xFF909399),
    },
  );

  // .el-button
  cfgGlobal.button = WButtonStyle();
  cfgGlobal.button
    ..cursor = SystemMouseCursors.click
    ..backgroundColor = Colors.white
    ..border = const Border.fromBorderSide(BorderSide(color: Color(0xFFdcdfe6)))
    ..color = const Color(0xFF606266)
    ..textAlign = Alignment.center
    ..margin = EdgeInsets.zero
    ..fontWeight = FontWeight.w500
    ..padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 20)
    ..fontSize = 14
    ..radius = const Radius.circular(4);

  cfgGlobal.button.primary = (WButton btn) {
    if (!btn.$props.typeIsPrimary) return;
    btn.style
      ..color = btn.$style?.color ?? Colors.white
      ..backgroundColor =
          btn.$style?.backgroundColor ?? CfgGlobal.primaryColor.shade800
      ..borderColor =
          btn.$style?.borderColor ?? CfgGlobal.primaryColor.shade800;
  };

  cfgGlobal.button.success = (WButton btn) {
    if (!btn.$props.typeIsSuccess) return;
    btn.style
      ..color = btn.$style?.color ?? Colors.white
      ..borderColor = btn.$style?.borderColor ?? const Color(0xFF85ce61)
      ..backgroundColor =
          btn.$style?.backgroundColor ?? const Color(0xFF85ce61);
  };

  cfgGlobal.button.warning = (WButton btn) {
    if (!btn.$props.typeIsWarning) return;
    btn.style
      ..color = btn.$style?.color ?? Colors.white
      ..borderColor = btn.$style?.borderColor ?? const Color(0xFFebb563)
      ..backgroundColor =
          btn.$style?.backgroundColor ?? const Color(0xFFebb563);
  };

  cfgGlobal.button.danger = (WButton btn) {
    if (!btn.$props.typeIsDanger) return;
    btn.style
      ..color = btn.$style?.color ?? Colors.white
      ..borderColor = btn.$style?.borderColor ?? const Color(0xFFf78989)
      ..backgroundColor =
          btn.$style?.backgroundColor ?? const Color(0xFFf78989);
  };

  cfgGlobal.button.info = (WButton btn) {
    if (!btn.$props.typeIsInfo) return;
    btn.style
      ..color = btn.$style?.color ?? Colors.white
      ..borderColor = btn.$style?.borderColor ?? const Color(0xFF909399)
      ..backgroundColor =
          btn.$style?.backgroundColor ?? const Color(0xFF909399);
  };

  cfgGlobal.button.text = (WButton btn) {
    if (!btn.$props.typeIsText) return;
    btn.style
      ..borderColor = btn.$style?.borderColor ?? Colors.transparent
      ..color = btn.$style?.color ?? CfgGlobal.primaryColor.shade800
      ..backgroundColor = btn.$style?.backgroundColor ?? Colors.transparent
      ..padding = EdgeInsets.fromLTRB(
          0, btn.style.padding!.top, 0, btn.style.padding!.bottom);
  };

  cfgGlobal.button.mini = (WButton btn) {
    if (!btn.$props.sizeIsMini) return;
    btn.style
      ..padding = btn.$style?.padding ??
          const EdgeInsets.symmetric(vertical: 7, horizontal: 15)
      ..fontSize = btn.$style?.fontSize ?? 12
      ..radius = btn.$style?.radius ?? const Radius.circular(3);
  };

  cfgGlobal.button.small = (WButton btn) {
    print(btn.$props.size);
    if (btn.$props.sizeIsSmall) {
      btn.style
        ..padding = btn.$style?.padding ??
            const EdgeInsets.symmetric(vertical: 9, horizontal: 15)
        ..fontSize = btn.$style?.fontSize ?? 12
        ..radius = btn.$style?.radius ?? const Radius.circular(3);
    }
  };

  cfgGlobal.button.medium = (WButton btn) {
    if (!btn.$props.sizeIsMedium) return;
    btn.style
      ..padding = btn.$style?.padding ??
          const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
      ..fontSize = btn.$style?.fontSize ?? 14
      ..radius = btn.$style?.radius ?? const Radius.circular(4);

    if (btn.$props.round) {
      btn.style
        ..padding = btn.$style?.padding ??
            const EdgeInsets.symmetric(vertical: 12, horizontal: 23)
        ..radius = const Radius.circular(20);
    }
  };

  cfgGlobal.button.large = (WButton btn) {};

  cfgGlobal.button.isRound = (WButton btn) {
    if (!btn.$props.round) return;
    btn.style
      ..radius = btn.$style?.radius ?? const Radius.circular(20)
      ..padding = btn.$style?.padding ??
          const EdgeInsets.symmetric(vertical: 12, horizontal: 23);
  };

  cfgGlobal.button.isCircle = (WButton btn) {
    if (cfgGlobal.button.padding == null &&
        btn.$style?.padding == null &&
        btn.$props.circle) {
      btn.$style?.padding = EdgeInsets.all(btn.style.padding!.left);
    }
  };

  cfgGlobal.button.isDisabled = (WButton btn) {
    if (btn.$props.disabled) {
      btn.style.cursor = btn.$style?.cursor ?? SystemMouseCursors.forbidden;
    }
  };
  cfgGlobal.button.isPlain = (WButton btn) {
    if (!btn.$props.plain) return;
    MaterialColor color = CfgGlobal.color(btn.$props.type);
    btn.style
      ..color = btn.$style?.color ?? color.shade800
      ..backgroundColor = btn.$style?.backgroundColor ?? color.shade50
      ..borderColor = color.shade300;
  };

  cfgGlobal.button.hover = (WButton btn) {
    if (!btn.isHover || btn.$props.disabled) return;
    MaterialColor color = CfgGlobal.color(btn.$props.type);
    btn.style
      ..color = btn.$style?.color ?? const Color(0xFFFFFFFF)
      ..backgroundColor = btn.$style?.backgroundColor ?? color.shade700
      ..borderColor = color.shade700;
  };
  cfgGlobal.button.active = (WButton btn) {};
}
