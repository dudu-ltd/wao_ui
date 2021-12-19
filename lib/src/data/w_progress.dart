import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustache_template/mustache.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';

class WProgress extends StatefulWidget
    implements BaseWidget<WProgressOn, WProgressProp, WProgressSlot> {
  @override
  late final WProgressOn $on;

  @override
  late final WProgressProp $props;

  @override
  late final WProgressSlot $slots;

  WProgress({
    Key? key,
    WProgressOn? on,
    WProgressProp? props,
    WProgressSlot? slots,
  }) : super(key: key) {
    $on = on ?? WProgressOn();
    $props = props ?? WProgressProp();
    $slots = slots ?? WProgressSlot();
  }

  @override
  _WProgressState createState() => _WProgressState();
}

class _WProgressState extends State<WProgress> {
  @override
  Widget build(BuildContext context) {
    widget.$props._state = this;
    return renderByType;
  }

  Widget get renderByType {
    switch (widget.$props.type) {
      case 'circle':
        return circle();
      case 'dashboard':
        return dashboard();
      default:
        return line();
    }
  }

  Color get color {
    var c = widget.$props.color;
    if (c is Color) return c;
    if (c is Function) return c(widget.$props.percentage);
    return cfgGlobal.color.val(widget.$props.status ?? 'primary');
  }

  Widget line() {
    return Row(
      children: [
        Expanded(child: lineMain),
        if (lineIcon != null) lineIcon!,
      ],
    );
  }

  Widget get lineMain {
    return LayoutBuilder(builder: (context, cons) {
      return svgByTemplate(
        width: cons.maxWidth,
        strokeWidth: widget.$props.strokeWidth,
        color: color,
        percentage: widget.$props.percentage,
      );
    });
  }

  Widget? get lineIcon {
    var icon = cfgGlobal.progress.icon(widget.$props.status);
    if (icon != null && !widget.$props.textInside) {
      return SizedBox(
        width: sqrt(widget.$props.strokeWidth) * 10,
        child: Icon(
          icon,
          color: color,
          size: sqrt(widget.$props.strokeWidth) * 8,
        ),
      );
    }
    return null;
  }

  Widget svgByTemplate({width, strokeWidth, color, percentage}) {
    var lineTpl = '''
      <?xml version="1.0" encoding="UTF-8"?>
      <svg width="${width}" height="$strokeWidth" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:cge="http://iec.ch/TC57/2005/SVG-schema#" xmlns:hzsvg="http://holleygrid.cn/svg">

        <rect x="0" y="0" 
          rx="${strokeWidth / 2}" 
          ry="${strokeWidth / 2}" 
          width="$width" 
          height="$strokeWidth"
          style="fill:rgb(238, 238, 238);
        "/>
        <rect x="0" y="0" 
          rx="${strokeWidth / 2}" 
          ry="${strokeWidth / 2}" 
          width="${percentage / 100 * width}" 
          height="$strokeWidth" 
          style="fill:rgb(${color.red}, ${color.green}, ${color.blue});"
        />
        {{# textInside}}
        <text text-anchor="middle" x="${(percentage - strokeWidth * 0.1 - '$percentage'.length) < 0 ? 0 : (percentage - strokeWidth * 0.1 - '$percentage'.length) / 100 * width}" y="${strokeWidth * 0.75}" dominant-baseline="central" style="fill: #fff; font-size: ${strokeWidth * 0.75}" >$percentage%</text>
        {{/ textInside}}
      </svg>''';

    var template = Template(lineTpl);

    var output =
        template.renderString({'textInside': widget.$props.textInside});
    return SvgPicture.string(output);
  }

  Widget dashboard() {
    return Container();
  }

  Widget circle() {
    return Container();
  }

  update(e) {
    setState(() {});
  }
}

class WProgressOn extends BaseOn {}

class WProgressProp extends BaseProp {
  num _percentage = 0.0;
  late String type;
  late double strokeWidth;
  late bool textInside;
  late String? status;
  late dynamic color;
  late num width;
  late bool showText;
  late String strokeLinecap;
  late Function(num)? format;
  _WProgressState? _state;

  set percentage(percentage) {
    _percentage = percentage;
    if (_state != null) {
      _state!.update(percentage);
    }
  }

  get percentage {
    return _percentage;
  }

  WProgressProp({
    percentage,
    type,
    strokeWidth,
    textInside,
    status,
    color,
    width,
    showText,
    strokeLinecap,
    format,
  }) {
    this.percentage = percentage ?? 0;
    this.type = type ?? 'line';
    this.strokeWidth = strokeWidth ?? 6.0;
    this.strokeWidth += 0.0;
    this.textInside = textInside ?? false;
    this.status = status;
    this.color = color;
    this.width = width ?? 126;
    this.showText = showText ?? true;
    this.strokeLinecap = strokeLinecap ?? 'round';
    this.format = format;
  }
}

class WProgressSlot extends BaseSlot {}
