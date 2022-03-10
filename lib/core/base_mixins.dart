import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_style.dart';

class BaseWidget {}

mixin BaseMixins<O extends BaseOn, P extends BaseProp, S extends BaseSlot,
    T extends BaseStyle> on Widget implements BaseWidget {
  late final O $on;
  late final P $props;
  late final S $slots;
  late final T $style;
  List<Widget>? $defaultSlot;

  init() {}

  List<Widget> get defaultSlot {
    if ($defaultSlot != null) {
      return $defaultSlot!;
    }
    if ($slots.defaultSlotBefore is List) {
      var slots = <Widget>[];
      for (var i = 0; i < $slots.defaultSlotBefore.length; i++) {
        var w = slotToWidget($slots.defaultSlotBefore[i], i);
        if (w != null) {
          slots.add(w);
        }
      }
      return slots;
    } else {
      var w = slotToWidget($slots.defaultSlotBefore, 0);
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
        newWidget = translator.fn.call(slot, 0, this);
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
        (slot, i, component) {
          return Text(slot);
        },
      ),
    ];
  }

  List<SlotTranslator> get slotTranslatorsCustom {
    return <SlotTranslator>[];
  }

  ///
  // checkSlotType(slot) {
  //   var t = slot.runtimeType;
  //   if ($slots.allowSlotTypes.isNotEmpty &&
  //       !$slots.allowSlotTypes.contains(t)) {
  //     throw Exception(
  //         '\n$t 类型不被支持，当前仅支持 ${$slots.allowSlotTypes} 做为插槽内容。（$slot）\n(Slot `$t` is not be support in current version. Allow ${$slots.allowSlotTypes} being slot only.)');
  //   }
  // }

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
        t.toString().startsWith('_InternalImmutableLinkedHashMap');
  }
}

class SlotTranslator {
  late Type type;
  late Widget Function(dynamic, int, dynamic) fn;
  SlotTranslator(this.type, this.fn);
  @override
  String toString() {
    return 'type : $type, fn: $fn';
  }
}
