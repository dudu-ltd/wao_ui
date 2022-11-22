// ignore_for_file: avoid_init_to_null

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_style.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';

import 'utils/collect_util.dart';

class BaseWidget {}

abstract class WStatelessWidget<
    O extends BaseOn,
    P extends BaseProp,
    S extends BaseSlot,
    T extends BaseStyle> extends StatelessWidget with BaseMixins<O, P, S, T> {
  WStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    readStyle();
    beforeBuild(); // 部件生命周期埋点。
    Widget wWidget = wbuild(context);
    return useBox ? boxWrapper(wWidget, context) : wWidget;
  }

  beforeBuild() {}

  Widget wbuild(BuildContext context);
}

abstract class WStatefulWidget<
    O extends BaseOn,
    P extends BaseProp,
    S extends BaseSlot,
    T extends BaseStyle> extends StatefulWidget with BaseMixins<O, P, S, T> {
  WStatefulWidget({Key? key}) : super(key: key);
}

abstract class WState<T extends WStatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    widget.readStyle();
    beforeBuild(); // 部件生命周期埋点。
    // print(widget.style);
    Widget self = wbuild(context);
    return widget.useBox ? widget.boxWrapper(self, context) : self;
  }

  beforeBuild() {}

  updateView([Function()? fn]) {
    print('-------------- update view ----------- $runtimeType $hashCode');
    setState(fn ?? () {});
  }

  @override
  void deactivate() {
    super.deactivate();
    if (kDebugMode) {
      print('-----deactivate----$runtimeType $hashCode');
    }
  }

  @override
  dispose() {
    super.dispose();
    if (kDebugMode) {
      print('-----dispose----$runtimeType $hashCode');
    }
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    if (kDebugMode) {
      print('-----setState----$runtimeType $hashCode');
    }
  }

  @override
  void initState() {
    if (kDebugMode) {
      print('-----initState----$runtimeType $hashCode');
    }
    super.initState();
  }

  Widget wbuild(BuildContext context);
}

mixin BaseMixins<O extends BaseOn, P extends BaseProp, S extends BaseSlot,
    T extends BaseStyle> on Widget implements BaseWidget {
  late final O $on;
  late final P $props;
  late final S $slots;
  late final T $style;
  // late final BaseStyle style = BaseStyle<BaseMixins>();
  late T style;

  List<Widget>? $defaultSlot;

  List<String> get selector => [
        ...(CfgGlobal.selectors[runtimeType.toString().trim()]?.call(this) ??
            []),
        ...$style.clazz
      ];

  readStyle() {
    var _selector = selector;

    _selector.addAll($style.clazz);

    List<BaseStyle?> stateStyles =
        findByListKey<BaseStyle?>(CfgGlobal.css, _selector);

    for (var stateStyle in stateStyles) {
      style.merge(stateStyle, force: true);
    }
    style.merge($style, force: true);
  }

  boxWrapper(Widget willBeWrap, BuildContext context, [BaseStyle? style]) {
    style = style ?? this.style;
    // print(style);
    return Offstage(
      offstage: !(style.display ?? true),
      child: Container(
        alignment: style.textAlign ?? Alignment.centerLeft,
        padding: style.padding,
        margin: style.margin,
        width: style.width,
        height: style.height,
        clipBehavior: style.overflow ?? Clip.none,
        // constraints: BoxConstraints(
        //   maxHeight: style.maxHeight ?? double.infinity,
        //   minHeight: style.minHeight ?? 0.0,
        //   maxWidth: style.maxWidth ?? double.infinity,
        //   minWidth: style.minWidth ?? 0.0,
        // ),
        decoration: BoxDecoration(
            color: style.backgroundColor,
            borderRadius: style.borderRadius,
            border: style.border,
            image: style.backgroundImage,
            boxShadow: style.boxShadow,
            gradient: style.gradient,
            backgroundBlendMode: style.backgroundBlendMode),
        child: willBeWrap,
      ),
    );
  }

  bool get useBox => true;

  init() {
    // print('$runtimeType be init');
    style = $style.newInstance() as T;
  }

  Widget wrap<E extends BaseStyle>(Widget content, E style) {
    return Container(
      child: content,
    );
  }

  List<Widget> get defaultSlot {
    if ($defaultSlot != null) {
      return $defaultSlot!;
    }
    if ($slots.$ is List) {
      var slots = <Widget>[];
      for (var i = 0; i < $defaultSlotBeforeLength; i++) {
        var w = slotToWidget($slots.$[i], i);
        if (w != null) {
          slots.add(w);
        }
      }
      return slots;
    } else {
      var w = slotToWidget($slots.$, 0);
      return [if (w != null) w];
    }
  }

  List<SlotTranslator> get translators {
    List<SlotTranslator> transtators = [
      ...slotTranslatorsDefault,
      ...slotTranslatorsCustom,
    ];
    return transtators;
  }

  ///
  Widget? slotToWidget(dynamic slot, int index) {
    var newWidget = null;
    var t = slot.runtimeType;
    for (var translator in translators) {
      // print('slot: $slot，type: $t，Type: ${translator.type}');
      if (t == translator.type ||
          instanceof(t, translator.type) ||
          (translator.typeIs?.call(slot) ?? false)) {
        newWidget =
            translator.fn.call(slot, index, this, $defaultSlotBeforeLength);
        break;
      }
    }
    if (slot is Widget) {
      newWidget = slot;
    }
    if (newWidget != null && newWidget is! Widget) {
      var allowSlotTypes = translators.map((element) => element.type);
      throw Exception(
          '\n$t 类型不被支持，当前仅支持 $allowSlotTypes 做为插槽内容。（$slot）\n(Slot `$t` is not be support in current version. Allow $allowSlotTypes being slot only.)');
    }
    return newWidget;
  }

  Text strToText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: style.color,
        fontSize: style.fontSize,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  ///
  List<SlotTranslator> get slotTranslatorsDefault {
    return [
      SlotTranslator(
        String,
        (slot, i, component, len) {
          slot as String;
          if (slot.contains('\n')) {
            var str = slot.split('\n');
            return Column(
              mainAxisSize: MainAxisSize.min,
              children:
                  List.generate(str.length, (index) => strToText(str[index])),
            );
          }
          return strToText(slot);
        },
      ),
      SlotTranslator(
        Icon,
        (slot, i, component, len) {
          return IconTheme(
            data: IconThemeData(color: style.color, size: style.fontSize),
            child: slot,
          );
        },
      ),
    ];
  }

  List<SlotTranslator> get slotTranslatorsCustom {
    return <SlotTranslator>[];
  }

  Widget get $first {
    return defaultSlot.isNotEmpty ? defaultSlot[0] : Container();
  }

  bool get $hasDefalutSlot {
    return defaultSlot.isNotEmpty;
  }

  Widget get $col {
    var d = defaultSlot;
    var i = d.length;
    return Column(
      key: $childrenKey,
      crossAxisAlignment: $crossAxisAlign,
      mainAxisSize: $mainAxisSize,
      children: List.generate(
          i,
          (index) => Container(
                child: d[index],
              )),
    );
  }

  Widget get $row {
    return Row(
      key: $childrenKey,
      mainAxisAlignment: $mainAxisAlign,
      mainAxisSize: $mainAxisSize,
      children: defaultSlot,
    );
  }

  GlobalKey? get $childrenKey {
    return null;
  }

  MainAxisAlignment $mainAxisAlign = MainAxisAlignment.start;

  CrossAxisAlignment $crossAxisAlign = CrossAxisAlignment.start;

  MainAxisSize $mainAxisSize = MainAxisSize.min;

  instanceof(t, type) {
    return type == Map &&
            t.toString().startsWith('_InternalImmutableLinkedHashMap') ||
        t.toString().startsWith('_InternalLinkedHashMap');
  }

  int get $defaultSlotBeforeLength {
    return $slots.$ is List ? $slots.$.length : 1;
  }
}

class SlotTranslator {
  Type? type;
  late Widget Function(dynamic, int, dynamic, int) fn;
  bool Function(dynamic)? typeIs;
  SlotTranslator(this.type, this.fn, [this.typeIs]);
  @override
  String toString() {
    return 'type : $type, fn: $fn';
  }
}
