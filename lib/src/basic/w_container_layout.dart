import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';

class WContainerLayout extends StatefulWidget
    implements
        BaseWidget<WContainerLayoutOn, WContainerLayoutProp,
            WContainerLayoutSlot, WContainerLayoutStyle> {
  @override
  late final WContainerLayoutOn $on;
  @override
  late final WContainerLayoutProp $props;
  @override
  late final WContainerLayoutSlot $slots;
  @override
  late WContainerLayoutStyle $style;

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
  }

  static Color devideColor = Colors.grey.shade50;
  _WContainerLayoutState? state;

  @override
  _WContainerLayoutState createState() =>
      state = _WContainerLayoutState($props);

  setMain(main) {
    state!.setMain(main);
  }
}

class _WContainerLayoutState extends State<WContainerLayout> {
  WContainerLayoutProp $props;
  double _lastX = 0;
  double _lastY = 0;
  _WContainerLayoutState(this.$props);
  setMain(main) {
    setState(() {
      widget.$slots.defaultSlotBefore = main;
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
      var change = newX - _lastX;
      // if ($props.asideLeftWidth <= $props.asideLeftMinWidth && change < 0) {
      //   return;
      // }

      $props.asideLeftWidth = $props.asideLeftWidth + change;
      _lastX = newX;
    });
  }

  _changeRightWidth(double newX) {
    setState(() {
      $props.asideRightWidth -= (newX - _lastX);
      _lastX = newX;
    });
  }

  // Widget _getHorizontalSlot(slot, height, minHeight) {
  //   if (height < minHeight) {
  //     return SingleChildScrollView(
  //       scrollDirection: Axis.vertical,
  //       child: ConstrainedBox(
  //         constraints: BoxConstraints(
  //           minHeight: minHeight,
  //         ),
  //         child: slot,
  //       ),
  //     );
  //   }
  //   return slot;
  // }

  // Widget _getVertialSlot(slot, width, minWidth) {
  //   if (width < minWidth) {
  //     return SingleChildScrollView(
  //       scrollDirection: Axis.horizontal,
  //       child: ConstrainedBox(
  //         constraints: BoxConstraints(
  //           minWidth: minWidth,
  //         ),
  //         child: Align(
  //           child: slot,
  //           alignment: Alignment.centerLeft,
  //         ),
  //       ),
  //     );
  //   }
  //   return slot;
  // }

  @override
  Widget build(BuildContext context) {
    var col = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [],
    );
    if (widget.$slots.header != null) {
      addHorizontal(
        // _getHorizontalSlot(
        widget.$slots.header!,
        //   widget.$props.headerHeight,
        //   widget.$props.headerMinHeight,
        // ),
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
        // _getHorizontalSlot(
        widget.$slots.footer!,
        //   widget.$props.footerHeight,
        //   widget.$props.footerMinHeight,
        // ),
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
        // _getVertialSlot(
        widget.$slots.asideLeft!,
        //   widget.$props.asideLeftWidth,
        //   widget.$props.asideLeftMinWidth,
        // ),
        $props.asideLeftWidth,
        _changeLeftWidth,
        middle,
        true,
      );
    }
    // 主窗口
    middle.children.add(Expanded(
      child: FractionallySizedBox(
        child: widget.$slots.defaultSlot == null
            ? null
            : widget.$slots.defaultSlot![0],
        widthFactor: 1,
        heightFactor: 1,
        alignment: Alignment.topLeft,
      ),
    ));
    if (widget.$slots.asideRight != null) {
      addVertial(
        // _getVertialSlot(
        widget.$slots.asideRight!,
        //   widget.$props.asideRightWidth,
        //   widget.$props.asideRightMinWidth,
        // ),
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

class WContainerLayoutOn extends BaseOn {}

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
    this.headerHeight = headerHeight ?? 30;
    this.footerHeight = footerHeight ?? 30;
    this.asideLeftWidth = asideLeftWidth ?? 200;
    this.asideLeftMinWidth = asideLeftMinWidth ?? 400;
    this.asideRightMinWidth = asideRightMinWidth ?? 400;
    this.headerMinHeight = headerMinHeight ?? 30;
    this.footerMinHeight = footerMinHeight ?? 30;
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
