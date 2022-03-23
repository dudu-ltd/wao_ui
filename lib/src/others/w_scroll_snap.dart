import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/layout_util.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:wao_ui/src/basic/w_container_layout.dart';
import '../../core/base_style.dart';

class _WScrollSnapState extends State<WScrollSnap>
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

  _updateSnap() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
  Widget build(BuildContext context) {
    return WContainerLayout()
      ..$slots.$ = SingleChildScrollView(
        key: scrollKey,
        controller: scrollCtrl,
        child: widget.$slots.content,
      )
      ..$props.asideRightWidth = widget.$style!.snapWidth
      ..$slots.asideRight = snapBuilder;
  }

  Widget get snapBuilder {
    var mask = null;
    double topHeight = 0;
    double bottomHeight = 500;
    GlobalKey? snapKey = null;

    viewport() {
      // b
      return scrollCtrl.position.viewportDimension;
    }

    contentHeight() {
      // a
      return scrollCtrl.position.maxScrollExtent + viewport();
    }

    scrollHeightToSnapHeight() {
      var viewportHeight = viewport();
      var scrollHeight = contentHeight();
      return viewportHeight / scrollHeight;
    }

    snapViewport() {
      // b * b / ( a + b )
      var b = viewport();
      return b * b / contentHeight();
    }

    updateMask() {
      topHeight = scrollCtrl.offset * scrollHeightToSnapHeight();
      bottomHeight =
          getPosition(context).size.height - topHeight - snapViewport();
      bottomHeight = bottomHeight < 0 ? 0 : bottomHeight;
      topHeight = topHeight < 0 ? 0 : topHeight;
      mask = Column(
        children: [
          ColoredBox(
              color: CfgGlobal.basicColor.shade500.withOpacity(.1),
              child: Container(height: topHeight)),
          ColoredBox(
            color: CfgGlobal.basicColor.shade500.withOpacity(.5),
            child: Container(height: snapViewport()),
          ),
          ColoredBox(
              color: CfgGlobal.basicColor.shade500.withOpacity(.1),
              child: Container(height: bottomHeight)),
        ],
      );
      snapSetState(() {});
    }

    Timer(const Duration(seconds: 1), () {
      updateMask();
    });

    scrollTo(offset, duration) {
      var newOffset =
          (offset - snapViewport() / 2) / scrollHeightToSnapHeight();
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
          curve: Curves.easeInOut,
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

    scrollCtrl.addListener(updateMask);

    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerSignal: (e) {
        if (e is PointerScrollEvent) {
          //  TODO 将 鼠标滚轮与点击事件触发的滚动，用一个方法来实现。scrollByWheel(e);
          var distance = e.scrollDelta.dy / scrollHeightToSnapHeight();
          var newOffset = scrollCtrl.offset + distance;
          if (newOffset >= 0 &&
              newOffset <= scrollCtrl.position.maxScrollExtent) {
            scrollCtrl.jumpTo(newOffset);
          }
        }
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onVerticalDragDown: (details) =>
            scrollByPoint(details, CfgGlobal.duration),
        onVerticalDragUpdate: (details) =>
            scrollByPoint(details, Duration.zero),
        child: StatefulBuilder(builder: (context, setState) {
          snapKey = GlobalKey();
          snapContext = context;
          snapSetState = setState;
          snap = Stack(
            key: snapKey,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: widget.$slots.content,
                ),
              ),
              if (mask != null) mask,
            ],
          );
          return snap;
        }),
      ),
    );
  }
}

class WScrollSnap extends StatefulWidget
    with
        BaseMixins<WScrollSnapOn, WScrollSnapProp, WScrollSnapSlot,
            WScrollSnapStyle> {
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

class WScrollSnapStyle extends BaseStyle {
  double snapWidth;
  WScrollSnapStyle({this.snapWidth = 150.0});
}
