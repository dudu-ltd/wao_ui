import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_style.dart';

mixin BaseMixins<O extends BaseOn, P extends BaseProp, S extends BaseSlot,
    T extends BaseStyle> on Widget {
  late final O $on;
  late final P $props;
  late final S $slots;
  late final T $style;
  List<Widget>? $defaultSlot;

  init() {
    handleSlot(slotTypeHandles());
  }

  handleSlot(Map<Type, Function(Widget)> s) {
    if (s.isNotEmpty) {
      for (var element in defaultSlot) {
        var cbk = s[element.runtimeType];
        cbk?.call(element);
      }
    }
  }

  Map<Type, Function(Widget)> slotTypeHandles() {
    return {};
  }

  List<Widget> get defaultSlot {
    if ($defaultSlot != null) {
      return $defaultSlot!;
    }
    print($slots.defaultSlotBefore);
    if ($slots.defaultSlotBefore is Widget) {
      var w = slotToWidget($slots.defaultSlotBefore);
      return [if (w != null) w];
    } else if ($slots.defaultSlotBefore is List<Widget>) {
      var slots =
          List<Widget>.generate($slots.defaultSlotBefore.length, (index) {
        var w = slotToWidget($slots.defaultSlotBefore[index]);
        return w!;
      });
      return slots;
    } else {
      return setDefaultSlotSub();
    }
  }

  List<Widget> setDefaultSlotSub() {
    return [];
  }

  Widget? slotToWidget(dynamic slot) {
    checkSlotType(slot);
    if (slot is Widget) {
      return slot;
    } else if (slot is String) {
      return Text(slot);
    }
    return slot;
  }

  checkSlotType(slot) {
    var t = slot.runtimeType;
    if ($slots.allowSlotTypes.isNotEmpty &&
        !$slots.allowSlotTypes.contains(t)) {
      throw Exception(
          '\n$t 类型不被支持，当前仅支持 ${$slots.allowSlotTypes} 做为插槽内容。（$slot）\n(Slot `$t` is not be support in current version. Allow ${$slots.allowSlotTypes} being slot only.)');
    }
  }

  Widget get first {
    return defaultSlot[0];
  }

  Widget get col {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: defaultSlot,
    );
  }

  Widget get row {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: defaultSlot,
    );
  }
}
