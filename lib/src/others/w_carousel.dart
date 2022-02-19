import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/core/utils/layout_util.dart';
import 'package:wao_ui/wao_ui.dart';

import '../../core/utils/color_util.dart';

class WCarousel extends StatefulWidget
    implements
        BaseWidget<WCarouselOn, WCarouselProp, WCarouselSlot, WCarouselStyle> {
  @override
  late final WCarouselOn $on;
  @override
  late final WCarouselProp $props;
  @override
  late final WCarouselSlot $slots;
  @override
  late WCarouselStyle $style;

  WCarousel({
    Key? key,
    WCarouselOn? on,
    WCarouselProp? props,
    WCarouselSlot? slots,
    WCarouselStyle? style,
  }) : super(key: key) {
    $on = on ?? WCarouselOn();
    $props = props ?? WCarouselProp();
    $slots = slots ?? WCarouselSlot(null);
    $style = style ?? WCarouselStyle();
  }
  @override
  State<WCarousel> createState() => _WCarouselState();
}

class _WCarouselState extends State<WCarousel> with TickerProviderStateMixin {
  late AnimationController arrowController;
  late Animation<double> arrowOffset;
  late Animation<double> arrowOpacity;
  late double _width = 0;
  late ValueNotifier currentIndex = ValueNotifier(0.0);
  late int lastIndex = 0;

  late AnimationController itemController;
  late Animation<double> itemOffsetAnimation;

  late List<double> lastItemOffset = [];
  late List<double> itemOffset = [];
  late List<double> nextItemOffset = [];

  late AnimationController blurBtnController;
  late AnimationController focusBtnController;
  late Animation<Color?> blurBtnColor;
  late Animation<Color?> focusBtnColor;

  late AnimationController blurItemController;
  late AnimationController focusItemController;
  late Animation<double> blurItemScale;
  late Animation<double> focusItemScale;

  @override
  void initState() {
    super.initState();
    initItemOffset();
    int ttl = 300;
    arrowController =
        AnimationController(duration: Duration(milliseconds: ttl), vsync: this);
    arrowOpacity =
        Tween(begin: widget.$props.isArrowAlways ? 1.0 : 0.0, end: 1.0)
            .animate(arrowController);
    arrowOffset =
        Tween(begin: widget.$props.isArrowAlways ? 16.0 : 0.0, end: 16.0)
            .animate(arrowController)
          ..addListener(updateView);

    itemController =
        AnimationController(duration: Duration(milliseconds: ttl), vsync: this);

    itemOffsetAnimation = Tween(begin: 0.0, end: 1.0).animate(itemController)
      ..addListener(updateItemOffset);

    blurBtnController =
        AnimationController(duration: Duration(milliseconds: ttl), vsync: this);
    focusBtnController =
        AnimationController(duration: Duration(milliseconds: ttl), vsync: this);
    blurBtnColor = ColorTween(begin: blurColor, end: focusColor)
        .animate(blurBtnController);
    focusBtnColor = ColorTween(begin: focusColor, end: blurColor)
        .animate(focusBtnController)
      ..addListener(updateView);

    blurItemController =
        AnimationController(duration: Duration(milliseconds: ttl), vsync: this);
    focusItemController = AnimationController(
      duration: Duration(milliseconds: ttl),
      vsync: this,
    );

    blurItemScale = Tween(begin: blurScale, end: focusScale)
        .chain(CurveTween(
          curve: Curves.easeInOut,
        ))
        .animate(blurItemController)
      ..addListener(updateView);
    focusItemScale = Tween(begin: focusScale, end: blurScale)
        .chain(CurveTween(
          curve: Curves.easeInOut,
        ))
        .animate(focusItemController)
      ..addListener(updateView);

    currentIndex.addListener(setNextItemOffset);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _width = (context.findRenderObject() as RenderBox).size.width;
        initItemOffset();
      });
    });
  }

  Color get focusColor {
    if (widget.$props.isOutside || widget.$props.isCard) {
      return ColorUtil.hexToColor('#c0c4cc');
    }
    return Colors.white;
  }

  Color get blurColor {
    if (widget.$props.isOutside || widget.$props.isCard) {
      return ColorUtil.hexToColor('#c0c4cc').withAlpha(255 * 0.48 ~/ 1);
    }
    return Colors.white54;
  }

  double get focusScale {
    return 0.83;
  }

  double get blurScale {
    return 0.7;
  }

  setNextItemOffset() {
    for (var i = 0; i < items.length; i++) {
      var value = (i - acturalCurrent) * itemWidth;
      if (nextItemOffset.length == i) {
        nextItemOffset.add(value);
      } else {
        nextItemOffset[i] = value;
      }
    }
    lastItemOffset = itemOffset.sublist(0);
    itemController.forward(from: 0);
    blurBtnController.reverse(from: 1);
    focusBtnController.reverse(from: 1);
    blurItemController.reverse(from: 1);
    focusItemController.reverse(from: 1);
    updateView();
  }

  double get itemWidth {
    return widget.$props.isCard ? _width * .83 : _width * 1;
  }

  double get acturalCurrent {
    var acturalCurrent = currentIndex.value % items.length;
    return acturalCurrent + 0.0;
  }

  initItemOffset() {
    for (var i = 0; i < items.length; i++) {
      if (itemOffset.length == i) {
        itemOffset.add(itemWidth * i);
      } else {
        itemOffset[i] = itemWidth * i;
      }
    }
    lastItemOffset = itemOffset.sublist(0);
  }

  updateItemOffset() {
    for (var i = 0; i < itemOffset.length; i++) {
      var offset = lastItemOffset[i] +
          (nextItemOffset[i] - lastItemOffset[i]) * itemOffsetAnimation.value;

      itemOffset[i] = offset > itemWidth * (itemOffset.length - 1)
          ? offset - itemOffset.length * itemWidth
          : offset;
    }
    updateView();
  }

  updateView() {
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    arrowOffset.removeListener(updateView);
    itemOffsetAnimation.removeListener(updateItemOffset);
    arrowController.dispose();
    itemController.dispose();
    currentIndex.dispose();

    blurBtnController.dispose();
    focusBtnController.dispose();

    blurItemController.dispose();
    focusItemController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => arrowController.forward(),
      onExit: (event) => arrowController.reverse(),
      child: widget.$props.isOutside
          ? Column(
              children: [inner, nav],
            )
          : inner,
    );
  }

  Widget get inner {
    var itemList = List.generate(items.length, (index) {
      var offset = Transform.translate(
        offset: Offset(itemOffset[index], 0),
        child: SizedBox(height: height, child: items[index]),
      );
      return widget.$props.isCard
          ? Transform.scale(
              scale: acturalCurrent == index
                  ? focusItemScale.value
                  : lastIndex == index
                      ? blurItemScale.value
                      : blurScale,
              child: offset,
            )
          : offset;
    });
    var zIndexHigh = itemList[acturalCurrent.toInt()];
    itemList.remove(zIndexHigh);
    itemList.add(zIndexHigh);
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ClipRect(
        child: Stack(
          alignment: FractionalOffset(.6, .5),
          children: [
            ...itemList,
            ...arrow,
            if (!widget.$props.isOutside) nav,
          ],
        ),
      ),
    );
  }

  Widget get nav {
    var handles = List.generate(items.length, (index) {
      return Listener(
        onPointerHover: (e) {
          lastIndex = currentIndex.value.toInt();
          currentIndex.value = index;
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4.0, 12.0, 4.0, 12.0),
          child: ColoredBox(
            color: acturalCurrent == index
                ? focusBtnColor.value ?? focusColor
                : lastIndex == index
                    ? blurBtnColor.value ?? blurColor
                    : blurColor,
            child: const SizedBox(
              width: 30,
              height: 2,
            ),
          ),
        ),
      );
    });
    return Row(
      children: [
        Expanded(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: handles,
            mainAxisSize: MainAxisSize.min,
          ),
        ))
      ],
    );
  }

  List get items {
    return widget.$slots.defaultSlot ?? [];
  }

  List<Widget> get arrow {
    return [
      Positioned(
        left: arrowOffset.value,
        top: height != null ? height! / 2 - 15 : 0,
        child: Opacity(
          opacity: arrowOpacity.value,
          child: WButton(
            on: WButtonOn(click: () {
              lastIndex = currentIndex.value.toInt();
              currentIndex.value--;
            }),
            slots: WButtonSlot(
              Icons.arrow_back_ios_rounded,
            ),
            props: WButtonProp(
              circle: true,
              plain: true,
              size: 'mini',
            ),
          ),
        ),
      ),
      Positioned(
        right: arrowOffset.value,
        top: height != null ? height! / 2 - 15 : 0,
        child: Opacity(
          opacity: arrowOpacity.value,
          child: WButton(
            on: WButtonOn(click: () {
              lastIndex = currentIndex.value.toInt();
              currentIndex.value++;
            }),
            slots: WButtonSlot(
              Icons.arrow_forward_ios,
            ),
            props: WButtonProp(
              circle: true,
              plain: true,
              size: 'mini',
            ),
          ),
        ),
      )
    ];
  }

  double? get height {
    return widget.$style.height ?? cfgGlobal.carousel.height;
  }
}

class WCarouselOn extends BaseOn {
  Function(int, int)? change;
}

class WCarouselProp extends BaseProp {
  late String? height;
  late int initialIndex;
  late String trigger;
  late bool autoplay;
  late double interval;
  late String indicatorPosition;
  late String arrow;
  late String? type;
  late bool loop;
  late Axis direction;

  WCarouselProp({
    this.height,
    this.initialIndex = 0,
    this.trigger = 'click',
    this.autoplay = true,
    this.interval = 3000,
    this.indicatorPosition = 'none',
    this.arrow = 'hover',
    this.type,
    this.loop = true,
    this.direction = Axis.horizontal,
  });

  get isOutside {
    return indicatorPosition == 'outside';
  }

  get isCard {
    return type == 'card';
  }

  get isArrowAlways {
    return arrow == 'always';
  }
}

class WCarouselSlot extends BaseSlot {
  WCarouselSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WCarouselItem extends StatefulWidget
    implements
        BaseWidget<WCarouselItemOn, WCarouselItemProp, WCarouselItemSlot,
            WCarouselItemStyle> {
  @override
  late final WCarouselItemOn $on;

  @override
  late final WCarouselItemProp $props;

  @override
  late final WCarouselItemSlot $slots;

  @override
  late final WCarouselItemStyle $style;

  WCarouselItem({
    Key? key,
    WCarouselItemOn? on,
    WCarouselItemProp? props,
    WCarouselItemSlot? slots,
    WCarouselItemStyle? style,
  }) : super(key: key) {
    $on = on ?? WCarouselItemOn();
    $props = props ?? WCarouselItemProp();
    $slots = slots ?? WCarouselItemSlot(null);
    $style = style ?? WCarouselItemStyle();
  }
  @override
  State<WCarouselItem> createState() => _WCarouselItemState();
}

class _WCarouselItemState extends State<WCarouselItem> {
  @override
  Widget build(BuildContext context) {
    return widget.$slots.defaultSlot!.first;
  }
}

class WCarouselItemOn extends BaseOn {}

class WCarouselItemProp extends BaseProp {
  late String? name;
  late String? label;
  WCarouselItemProp({this.name, this.label});
}

class WCarouselItemSlot extends BaseSlot {
  WCarouselItemSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
