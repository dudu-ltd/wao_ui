import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/wao_ui.dart';

class WContainerLayout extends WStatefulWidget<WContainerLayoutOn,
    WContainerLayoutProp, WContainerLayoutSlot, WContainerLayoutStyle> {
  WContainerLayout({
    Key? key,
    WContainerLayoutOn? on,
    WContainerLayoutProp? props,
    WContainerLayoutSlot? slots,
    WContainerLayoutStyle? style,
  }) : super(key: key) {
    $on = on ?? WContainerLayoutOn();
    $props = props ?? WContainerLayoutProp();
    $slots = slots ?? WContainerLayoutSlot(null);
    $style = style ?? WContainerLayoutStyle();
    init();
  }

  static Color devideColor = Colors.grey.shade100;
  _WContainerLayoutState? state;

  @override
  _WContainerLayoutState createState() =>
      state = _WContainerLayoutState($props);

  setMain(main) {
    state!.setMain(main);
  }
}

class _WContainerLayoutState extends WState<WContainerLayout> {
  WContainerLayoutProp $props;
  double _lastX = 0;
  double _lastY = 0;
  _WContainerLayoutState(this.$props);
  setMain(main) {
    setState(() {
      widget.$slots.$ = main;
    });
  }

  _setCurrentStartPoint(Offset offset) {
    _lastX = offset.dx;
    _lastY = offset.dy;
  }

  _changeHeaderHeight(double newY) {
    setState(() {
      $props.headerHeight = $props.headerHeight + (newY - _lastY);
      widget.$on.headerResize?.call($props.headerHeight);
      _lastY = newY;
    });
  }

  _changeFooterHeight(double newY) {
    setState(() {
      $props.footerHeight -= (newY - _lastY);
      widget.$on.footerResize?.call($props.footerHeight);
      _lastY = newY;
    });
  }

  _changeLeftWidth(double newX) {
    setState(() {
      var change = newX - _lastX;
      $props.asideLeftWidth = $props.asideLeftWidth + change;
      widget.$on.leftResize?.call($props.asideLeftWidth);
      _lastX = newX;
    });
  }

  _changeRightWidth(double newX) {
    setState(() {
      $props.asideRightWidth -= (newX - _lastX);
      widget.$on.rightResize?.call($props.asideRightWidth);
      _lastX = newX;
    });
  }

  @override
  Widget wbuild(BuildContext context) {
    var col = Column(
      mainAxisAlignment: MainAxisAlignment.start,
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

    var middle = Row(
      children: [],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
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
        child: widget.defaultSlot.first,
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
        Container(height: $props.barSize, color: WContainerLayout.devideColor),
        isHeader,
      ));
    }
    var inner = Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(minHeight: 0, minWidth: 0),
            child: _widget,
            height: height,
          )
        ],
      ),
    );
    col.children.add(inner);
    if (isHeader) {
      col.children.add(
        getEventBarY(
          heightHandle,
          SystemMouseCursors.resizeUp,
          Container(
              height: $props.barSize, color: WContainerLayout.devideColor),
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
          Container(width: $props.barSize, color: WContainerLayout.devideColor),
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
            color: WContainerLayout.devideColor,
          ),
          isLeft,
        ),
      );
    }
  }

  Widget getEventBarY(Function eventHandle, MouseCursor cursor,
      Container blankWidget, bool isHeader) {
    return Offstage(
      offstage: !(isHeader ? $props.headerJudge : $props.footerJudge),
      child: Listener(
        onPointerDown: (event) => _setCurrentStartPoint(event.position),
        onPointerMove: (event) => eventHandle(event.position.dy),
        child: MouseRegion(cursor: cursor, child: blankWidget),
      ),
    );
  }

  Widget getEventBarX(Function eventHandle, MouseCursor cursor,
      Container blankWidget, bool isLeft) {
    return Offstage(
      offstage: !(isLeft ? $props.leftJudge : $props.rightJudge),
      child: Listener(
        onPointerDown: (event) => _setCurrentStartPoint(event.position),
        onPointerMove: (event) => eventHandle(event.position.dx),
        child: MouseRegion(cursor: cursor, child: blankWidget),
      ),
    );
  }
}

class WContainerLayoutOn extends BaseOn {
  Function(double)? footerResize;
  Function(double)? headerResize;
  Function(double)? leftResize;
  Function(double)? rightResize;
}

///
///布局相关属性
///
class WContainerLayoutProp extends BaseProp {
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

  /// 顶部最小高度
  late double headerMinHeight;

  /// 底部最小高度
  late double footerMinHeight;

  /// 左边最小宽度
  late double asideLeftMinWidth;

  /// 右边最小宽度
  late double asideRightMinWidth;

  /// 顶部高度是否可调整
  late bool headerJudge;

  /// 左侧宽度是否可调整
  late bool leftJudge;

  /// 右侧宽度是否可调整
  late bool rightJudge;

  /// 底部高度是否可调整
  late bool footerJudge;

  WContainerLayoutProp({
    barSize = 3.0,
    asideLeftMinWidth,
    asideRightMinWidth,
    headerMinHeight,
    footerMinHeight,
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
    this.headerHeight = headerHeight ?? 60;
    this.footerHeight = footerHeight ?? 60;
    this.asideLeftWidth = asideLeftWidth ?? 200;
    this.asideLeftMinWidth = asideLeftMinWidth ?? 200;
    this.asideRightMinWidth = asideRightMinWidth ?? 200;
    this.headerMinHeight = headerMinHeight ?? 60;
    this.footerMinHeight = footerMinHeight ?? 60;
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
class WContainerLayoutSlot extends BaseSlot {
  Widget? asideLeft;
  Widget? header;
  Widget? asideRight;
  Widget? footer;
  WContainerLayoutSlot(
    defaultSlotBefore, {
    this.asideLeft,
    this.header,
    this.asideRight,
    this.footer,
  }) : super(defaultSlotBefore);
}
