import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/layout_util.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:wao_ui/src/basic/w_container_layout.dart';

/// TODO 插槽二次渲染导致事件重复绑定的问题
class _WScrollSnapState extends WState<WScrollSnap>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late ScrollController scrollCtrl;
  Widget snap = Container();
  late BuildContext snapContext;
  late Function(Function()) snapSetState;

  @override
  void initState() {
    super.initState();
    scrollCtrl = ScrollController();
    _updateSnap();
  }

  updateView() => setState(() {});

  updateMask() {
    topHeight = scrollCtrl.offset * scrollHeightToSnapHeight();
    bottomHeight =
        getPosition(context).size.height - topHeight - snapViewport();
    bottomHeight = bottomHeight < 0 ? 0 : bottomHeight;
    topHeight = topHeight < 0 ? 0 : topHeight;
    middleHeight = snapViewport();
    mask = Column(
      children: [
        ColoredBox(
            color: CfgGlobal.basicColor.shade700.withOpacity(0),
            child: Container(height: topHeight)),
        ColoredBox(
          color: CfgGlobal.basicColor.shade700.withOpacity(.2),
          child: Container(height: middleHeight),
        ),
        ColoredBox(
            color: CfgGlobal.basicColor.shade700.withOpacity(0),
            child: Container(height: bottomHeight)),
      ],
    );
    snapSetState(() {});
  }

  _updateSnap() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollCtrl.addListener(updateMask);
      // updateMask();
      Timer(Duration(seconds: 1), () {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollCtrl.dispose();
    print('---------dispose ------');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('-----------deactivate-------------');
  }

  GlobalKey scrollKey = GlobalKey();
  @override
  Widget wbuild(BuildContext context) {
    return WContainerLayout()
      ..$slots.$ = SingleChildScrollView(
        key: scrollKey,
        controller: scrollCtrl,
        child: widget.$slots.content,
      )
      ..$slots.asideRight = snapBuilder
      ..$props.rightJudge = true
      ..$props.asideRightWidth = widget.$style.snapWidth;
  }

  var mask = Column();
  double topHeight = 0;
  double bottomHeight = 500;
  double middleHeight = 0;
  GlobalKey? snapKey = null;

  viewport() {
    // b
    return scrollCtrl.position.viewportDimension;
  }

  contentHeight() {
    // ( a + b )
    return scrollCtrl.position.maxScrollExtent + viewport();
  }

  scrollHeightToSnapHeight() {
    var viewportHeight = viewport();
    var scrollHeight = contentHeight();
    return viewportHeight / scrollHeight;
  }

  snapViewport() {
    // b * b / ( a + b )
    var b =
        (snapKey?.currentContext?.findRenderObject() as RenderBox).size.height;
    return b * b / contentHeight();
  }

  scrollTo(offset, duration) {
    var newOffset = (offset - snapViewport() / 2) / scrollHeightToSnapHeight();
    newOffset = newOffset < 0 ? 0.0 : newOffset;
    newOffset = newOffset > scrollCtrl.position.maxScrollExtent
        ? scrollCtrl.position.maxScrollExtent
        : newOffset;

    if (duration == Duration.zero) {
      scrollCtrl.jumpTo(newOffset);
    } else {
      scrollCtrl.animateTo(
        newOffset,
        duration: duration,
        curve: Curves.ease,
      );
    }
  }

  scrollByPoint(details, Duration duration) {
    scrollTo(details.localPosition.dy, duration);
  }

  scrollByWheel(e) {
    // 不可用
    var offset =
        scrollCtrl.offset * scrollHeightToSnapHeight() + e.scrollDelta.dy;
    scrollTo(offset, Duration.zero);
  }

  Widget get snapBuilder {
    snapKey = GlobalKey();
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerSignal: (e) {
        if (e is PointerScrollEvent) {
          //  TODO 将 鼠标滚轮与点击事件触发的滚动，用一个方法来实现。scrollByWheel(e);
          var distance = e.scrollDelta.dy / scrollHeightToSnapHeight();
          var newOffset = scrollCtrl.offset + distance;
          newOffset = newOffset < 0 ? 0.0 : newOffset;
          newOffset = newOffset > scrollCtrl.position.maxScrollExtent
              ? scrollCtrl.position.maxScrollExtent
              : newOffset;
          scrollCtrl.jumpTo(newOffset);
        }
      },
      child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onVerticalDragDown: (details) =>
              scrollByPoint(details, Duration.zero),
          onVerticalDragUpdate: (details) =>
              scrollByPoint(details, Duration.zero),
          child: snap = Padding(
            padding: padding,
            child: Stack(
              children: [
                ColoredBox(
                  color: CfgGlobal.basicColor.shade50,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: FittedBox(
                      key: snapKey,
                      fit: BoxFit.fitWidth,
                      child: widget.$slots.content,
                    ),
                  ),
                ),
                StatefulBuilder(builder: (context, setState) {
                  snapContext = context;
                  snapSetState = setState;
                  return mask;
                })
              ],
            ),
          )),
    );
  }

  EdgeInsets get padding {
    return widget.$style.padding ??
        cfgGlobal.scrollSnap.padding ??
        EdgeInsets.zero;
  }
}

class WScrollSnap extends WStatefulWidget<WScrollSnapOn, WScrollSnapProp,
    WScrollSnapSlot, WScrollSnapStyle> {
  WScrollSnap({
    Key? key,
    WScrollSnapOn? on,
    WScrollSnapProp? props,
    WScrollSnapSlot? slots,
    WScrollSnapStyle? style,
  }) : super(key: key) {
    $on = on ?? WScrollSnapOn();
    $props = props ?? WScrollSnapProp();
    $slots = slots ?? WScrollSnapSlot(null);
    $style = style ?? WScrollSnapStyle();
  }

  @override
  State<WScrollSnap> createState() => _WScrollSnapState();
}

class WScrollSnapOn extends BaseOn {}

class WScrollSnapProp extends BaseProp {}

class WScrollSnapSlot extends BaseSlot {
  Widget? content;
  WScrollSnapSlot(defaultSlotBefore, {this.content}) : super(defaultSlotBefore);
}
