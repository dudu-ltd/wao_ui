import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_style.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';

import 'extension/theme_data_extension.dart';
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
    // Widget el = ;
    afterBuild(wWidget, context);
    return wWidget;
  }

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
    widget.beforeBuild(); // 部件生命周期埋点。
    Widget self = wbuild(context);

    return widget.afterBuild(self, context);
  }

  Widget wbuild(BuildContext context);
}

mixin BaseMixins<O extends BaseOn, P extends BaseProp, S extends BaseSlot,
    T extends BaseStyle> on Widget implements BaseWidget {
  late final O $on;
  late final P $props;
  late final S $slots;
  late final T? $style;

  @protected
  late final BaseStyle style = BaseStyle<BaseMixins>();

  List<Widget>? $defaultSlot;

  readStyle() {
    var selector =
        CfgGlobal.selectors[runtimeType.toString().trim()]?.call(this) ?? [];

    List<BaseStyle?> styles =
        findByListKey<BaseStyle?>(CfgGlobal.css, selector);

    Map<List<List<String>>, BaseStyle> customStyle = {};
    for (var element in style.clazz.entries) {
      customStyle[[element.key]] = element.value;
    }

    List<BaseStyle?> customStyles = findByListKey(customStyle, selector);
    styles.addAll(customStyles);
    for (var style in styles) {
      this.style.merge(style, force: true);
    }
  }

  beforeBuild() {}

  afterBuild(Widget willBeWrap, BuildContext context) {
    return SizedBox(
      width: style.width,
      height: style.height,
      child: willBeWrap,
    );
    // return willBeWrap;
  }

  init() {}

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
      ...slotTranslatorsCustom,
      ...slotTranslatorsDefault,
    ];
    return transtators;
  }

  ///
  Widget? slotToWidget(dynamic slot, int index) {
    var newWidget = null;
    var t = slot.runtimeType;
    for (var translator in translators) {
      if (t == translator.type || instanceof(t, translator.type)) {
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

  ///
  List<SlotTranslator> get slotTranslatorsDefault {
    return [
      SlotTranslator(
        String,
        (slot, i, component, len) {
          return Text(
            slot,
            overflow: TextOverflow.ellipsis,
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

  MainAxisAlignment get $mainAxisAlign {
    return MainAxisAlignment.start;
  }

  CrossAxisAlignment get $crossAxisAlign {
    return CrossAxisAlignment.start;
  }

  MainAxisSize get $mainAxisSize {
    return MainAxisSize.min;
  }

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
  late Type type;
  late Widget Function(dynamic, int, dynamic, int) fn;
  SlotTranslator(this.type, this.fn);
  @override
  String toString() {
    return 'type : $type, fn: $fn';
  }
}
