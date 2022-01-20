import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustache_template/mustache.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';

// TODO 修复 stroke-width 值太大时体现出来的百分比偏差，circle
class WProgress extends StatefulWidget
    implements
        BaseWidget<WProgressOn, WProgressProp, WProgressSlot, WProgressStyle> {
  @override
  late final WProgressOn $on;
  @override
  late final WProgressProp $props;
  @override
  late final WProgressSlot $slots;
  @override
  late WProgressStyle $style;

  WProgress({
    Key? key,
    WProgressOn? on,
    WProgressProp? props,
    WProgressSlot? slots,
    WProgressStyle? style,
  }) : super(key: key) {
    $on = on ?? WProgressOn();
    $props = props ?? WProgressProp();
    $slots = slots ?? WProgressSlot(null);
    $style = style ?? WProgressStyle();
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
    if (c is List) {
      (c as List).sort((a, b) {
        return a['percentage'] - b['percentage'];
      });
      for (var i = 0; i < c.length; i++) {
        var element = c[i];
        if (element['percentage'] >= widget.$props.percentage) {
          return element['color'];
        }
      }
    }
    return cfgGlobal.color.val(widget.$props.status ?? 'primary');
  }

  Widget line() {
    return Row(
      children: [
        Expanded(child: lineMain),
        if (icon != null) icon!,
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

  Widget? get icon {
    if (widget.$props.textInside) return null;
    var icon = cfgGlobal.progress.icon(widget.$props.status);
    var actualIcon;
    var fontSize = sqrt(widget.$props.strokeWidth) * 18 / 3;
    if (icon != null) {
      actualIcon = Icon(
        icon,
        color: color,
        size: sqrt(widget.$props.strokeWidth) * 8,
      );
    } else if (widget.$props.format != null) {
      actualIcon = Text(
        widget.$props.format?.call(widget.$props.percentage),
        style: TextStyle(fontSize: fontSize),
      );
    } else {
      actualIcon = Text(
        '${widget.$props.percentage}%',
        style: TextStyle(fontSize: fontSize),
      );
    }
    return SizedBox(
      width: sqrt(widget.$props.strokeWidth) * 18,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
        child: Align(
          alignment: widget.$props.typeIsLine
              ? Alignment.centerLeft
              : Alignment.center,
          child: actualIcon,
        ),
      ),
    );
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
          stroke-linecap="${widget.$props.strokeLinecap}" 
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

  // TODO 修改实现
  Widget dashboard() {
    var offset = 500 - widget.$props.strokeWidth * 5;
    var strokeWidth = widget.$props.strokeWidth * 10;
    var svg = '''
    <?xml version="1.0" encoding="UTF-8"?>
      <svg width="1000" height="1000"
        xmlns="http://www.w3.org/2000/svg"
        xmlns:xlink="http://www.w3.org/1999/xlink"
        xmlns:cge="http://iec.ch/TC57/2005/SVG-schema#"
        xmlns:hzsvg="http://holleygrid.cn/svg">
        <path d="
          M 500 500
          m 0 $offset
          a $offset $offset 0 1 1 0 -${1000 - strokeWidth}
          a $offset $offset 0 1 1 0 ${1000 - strokeWidth} 
          "
          stroke-width="${strokeWidth * .8}" 
          stroke="#e5e9f2" 
          fill="none" stroke-linecap="${widget.$props.strokeLinecap}"  style="stroke-dasharray: 3000px, 3000px; stroke-dashoffset: 750px;"></path>
          
        {{# percentage}}
        <path d="
          M 500 500
          m 0 $offset
          a $offset $offset 0 1 1 0 -${1000 - strokeWidth}
          a $offset $offset 0 1 1 0  ${1000 - strokeWidth}
          " stroke="rgb(${color.red}, ${color.green}, ${color.blue});" 
          fill="none" stroke-linecap="${widget.$props.strokeLinecap}" 
          stroke-width="${strokeWidth * .8}" 
          style="stroke-dasharray: ${(widget.$props.percentage / 100 * 3000 - strokeWidth * 2) * .75}px, 3000px; stroke-dashoffset: 750px; transition: stroke-dasharray 0.6s ease 0s, stroke 0.6s ease 0s;"></path>
        {{/ percentage}}
      </svg>''';
    var template = Template(svg);
    var output =
        template.renderString({'percentage': widget.$props.percentage > 0});
    print(output);
    return LayoutBuilder(builder: (context, cons) {
      var chart = SvgPicture.string(output);
      return AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            Center(child: chart),
            if (icon != null) AspectRatio(aspectRatio: 1, child: icon!)
          ],
        ),
      );
    });
  }

  Widget circle() {
    var offset = 500 - widget.$props.strokeWidth * 5;
    var strokeWidth = widget.$props.strokeWidth * 10;
    var svg = '''
    <?xml version="1.0" encoding="UTF-8"?>
      <svg width="1000" height="1000"
        xmlns="http://www.w3.org/2000/svg"
        xmlns:xlink="http://www.w3.org/1999/xlink"
        xmlns:cge="http://iec.ch/TC57/2005/SVG-schema#"
        xmlns:hzsvg="http://holleygrid.cn/svg">
        <path d="
          M 500 500
          m 0 -$offset
          a $offset $offset 0 1 1 0 ${1000 - strokeWidth}
          a $offset $offset 0 1 1 0 -${1000 - strokeWidth}
          "
          stroke-width="${strokeWidth * .8}" 
          stroke="#e5e9f2" 
          fill="none" style="stroke-dasharray: 3141.5926px, 3141.5926px; stroke-dashoffset: 0px;"></path>
          
        {{# percentage}}
        <path d="
          M 500 500
          m 0 -$offset
          a $offset $offset 0 1 1 0 ${1000 - strokeWidth}
          a $offset $offset 0 1 1 0  -${1000 - strokeWidth}
          " stroke="rgb(${color.red}, ${color.green}, ${color.blue});" 
          fill="none" stroke-linecap="${widget.$props.strokeLinecap}" 
          stroke-width="${strokeWidth * .8}" 
          style="stroke-dasharray: ${widget.$props.percentage / 100 * 3000 - strokeWidth / 2}px, 3141.5926px; stroke-dashoffset: 0px; transition: stroke-dasharray 0.6s ease 0s, stroke 0.6s ease 0s;"></path>
        {{/ percentage}}
      </svg>''';
    var template = Template(svg);
    var output =
        template.renderString({'percentage': widget.$props.percentage > 0});
    return LayoutBuilder(builder: (context, cons) {
      var chart = SvgPicture.string(output);
      return AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            Center(child: chart),
            if (icon != null) AspectRatio(aspectRatio: 1, child: icon!)
          ],
        ),
      );
    });
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

  bool get typeIsLine {
    return type == 'line';
  }

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

class WProgressSlot extends BaseSlot {
  WProgressSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
