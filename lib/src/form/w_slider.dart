import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/wao_ui.dart';

import '../../core/base_form_prop.dart';
import '../../core/utils/layout_util.dart';

class WSlider extends StatefulWidget
    with BaseMixins<WSliderOn, WSliderProp, WSliderSlot, WSliderStyle> {
  WSlider({
    Key? key,
    WSliderOn? on,
    WSliderProp? props,
    WSliderSlot? slots,
    WSliderStyle? style,
  }) : super(key: key) {
    $on = on ?? WSliderOn();
    $props = props ?? WSliderProp();
    $slots = slots ?? WSliderSlot(null);
    $style = style ?? WSliderStyle();
    init();
  }

  @override
  State<WSlider> createState() => _WSliderState();
}

class _WSliderState extends State<WSlider> with TickerProviderStateMixin {
  late AnimationController minController;
  late AnimationController maxController;
  late Animation<double>? minValueRadius = null;
  late Animation<double>? maxValueRadius = null;
  double _contentWidth = 0;

  late dynamic _tempValue;

  @override
  void initState() {
    super.initState();
    setTempValue(null);
    minController =
        AnimationController(duration: CfgGlobal.duration, vsync: this);
    maxController =
        AnimationController(duration: CfgGlobal.duration, vsync: this);
    var timer = Timer(
      const Duration(microseconds: 1),
      () {
        var rect = getPosition(context);
        _contentWidth = rect.width - 2 * valueRadiusOuter;
        minValueRadius = Tween(begin: 1.0, end: 1.2).animate(minController)
          ..addListener(() {
            setState(() {});
          });

        maxValueRadius = Tween(begin: 1.0, end: 1.2).animate(maxController)
          ..addListener(() {
            setState(() {});
          });

        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(valueRadiusOuter, 0, valueRadiusOuter,
          widget.$props.marks.isNotEmpty ? valueRadiusOuter : 0),
      child: SizedBox(
        height: valueRadiusOuter * 2 * 1.2,
        child: waoSlider,
      ),
    );
  }

  Widget get waoSlider {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.centerStart,
      children: [
        ruler,
        if (widget.$props.showStops) ...stepCircles,
        valueRange,
        ...marks,
        ...marksText,
        ...handlers,
      ],
    );
  }

  Widget get ruler {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: inactiveColor,
        borderRadius: BorderRadius.all(
          Radius.circular(height),
        ),
      ),
    );
  }

  Widget get valueRange {
    return Positioned(
      left: axis(minVal),
      child: Container(
        height: height,
        width: axis(maxVal - minVal),
        decoration: BoxDecoration(
          color: activeColor,
          borderRadius: BorderRadius.all(
            Radius.circular(height),
          ),
        ),
      ),
    );
  }

  List<Widget> get marks {
    var result = <Widget>[];
    widget.$props.marks.forEach((key, value) {
      var circle = Positioned(
        left: axis(key) - height / 2,
        child: Container(
          height: height,
          width: height,
          child: const ClipOval(
            child: ColoredBox(
              color: Colors.white,
            ),
          ),
        ),
      );

      result.add(circle);
    });
    return result;
  }

  List<Widget> get marksText {
    List<Widget> result = [];
    widget.$props.marks.forEach((key, value) {
      var txt =
          value is String ? value : (value as SliderMark).markFormat!.call(key);
      var p = Positioned(
        left: axis(key) - (txt.length / 2) * .58 * 14,
        top: valueRadiusOuter * 2 * 1.2,
        child: Text(txt, style: value is SliderMark ? value.textStyle : null),
      );
      result.add(p);
    });
    return result;
  }

  List<Widget> get handlers {
    return [
      Listener(
        onPointerUp: rulerOnDrag,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(height),
            ),
          ),
        ),
      ),
      if (widget.$props.range)
        valueHander(minVal, minValueRadius, minController, initValueIndex: 0),
      valueHander(maxVal, maxValueRadius, maxController, initValueIndex: 1),
    ];
  }

  late List<double> stableValues = [];

  Widget valueHander(
    double val,
    Animation? valueRadius,
    AnimationController controller, {
    initValueIndex = 0,
  }) {
    return Positioned(
      left: axis(val) -
          valueRadiusOuter * (valueRadius == null ? 0 : valueRadius.value),
      child: GestureDetector(
        onHorizontalDragStart: setStableValue,
        onHorizontalDragUpdate: (e) => onDrag(e, initValueIndex),
        onHorizontalDragEnd: setTempValue,
        child: MouseRegion(
          onEnter: (e) {
            controller.forward();
          },
          onExit: (e) => controller.reverse(),
          child: Container(
            width: valueRadiusOuter *
                2 *
                (valueRadius != null ? valueRadius.value : 0),
            height: valueRadiusOuter *
                2 *
                (valueRadius != null ? valueRadius.value : 0),
            decoration: BoxDecoration(
              border: Border.all(
                  color: activeColor,
                  width: valueRadiusOuter - valueRadiusInner),
              borderRadius: BorderRadius.circular(valueRadiusOuter *
                  (valueRadius != null ? valueRadius.value : 0)),
            ),
            child: Tooltip(
              message: '$val',
              triggerMode: TooltipTriggerMode.longPress,
              verticalOffset: -valueRadiusOuter * 4,
              child: ClipOval(
                child: ColoredBox(color: thumbColor),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> get stepCircles {
    List<Widget> circles = [];
    for (var cursor in widget.$props._stops) {
      var circle = Positioned(
        left: axis(cursor) - height / 2,
        child: SizedBox(
          height: height,
          width: height,
          child: const ClipOval(
            child: ColoredBox(
              color: Colors.white,
            ),
          ),
        ),
      );

      circles.add(circle);
    }
    return circles;
  }

  rulerOnDrag(e) {
    var hoverValue = axisValue(e.localPosition.dx);
    if (!widget.$props.range) {
      widget.$props.value = stepNum(hoverValue, widget.$props.value);
    } else {
      var closeToMin =
          (hoverValue - minVal).abs() - (hoverValue - maxVal).abs() < 0;
      if (closeToMin) {
        widget.$props.value[0] = stepNum(hoverValue, minVal);
      } else {
        widget.$props.value[1] = stepNum(hoverValue, maxVal);
      }
    }
    setState(() {});
  }

  setStableValue(e) {
    if (widget.$props.range) stableValues = [...widget.$props.value];
  }

  onDrag(details, initValueIndex) {
    if (!widget.$props.range) {
      _tempValue += axisValue(details.delta.dx);
      if (_tempValue >= widget.$props.min && _tempValue <= widget.$props.max) {
        widget.$props.value = stepNum(_tempValue, widget.$props.value);
      }
    } else {
      var focusValue = _tempValue[initValueIndex];
      focusValue += axisValue(details.delta.dx);
      _tempValue[initValueIndex] = focusValue;

      if (focusValue >= widget.$props.min && focusValue <= widget.$props.max) {
        if (_tempValue[0] > _tempValue[1]) {
          widget.$props.value = initValueIndex == 0
              ? [
                  stableValues[1],
                  stepNum(_tempValue[0], widget.$props.value[1])
                ]
              : [
                  stepNum(_tempValue[1], widget.$props.value[0]),
                  stableValues[0]
                ];
        } else {
          widget.$props.value = [
            initValueIndex == 0
                ? stepNum(_tempValue[0], widget.$props.value[0])
                : stableValues[0],
            initValueIndex == 1
                ? stepNum(_tempValue[1], widget.$props.value[1])
                : stableValues[1],
          ];
        }
      }
    }
    setState(() {});
  }

  setTempValue(e) {
    _tempValue =
        widget.$props.range ? [...widget.$props.value] : widget.$props.value;
  }

  double stepNum(num current, num _defalut) {
    num result = _defalut;
    var stops = [widget.$props.min, ...widget.$props._stops, widget.$props.max];
    var stopLen = stops.length;
    for (var i = 0; i < stopLen - 1; i++) {
      var stopValue = stops[i];
      var nextStopValue = stops[i + 1];
      if (current > stopValue && current < nextStopValue) {
        result = (current - stopValue).abs() > (nextStopValue - current).abs()
            ? nextStopValue
            : stopValue;
        break;
      }
    }
    return result.toDouble();
  }

  double axis(num d) {
    return (d - widget.$props.min) /
        (widget.$props.max - widget.$props.min) *
        _contentWidth;
  }

  double axisValue(num offset) {
    return offset / _contentWidth * (widget.$props.max - widget.$props.min) +
        widget.$props.min;
  }

  double get minVal {
    if (widget.$props.range) {
      return widget.$props.value[0].toDouble();
    }
    return 0.0;
  }

  double get maxVal {
    if (widget.$props.range) {
      return widget.$props.value[1].toDouble();
    }
    return widget.$props.valueNotifier.value.toDouble();
  }

  Color get inactiveColor {
    return widget.$style?.inactiveColor ??
        cfgGlobal.slider.inactiveColor ??
        CfgGlobal.disabledColor.shade300;
  }

  Color get activeColor {
    return widget.$style?.activeColor ??
        cfgGlobal.slider.activeColor ??
        CfgGlobal.primaryColor;
  }

  Color get thumbColor {
    return widget.$style?.thumbColor ??
        cfgGlobal.slider.thumbColor ??
        Colors.white;
  }

  double get height {
    return widget.$style?.height ?? cfgGlobal.slider.height ?? 6.0;
  }

  double get valueRadiusOuter {
    return widget.$style?.valueRadiusOuter ??
        cfgGlobal.slider.valueRadiusOuter ??
        10.0;
  }

  double get valueRadiusInner {
    return widget.$style?.valueRadiusInner ??
        cfgGlobal.slider.valueRadiusInner ??
        8.0;
  }

  double get width {
    return widget.$style?.width ?? cfgGlobal.slider.width ?? 800;
  }
}

class WSliderOn extends BaseOn {
  /**
      change	值改变时触发（使用鼠标拖曳时，只在松开鼠标后触发）	改变后的值
      input	数据改变时触发（使用鼠标拖曳时，活动过程实时触发）	改变后的值
   */
}

class WSliderProp extends FormFieldProp {
  late num min;
  late num max;
  late bool disabled;
  late num step;
  late bool showInput;
  late bool showInputControls;
  late String inputSize;
  late bool showStops;
  late bool showTooltip;
  String Function(num)? formatTooltip;
  late bool range;
  late bool vertical;
  double? height;
  String? label;
  late num debounce;
  String? tooltipClass;
  late Map<num, dynamic> marks;

  final List<num> _stops = [];

  WSliderProp({
    dynamic value,
    num? min,
    num? max,
    bool? disabled,
    num? step,
    bool? showInput,
    bool? showInputControls,
    String? inputSize,
    bool? showStops,
    bool? showTooltip,
    String Function(num)? formatTooltip,
    bool? range,
    bool? vertical,
    double? height,
    String? label,
    num? debounce,
    String? tooltipClass,
    Map<num, dynamic>? marks,
    ValueNotifier? valueNotifier,
  }) : super(valueNotifier: valueNotifier) {
    this.min = min ?? 0;
    this.max = max ?? 100;
    this.disabled = disabled ?? false;
    this.step = step ?? 1;
    this.showInput = showInput ?? false;
    this.showInputControls = showInputControls ?? true;
    this.inputSize = inputSize ?? 'small';
    this.showStops = showStops ?? false;
    this.showTooltip = showTooltip ?? true;
    this.formatTooltip = formatTooltip;
    this.range = range ?? false;
    this.vertical = vertical ?? false;
    this.height = height;
    this.label = label;
    this.debounce = debounce ?? 300;
    this.tooltipClass = tooltipClass;
    this.marks = marks ?? {};

    super.value = value ?? (this.range ? [0.0, 0.0] : 0.0);

    assert(
        (this.range && value is List) || (!this.range && super.value is! List),
        '属性类型不正确，value: ${super.value}，range: ${this.range}');

    assert(this.min <= this.max, '最大最小值异常: [ ${this.min}, ${this.max} ]');

    var start = this.min + this.step;
    while (start < this.max && start > this.min) {
      _stops.add(start);
      start += this.step;
    }
  }
}

class SliderMark {
  late TextStyle textStyle;
  late String Function(dynamic)? markFormat;
  SliderMark(this.textStyle, this.markFormat);
}

class WSliderSlot extends BaseSlot {
  WSliderSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
