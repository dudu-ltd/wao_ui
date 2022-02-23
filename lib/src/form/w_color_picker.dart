import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WColorPicker extends StatelessWidget
    with
        BaseMixins<WColorPickerOn, WColorPickerProp, WColorPickerSlot,
            WColorPickerStyle> {
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
  Widget build(BuildContext context) {
    return Container();
  }
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

class WColorPickerProp extends BaseProp {
  late ValueNotifier<dynamic> value;
  late bool disabled;
  String? size;
  late bool showAlpha;
  late String colorFormat;
  String? popperClass;
  List<Color>? predefine;

  WColorPickerProp({
    ValueNotifier<Color>? value,
    bool? disabled,
    String? size,
    bool? showAlpha,
    String? colorFormat,
    String? popperClass,
    List<Color>? predefine,
  }) {
    this.value = value ?? ValueNotifier(null);
    this.disabled = disabled ?? false;
    this.size = size;
    this.showAlpha = showAlpha ?? false;
    this.colorFormat = colorFormat ?? (this.showAlpha ? 'hex' : 'rgb');
    this.popperClass = popperClass;
    this.predefine = predefine;
  }
}

class WColorPickerSlot extends BaseSlot {
  WColorPickerSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
