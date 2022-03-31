import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:wao_ui/core/utils/is_enum.dart';
import 'package:wao_ui/core/utils/wrapper.dart';

///
class WDescriptions extends WStatelessWidget<WDescriptionsOn, WDescriptionsProp,
    WDescriptionsSlot, WDescriptionsStyle> {
  WDescriptions({
    Key? key,
    WDescriptionsOn? on,
    WDescriptionsProp? props,
    WDescriptionsSlot? slots,
    WDescriptionsStyle? style,
  }) : super(key: key) {
    $on = on ?? WDescriptionsOn();
    $props = props ?? WDescriptionsProp();
    $slots = slots ?? WDescriptionsSlot(null);
    $style = style ?? WDescriptionsStyle();
  }

  @override
  WDescriptionsStyle style = WDescriptionsStyle();

  @override
  List<Widget> get defaultSlot {
    if ($slots.$ is String) {
      var w = slotToWidget($slots.$, 0);
      return [if (w != null) w];
    } else if ($slots.$ is Map ||
        $slots.$ is List<WDescriptionsData> ||
        $slots.$ is WDescriptionsData) {
      return descriptionsItems;
    } else {
      return [];
    }
  }

  List<Widget> get descriptionsItems {
    var defaultSlot = $slots.$;
    var result = <Widget>[];
    if (defaultSlot is List<WDescriptionsData>) {
      var children;
      for (var i = 0; i < defaultSlot.length; i++) {
        if (i % $props.column == 0) {
          children = [];
          result.add(Row(children: children));
        }
        children.add(createItem(defaultSlot[i]));
      }
    }
    if (defaultSlot is Map) {
      addFromMap(result);
    }
    print(result);
    return result;
  }

  void addFromMap(List<Widget> result) {
    assert($props.fields != null, '\$props.fields 属性不可为空 !');
    var defaultSlot = $slots.$;
    var children;
    var len = $props.fields!.length;
    for (var i = 0; i < len; i++) {
      if ((i % $props.column) == 0) {
        children = <Widget>[];
        result.add(Row(children: children));
      }
      var field = $props.fields![i];
      var data = WDescriptionsData(
        label: $props.colon ? '${field['label']}:' : field['label'],
        value: defaultSlot[field['field']],
      );
      if (i == $props.fields!.length - 1) {
        int span = $props.column - children.length as int;
        children.add(
          Expanded(
            child: borderWrapper(
              createItem(data),
              getBorder(i, len),
              $props.border,
            ),
            flex: span,
          ),
        );
      } else {
        children.add(
          Expanded(
            child: borderWrapper(
              createItem(data),
              getBorder(i, len),
              $props.border,
            ),
          ),
        );
      }
    }
  }

  /// 根据描述项的位次，及每行的列数，获取该元素所应该有的边距
  Border getBorder(i, len) {
    Border border = Border.fromBorderSide(
      BorderSide(width: 0, color: cfgGlobal.descriptions.borderColor!),
    );
    // 头部上边距
    if (i < $props.column) {
      border = Border.merge(Border(top: borderSide), border);
    }
    // 表格左侧左边距
    if (i % $props.column == 0) {
      border = Border.merge(Border(left: borderSide), border);
    }
    // 表格底部边距
    if (i > len ~/ $props.column * ($props.column - 1)) {
      border = Border.merge(Border(bottom: borderSide), border);
    }
    // 表格右侧边距
    if (i % $props.column == $props.column - 1) {
      border = Border.merge(Border(right: borderSide), border);
    }
    return border;
  }

  Widget createItem(WDescriptionsData data) {
    return WDescriptionsItem(
      props: WDescriptionsItemProp(
        label: data.label is String ? data.label : null,
        direction: $props.direction,
        border: $props.border,
      ),
      slots: WDescriptionsItemSlot(
        data.value,
        label: data.label is Widget ? data.label : null,
      ),
    )..descriptions = this;
  }

  Widget get header {
    return Row(
      children: [
        if (title != null) Align(child: title, alignment: Alignment.centerLeft),
        Expanded(child: Container()),
        if (extra != null) Align(child: extra, alignment: Alignment.centerLeft),
      ],
    );
  }

  Widget? get title {
    return $slots.title ?? ($props.title != null ? Text($props.title!) : null);
  }

  Widget? get extra {
    return $slots.extra ?? ($props.extra != null ? Text($props.extra!) : null);
  }

  @override
  Widget wbuild(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Column(
        children: [header, ...defaultSlot],
      ),
    );
  }

  BorderSide get borderSide {
    return BorderSide(
      color: style.borderColor ?? CfgGlobal.basicColor.shade50,
      width: style.borderLeftWidth ?? 1,
    );
  }
}

///
class WDescriptionsData {
  dynamic label;
  String? value;
  WDescriptionsData({this.label, this.value});
}

///
class WDescriptionsOn extends BaseOn {}

///
class WDescriptionsProp extends BaseProp {
  late bool border;
  late int column;
  late String direction;
  late String size;
  String? title;
  String? extra;
  late bool colon;
  List<Map<String, dynamic>>? fields;

  WDescriptionsProp({
    border,
    column,
    direction,
    size,
    title,
    extra,
    colon,
    this.fields,
  }) {
    this.border = border ?? false;
    this.column = column ?? 3;
    this.direction = direction ?? 'horizontal';
    this.size = size ?? 'medium';
    this.title = title;
    this.extra = extra;
    this.colon = colon ?? true;
  }
}

///
class WDescriptionsSlot extends BaseSlot {
  Widget? title;
  Widget? extra;
  WDescriptionsSlot(defaultSlotBefore, {this.title, this.extra})
      : super(defaultSlotBefore);
}

///
class WDescriptionsItem extends WStatelessWidget<WDescriptionsItemOn,
    WDescriptionsItemProp, WDescriptionsItemSlot, WDescriptionsItemStyle> {
  WDescriptionsItem({
    Key? key,
    WDescriptionsItemOn? on,
    WDescriptionsItemProp? props,
    WDescriptionsItemSlot? slots,
    WDescriptionsItemStyle? style,
  }) : super(key: key) {
    $on = on ?? WDescriptionsItemOn();
    $props = props ?? WDescriptionsItemProp();
    $slots = slots ?? WDescriptionsItemSlot(null);
    $style = style ?? WDescriptionsItemStyle();
    init();
  }

  late WDescriptions? descriptions;

  @override
  Widget wbuild(BuildContext context) {
    var child;
    var children = [
      _colorWrapper(
        _paddingWrapper(
          _borderWrapper(label),
        ),
      ),
      _paddingWrapper(defaultSlot.first),
    ];
    if (isVertical($props.direction)) {
      child = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    } else {
      child = Row(children: children);
    }
    return child;
  }

  Widget _paddingWrapper(Widget widget) {
    return paddingWrapper(
      widget,
      padding: padding,
      need: true,
    );
  }

  Widget _borderWrapper(Widget label) {
    var child;
    if (isVertical($props.direction)) {
      child = borderWrapper(
        FractionallySizedBox(widthFactor: 1, child: label),
        Border(bottom: descriptions?.borderSide ?? BorderSide.none),
        $props.border,
      );
    } else {
      child = borderWrapper(
        SizedBox(
          child: label,
          width: cfgGlobal.descriptions.labelWidth,
        ),
        Border(right: descriptions?.borderSide ?? BorderSide.none),
        $props.border,
      );
    }
    return child;
  }

  Widget _colorWrapper(Widget widget) {
    Color color = cfgGlobal.descriptions.labelColor;
    return colorWrapper(widget, color, true);
  }

  @override
  List<SlotTranslator> get slotTranslatorsDefault => [
        SlotTranslator(String, (s, i, c, l) {
          return FractionallySizedBox(
            child: Text(
              s,
              style: const TextStyle(overflow: TextOverflow.fade),
            ),
          );
        })
      ];

  Widget get label {
    return $slots.label ?? Text($props.label);
  }

  EdgeInsets get padding {
    return $style?.padding ?? cfgGlobal.descriptions.padding ?? EdgeInsets.zero;
  }
}

///
class WDescriptionsItemOn extends BaseOn {}

///
class WDescriptionsItemProp extends BaseProp {
  late String label;
  late int span;
  late String direction;
  late bool border;
  String? labelClassName;
  String? contentClassName;
  WDescriptionsItemProp({
    label,
    span,
    direction,
    border,
    this.labelClassName,
    this.contentClassName,
  }) {
    this.label = label ?? '';
    this.span = span ?? 3;
    this.border = border ?? false;
    this.direction = direction ?? 'horizontal';
  }
}

///
class WDescriptionsItemSlot extends BaseSlot {
  Widget? label;
  WDescriptionsItemSlot(defaultSlotBefore, {this.label})
      : super(defaultSlotBefore);
}
