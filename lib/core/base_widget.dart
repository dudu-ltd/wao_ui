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

  @protected
  @factory
  init() {
    setDefaultSlot();
  }

  handleSlot(Map<Type, Function(Widget)> s) {
    $slots.defaultSlot?.forEach((element) {
      var cbk = s[element.runtimeType];
      cbk?.call(element);
    });
  }

  setDefaultSlot() {
    if ($slots.defaultSlotBefore is Widget) {
      var w = slotToWidget($slots.defaultSlotBefore);
      $slots.defaultSlot = [if (w != null) w];
      // } else if (_defaultSlotBefore is String) {
      //   var w = slotToWidget(_defaultSlotBefore);
      //   defaultSlot = [if (w != null) w];
    } else if ($slots.defaultSlotBefore is List<Widget>) {
      var slots =
          List<Widget>.generate($slots.defaultSlotBefore.length, (index) {
        var w = slotToWidget($slots.defaultSlotBefore[index]);
        return w!;
      });
      $slots.defaultSlot = slots;
    } else {
      $slots.setDefaultSlotSub();
    }
  }

  Widget? slotToWidget(dynamic slot) {
    checkSlotType(slot);
    if (slot is Widget) {
      return slot;
    } else if (slot is String) {
      return Text(slot);
    }
    return null;
  }

  checkSlotType(slot) {
    var t = slot.runtimeType;
    if ($slots.allowSlotTypes.isNotEmpty &&
        !$slots.allowSlotTypes.contains(t)) {
      throw Exception(
          '\n$t 类型不被支持，当前仅支持 ${$slots.allowSlotTypes} 做为插槽内容。（$slot）\n(Slot `$t` is not be support in current version. Allow ${$slots.allowSlotTypes} being slot only.)');
    }
  }
}
