import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

import 'w_input.dart';

// TODO 添加对键盘上下键的监听
class WInputNumber extends WStatelessWidget<WInputNumberOn, WInputNumberProp,
    WInputNumberSlot, WInputNumberStyle> {
  WInputNumber({
    Key? key,
    WInputNumberOn? on,
    WInputNumberProp? props,
    WInputNumberSlot? slots,
    WInputNumberStyle? style,
  }) : super(key: key) {
    $on = on ?? WInputNumberOn();
    $props = props ?? WInputNumberProp();
    $slots = slots ?? WInputNumberSlot(null);
    $style = style ?? WInputNumberStyle();
    init();
  }

  @override
  Widget wbuild(BuildContext context) {
    return WInput(
      props: $props,
      slots: WInputSlot(
        null,
        prefix: controls[0],
        suffix: controls[1],
      ),
    );
  }

  List<Widget?> get controls {
    return $props.controllerIsRight
        ? positionRightControls
        : positionDefaultControls;
  }

  List<Widget> get positionDefaultControls {
    return [
      minusWrapper(
        _fitHeightWrapper(const Icon(Icons.horizontal_rule_rounded)),
      )!,
      addWrapper(
        _fitHeightWrapper(const Icon(Icons.add_rounded)),
      )!,
    ];
  }

  Widget _marginWapper(Widget? child) {
    return marginWrapper(child!, const EdgeInsets.all(2));
  }

  List<Widget?> get positionRightControls {
    return [
      null,
      _fitHeightWrapper(
        Column(
          children: [
            Expanded(child: addWrapper(const Icon(Icons.expand_less_rounded))!),
            Divider(color: Colors.grey.shade300, height: 1),
            Expanded(
                child: minusWrapper(const Icon(Icons.expand_more_rounded))!),
          ],
        ),
      )
    ];
  }

  Widget? _fitHeightWrapper(Widget? child, {aspectRatio = 1.0}) {
    if (child == null) return null;
    return _marginWapper(
      colorWrapper(
        fitHeightWrapper(child, aspectRatio: aspectRatio),
        ColorUtil.hexToColor('#F5F5F5'),
        true,
      ),
    );
  }

  minusFn() {
    var newVal = ($props.model - $props.step);
    if ($props.min != null && newVal < $props.min!) return;
    $props.model = newVal;
  }

  addFn() {
    var newVal = ($props.model + $props.step);
    if ($props.max != null && newVal > $props.max!) return;
    $props.model = newVal;
  }

  Widget? addWrapper(Widget? child) {
    return handleWrapper(child, addFn);
  }

  Widget? minusWrapper(Widget? child) {
    return handleWrapper(child, minusFn);
  }

  Widget? handleWrapper(Widget? child, Function() onTap, {need = true}) {
    if (child != null && need) {
      var handle = InkWell(
        child: child,
        onTap: onTap,
      );
      return handle;
    }
    return null;
  }

  /**
      focus	使 input 获取焦点	-
      select	选中 input 中的文字	—
   */
}

class WInputNumberOn extends BaseOn {
  /// change 绑定值被改变时触发	currentValue, oldValue
  Function? change;

  /// blur 在组件 Input 失去焦点时触发	(event: Event)
  Function? blur;

  /// focus	在组件 Input 获得焦点时触发	(event: Event)
  Function? focus;

  WInputNumberOn({this.change, this.blur, this.focus});
}

class WInputNumberProp extends WInputProp {
  late bool stepStrictly;
  late int precision;
  late bool controls;
  String? controlsPosition;
  WInputNumberProp({
    num? model,
    num? min,
    num? max,
    num? step,
    bool? stepStrictly,
    int? precision,
    String? size,
    bool? disabled,
    bool? controls,
    this.controlsPosition,
    String? name,
    String? label,
    String? placeholder,
  }) : super(
          min: min,
          max: max,
          step: step,
          size: size,
          disabled: disabled,
          name: name,
          label: label,
          placeholder: placeholder,
          $textAlign: TextAlign.center,
        ) {
    this.model = model ?? 0;
    this.step = step ?? 1;
    this.stepStrictly = stepStrictly ?? false;
    this.precision = precision ?? 0;
    this.controls = controls ?? true;
    this.name = name;
    this.label = label;

    encode = ($model) {
      return $model.value?.toStringAsFixed(this.precision);
    };
    decode = (text) => double.parse(text);
  }

  bool get controllerIsRight {
    return controlsPosition == 'right';
  }
}

class WInputNumberSlot extends BaseSlot {
  WInputNumberSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
