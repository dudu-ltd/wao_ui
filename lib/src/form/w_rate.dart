import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/wao_ui.dart';

class WRate extends StatelessWidget
    implements BaseWidget<WRateOn, WRateProp, WRateSlot, WRateStyle> {
  @override
  late final WRateOn $on;
  @override
  late final WRateProp $props;
  @override
  late final WRateSlot $slots;
  @override
  late WRateStyle $style;

  WRate({
    Key? key,
    WRateOn? on,
    WRateProp? props,
    WRateSlot? slots,
    WRateStyle? style,
  }) : super(key: key) {
    $on = on ?? WRateOn();
    $props = props ?? WRateProp();
    $slots = slots ?? WRateSlot(null);
    $style = style ?? WRateStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WRateOn extends BaseOn {
  Function? change;
  WRateOn({this.change});
}

class WRateProp extends BaseProp {
  late ValueNotifier<num> value;
  late num max;
  late bool disabled;
  late bool allowHalf;
  late num lowThreshold;
  late num highThreshold;
  late Object colors;
  late Color voidColor;
  late Color disabledVoidColor;
  late Object iconClasses;
  late IconData voidIconClass;
  late IconData disabledVoidIconClass;
  late bool showText;
  late bool showScore;
  late Color textColor;
  late List<String> texts;
  late String scoreTemplate;

  WRateProp({
    ValueNotifier<num>? value,
    num? max,
    bool? disabled,
    bool? allowHalf,
    num? lowThreshold,
    num? highThreshold,
    Object? colors,
    String? voidColor,
    String? disabledVoidColor,
    Object? iconClasses,
    IconData? voidIconClass,
    IconData? disabledVoidIconClass,
    bool? showText,
    bool? showScore,
    String? textColor,
    List<String>? texts,
    String? scoreTemplate,
  }) {
    this.value = value ?? ValueNotifier<num>(0);
    this.max = max ?? 5;
    this.disabled = disabled ?? false;
    this.allowHalf = allowHalf ?? false;
    this.lowThreshold = lowThreshold ?? 2;
    this.highThreshold = highThreshold ?? 4;
    this.colors =
        colors ?? ['#F7BA2A', '#F7BA2A', '#F7BA2A']; // TODO 另建变量用来转换成 Color数组
    this.voidColor = voidColor != null
        ? ColorUtil.hexToColor(voidColor)
        : ColorUtil.hexToColor('#C6D1DE');
    this.disabledVoidColor = disabledVoidColor != null
        ? ColorUtil.hexToColor(disabledVoidColor)
        : ColorUtil.hexToColor('#EFF2F7');
    ;
    this.iconClasses = iconClasses ??
        [
          'el-icon-star-on',
          'el-icon-star-on',
          'el-icon-star-on'
        ]; // TODO 另建变量用来转换成 IconData 数组
    this.voidIconClass = voidIconClass ?? Icons.star_outline;
    this.disabledVoidIconClass = disabledVoidIconClass ?? Icons.star_rounded;
    this.showText = showText ?? false;
    this.showScore = showScore ?? false;
    this.textColor = textColor != null
        ? ColorUtil.hexToColor(textColor)
        : ColorUtil.hexToColor('#1F2D3D');
    ;
    this.texts = texts ?? ['极差', '失望', '一般', '满意', '惊喜'];
    this.scoreTemplate = scoreTemplate ?? '\${value}';
  }
}

class WRateSlot extends BaseSlot {
  WRateSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
