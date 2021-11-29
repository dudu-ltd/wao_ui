import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class ContainerLayout extends StatefulWidget
    implements BaseWidget<BaseOn, ContainerLayoutProp, ContainerLayoutSlot> {
  static Color devideColor = Colors.grey.shade50;

  @override
  late BaseOn $on;
  @override
  late ContainerLayoutProp $props;
  @override
  late ContainerLayoutSlot $slots;

  Widget main;
  _ContainerLayoutState? state;
  ContainerLayout(
    this.main, {
    Key? key,
    slots,
    props,
    on,
  })  : this.$props = props ?? ContainerLayoutProp(),
        this.$slots = slots ?? ContainerLayoutSlot(),
        this.$on = BaseOn(),
        super(key: key);

  @override
  _ContainerLayoutState createState() => state = _ContainerLayoutState($props);

  setMain(main) {
    state!.setMain(main);
  }
}

class _ContainerLayoutState extends State<ContainerLayout> {
  ContainerLayoutProp $props;
  double _lastX = 0;
  double _lastY = 0;
  _ContainerLayoutState(this.$props);
  setMain(main) {
    setState(() {
      widget.main = main;
    });
  }

  _setCurrentStartPoint(Offset offset) {
    _lastX = offset.dx;
    _lastY = offset.dy;
  }

  _changeHeaderHeight(double newY) {
    setState(() {
      $props.headerHeight = $props.headerHeight + (newY - _lastY);
      _lastY = newY;
    });
  }

  _changeFooterHeight(double newY) {
    setState(() {
      $props.footerHeight -= (newY - _lastY);
      _lastY = newY;
    });
  }

  _changeLeftWidth(double newX) {
    setState(() {
      $props.asideLeftWidth += (newX - _lastX);
      _lastX = newX;
    });
  }

  _changeRightWidth(double newX) {
    setState(() {
      $props.asideRightWidth -= (newX - _lastX);
      _lastX = newX;
    });
  }

  @override
  Widget build(BuildContext context) {
    var col = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [],
    );
    if (widget.$slots.header != null) {
      addHorizontal(
        widget.$slots.header!,
        $props.headerHeight,
        _changeHeaderHeight,
        col,
        true,
      );
    }

    var middle = Row(children: []);
    addLeftAndRight(middle);

    col.children.add(Expanded(child: middle));
    if (widget.$slots.footer != null) {
      addHorizontal(
        widget.$slots.footer!,
        $props.footerHeight,
        _changeFooterHeight,
        col,
        false,
      );
    }
    return col;
  }

  void addLeftAndRight(Row middle) {
    if (widget.$slots.asideLeft != null) {
      addVertial(
        widget.$slots.asideLeft!,
        $props.asideLeftWidth,
        _changeLeftWidth,
        middle,
        true,
      );
    }
    // 主窗口
    middle.children.add(Expanded(
      child: FractionallySizedBox(
        child: widget.main,
        widthFactor: 1,
        heightFactor: 1,
        alignment: Alignment.topLeft,
      ),
    ));
    if (widget.$slots.asideRight != null) {
      addVertial(
        widget.$slots.asideRight!,
        $props.asideRightWidth,
        _changeRightWidth,
        middle,
        false,
      );
    }
  }

  void addHorizontal(Widget _widget, double height, Function heightHandle,
      Column col, bool isHeader) {
    if (!isHeader) {
      col.children.add(getEventBarY(
        heightHandle,
        SystemMouseCursors.resizeUp,
        Container(height: $props.barSize, color: ContainerLayout.devideColor),
        isHeader,
      ));
    }
    var inner = Align(
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(minHeight: 0, minWidth: 0),
            child: _widget,
            height: height,
          )
        ],
      ),
      alignment: Alignment.centerLeft,
    );
    col.children.add(inner);
    if (isHeader) {
      col.children.add(
        getEventBarY(
          heightHandle,
          SystemMouseCursors.resizeUp,
          Container(height: $props.barSize, color: ContainerLayout.devideColor),
          isHeader,
        ),
      );
    }
  }

  void addVertial(Widget _widget, double width, Function heightHandle, Row row,
      bool isLeft) {
    if (!isLeft) {
      row.children.add(
        getEventBarX(
          heightHandle,
          SystemMouseCursors.resizeLeft,
          Container(width: $props.barSize, color: ContainerLayout.devideColor),
          isLeft,
        ),
      );
    }
    var inner = Row(children: [
      Container(
        constraints: BoxConstraints(minHeight: 0, minWidth: $props.barSize * 2),
        child: _widget,
        width: width,
      )
    ]);
    row.children.add(inner);
    if (isLeft) {
      row.children.add(
        getEventBarX(
          heightHandle,
          SystemMouseCursors.resizeLeftRight,
          Container(
            width: $props.barSize,
            color: ContainerLayout.devideColor,
          ),
          isLeft,
        ),
      );
    }
  }

  Widget getEventBarY(Function eventHandle, MouseCursor cursor,
      Container blankWidget, bool isHeader) {
    return Offstage(
      child: Listener(
        onPointerDown: (event) => _setCurrentStartPoint(event.position),
        onPointerMove: (event) => eventHandle(event.position.dy),
        child: MouseRegion(cursor: cursor, child: blankWidget),
      ),
      offstage: !(isHeader ? $props.headerJudge : $props.footerJudge),
    );
  }

  Widget getEventBarX(Function eventHandle, MouseCursor cursor,
      Container blankWidget, bool isLeft) {
    return Offstage(
      child: Listener(
        onPointerDown: (event) => _setCurrentStartPoint(event.position),
        onPointerMove: (event) => eventHandle(event.position.dx),
        child: MouseRegion(cursor: cursor, child: blankWidget),
      ),
      offstage: !(isLeft ? $props.leftJudge : $props.rightJudge),
    );
  }
}

///
///布局相关属性
///
class ContainerLayoutProp extends BaseProp {
  /// 调整宽（高）工具条的宽度（高度）
  late double barSize;

  /// 头部初始高度
  late double headerHeight;

  /// 底部初始高度
  late double footerHeight;

  /// 左边初始宽度
  late double asideLeftWidth;

  /// 右边初始宽度
  late double asideRightWidth;

  /// 顶部高度是否可调整
  late bool headerJudge;

  /// 左侧宽度是否可调整
  late bool leftJudge;

  /// 右侧宽度是否可调整
  late bool rightJudge;

  /// 底部高度是否可调整
  late bool footerJudge;

  ContainerLayoutProp({
    barSize = 3.0,
    headerHeight,
    footerHeight,
    asideLeftWidth,
    asideRightWidth,
    headerJudge,
    leftJudge,
    rightJudge,
    footerJudge,
  }) {
    this.barSize = barSize ?? 3.0;
    this.headerHeight = headerHeight ?? 30;
    this.footerHeight = footerHeight ?? 30;
    this.asideLeftWidth = asideLeftWidth ?? 200;
    this.asideRightWidth = asideRightWidth ?? 200;
    this.headerJudge = headerJudge ?? false;
    this.leftJudge = leftJudge ?? false;
    this.rightJudge = rightJudge ?? false;
    this.footerJudge = footerJudge ?? false;
  }
}

///
/// 具名插槽，分别属于上下左右
///
class ContainerLayoutSlot extends BaseSlot {
  Widget? asideLeft;
  Widget? header;
  Widget? asideRight;
  Widget? footer;
  ContainerLayoutSlot({
    this.asideLeft,
    this.header,
    this.asideRight,
    this.footer,
  }) : super();
}
