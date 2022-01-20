// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:wao_ui/src/basic/w_button.dart';

class WPagination extends StatefulWidget
    implements
        BaseWidget<WPaginationOn, WPaginationProp, WPaginationSlot,
            WPaginationStyle> {
  @override
  late final WPaginationOn $on;
  @override
  late final WPaginationProp $props;
  @override
  late final WPaginationSlot $slots;
  @override
  late WPaginationStyle $style;

  WPagination({
    Key? key,
    WPaginationOn? on,
    WPaginationProp? props,
    WPaginationSlot? slots,
    WPaginationStyle? style,
  }) : super(key: key) {
    $on = on ?? WPaginationOn();
    $props = props ?? WPaginationProp();
    $slots = slots ?? WPaginationSlot(null);
    $style = style ?? WPaginationStyle();
  }

  @override
  _WPaginationState createState() => _WPaginationState();
}

class _WPaginationState extends State<WPagination> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.$props.showTotal) total,
        if (widget.$props.showSizes) sizes,
        if (widget.$props.showPrev) prev,
        ...pager,
        if (widget.$props.showNext) next,
        if (widget.$props.showJumper) jumper,
      ],
    );
  }

  Widget buttonWrapper(
    dynamic btn,
    Function? c, {
    bool disabled = false,
    bool loading = false,
    bool active = false,
  }) {
    return WButton(
      slots: WButtonSlot(btn),
      props: WButtonProp(
        size: 'mini',
        type: widget.$props.background ? 'primary' : 'text',
        disabled: disabled,
        loading: loading,
        active: active,
      ),
      on: WButtonOn(click: c),
    );
  }

  jumpPage(newCurrengPage) {
    setState(() {
      if (newCurrengPage < 1) newCurrengPage = 1;
      if (newCurrengPage > widget.$props.totalPage) {
        newCurrengPage = widget.$props.totalPage;
      }
      widget.$props.currentPage = newCurrengPage;
      widget.$on.currentChange.call(widget.$props.currentPage);
    });
  }

  nextPage() => jumpPage(++widget.$props.currentPage);

  prevPage() => jumpPage(--widget.$props.currentPage);

  Widget currentPage(btnPage) {
    MaterialColor pkc = cfgGlobal.color.val('primary');
    return Text(
      '${btnPage}',
      style: TextStyle(
        color: widget.$props.background ? Colors.white : pkc,
      ),
    );
  }

  void addNextPagerBtn(List<Widget> pagerGroup) {
    addPagerBtn(
      '···',
      widget.$props.currentPage + widget.$props.middleSpan,
      pagerGroup,
      false,
    );
  }

  void addPrevPagerBtn(List<Widget> pagerGroup) {
    addPagerBtn(
      '···',
      widget.$props.currentPage - widget.$props.middleSpan,
      pagerGroup,
      false,
    );
  }

  void addPagerBtn(btnPage, toPage, List<Widget> pagerGroup, bool disabled) {
    pagerGroup.add(
      buttonWrapper(
        btnPage is Widget ? btnPage : '${btnPage}',
        () => jumpPage(toPage),
        disabled: disabled,
        loading: disabled,
        active: disabled && widget.$props.background,
      ),
    );
  }

  Widget get total {
    return Text(
      '共${widget.$props.total}条',
      style: TextStyle(color: cfgGlobal.pagination.totalColor),
    );
  }

  // TODO 等表单组件可以测试时，补充实现
  Widget get sizes {
    return Text('${widget.$props.pageSize}条/页');
  }

  Widget get prev {
    return buttonWrapper(
      Icon(
        Icons.arrow_back_ios_rounded,
        size: 19,
        color: widget.$props.background
            ? cfgGlobal.color.val('primary')
            : cfgGlobal.color.val('info'),
      ),
      prevPage,
    );
  }

  List<Widget> get pager {
    var pagerGroup = <Widget>[];
    var prevDot = false;
    var nextDot = false;
    List.generate(
      widget.$props.totalPage,
      (index) {
        var btnPage = index + 1;
        if ((widget.$props.middleRange[0] < btnPage &&
                btnPage < widget.$props.middleRange[1]) ||
            btnPage == 1 ||
            btnPage == widget.$props.totalPage) {
          addPagerBtn(
            btnPage == widget.$props.currentPage
                ? currentPage(btnPage)
                : btnPage,
            btnPage,
            pagerGroup,
            btnPage == widget.$props.currentPage,
          );
        } else if (btnPage <= widget.$props.middleRange[0] && !prevDot) {
          addPrevPagerBtn(pagerGroup);
          prevDot = true;
        } else if (btnPage >= widget.$props.middleRange[1] && !nextDot) {
          addNextPagerBtn(pagerGroup);
          nextDot = true;
        }
      },
    );
    return pagerGroup;
  }

  Widget get next {
    return buttonWrapper(
      Icon(
        Icons.arrow_forward_ios_rounded,
        size: 19,
        color: widget.$props.background
            ? cfgGlobal.color.val('primary')
            : cfgGlobal.color.val('info'),
      ),
      nextPage,
    );
  }

  // TODO 等表单组件可以测试时，补充实现
  Widget get jumper {
    return const Text('前往');
  }
}

class WPaginationOn extends BaseOn {
  late Function(dynamic) sizeChange;
  late Function(dynamic) currentChange;
  late Function(dynamic) prevClick;
  late Function(dynamic) nextClick;
  WPaginationOn({sizeChange, currentChange, prevClick, nextClick}) {
    this.sizeChange = sizeChange ?? (d) {};
    this.currentChange = currentChange ?? (d) {};
    this.prevClick = prevClick ?? (d) {};
    this.nextClick = nextClick ?? (d) {};
  }
}

class WPaginationProp extends BaseProp {
  late bool small;
  late bool background;
  late int pageSize;
  late int total;
  late int pageCount;
  late int pagerCount;
  late int currentPage;
  late String layout;
  late List<int> pageSizes;
  late String popperClass;
  String? prevText;
  String? nextText;
  late bool disabled;
  late bool hideOnSinglePage;

  WPaginationProp({
    small,
    background,
    pageSize,
    total,
    pageCount,
    pagerCount,
    currentPage,
    layout,
    pageSizes,
    popperClass,
    prevText,
    nextText,
    disabled,
    hideOnSinglePage,
  }) {
    this.small = small ?? false;
    this.background = background ?? false;
    this.pageSize = pageSize ?? 10;
    this.total = total ?? 0;
    this.pageCount = pageCount ?? 0;
    this.pagerCount = pagerCount ?? 7;
    this.currentPage = currentPage ?? 1;
    this.layout = layout ?? 'prev, pager, next, jumper, ->, total';
    this.pageSizes = pageSizes ?? [];
    this.popperClass = popperClass ?? '';
    this.prevText = prevText;
    this.nextText = nextText;
    this.disabled = disabled ?? false;
    this.hideOnSinglePage = hideOnSinglePage ?? false;
  }

  bool get showSizes {
    return layout.contains('sizes');
  }

  bool get showPrev {
    return layout.contains('prev') && currentPage != 1;
  }

  bool get showPager {
    return layout.contains('pager');
  }

  bool get showNext {
    return layout.contains('next') && currentPage != totalPage;
  }

  bool get showJumper {
    return layout.contains('jumper');
  }

  bool get showGo {
    return layout.contains('->');
  }

  bool get showTotal {
    return layout.contains('total');
  }

  List<String> get layoutArr {
    return layout.split('\\s{0,},\\s{0,}');
  }

  int get totalPage {
    if (total < 0) return 1;
    if (total % pageSize == 0) return total ~/ pageSize;
    return total ~/ pageSize + 1;
  }

  int get middleSpan {
    return pagerCount - 2;
  }

  int get offset {
    return (pagerCount - 1) ~/ 2;
  }

  List<int> get middleRange {
    var left = currentPage - offset;
    var right = currentPage + offset;
    if (left <= 1) {
      right = pagerCount;
      left = 1;
    } else if (right >= totalPage) {
      right = totalPage;
      left = right - pagerCount + 1;
    }
    return [left, right];
  }
}

class WPaginationSlot extends BaseSlot {
  Widget Function(int, WPagination?)? pager;
  Widget Function(int, WPagination?)? total;
  Widget Function(int, WPagination?)? sizes;
  Widget? prev;
  Widget? next;
  Widget Function(int, WPagination?)? jumper;

  WPaginationSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
