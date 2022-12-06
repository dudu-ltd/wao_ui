import 'dart:async';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:example/views/demo.dart';
import 'package:example/views/header.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/core/env.dart';
import 'package:wao_ui/wao_ui.dart';

import 'api_detail.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);
  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: 3,
        vsync: this,
        initialIndex: 1,
        animationDuration: Duration.zero);
  }

  Widget get tabBars {
    return Align(
      alignment: Alignment.centerRight,
      child: TabBar(
        isScrollable: true,
        controller: tabController,
        tabs: const [
          Tab(
            text: 'DEMO',
          ),
          Tab(
            text: 'WaoUI Api',
          ),
          Tab(
            text: 'Flutter Api',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var tabView = TabBarView(
      controller: tabController,
      children: [
        Demo(),
        ApiPage(
          guideData: waouiGuideData,
          path: 'assets/md/waoui',
          initialRoute: '/data/WTable',
        ),
        ApiPage(
          guideData: materialGuideData,
          path: 'assets/md/material',
          initialRoute: '/form/DateTime',
        ),
      ],
    );
    return WFrame()
      ..$props.showWindowTitleBarBox = false
      ..$slots.header = const Text('WaoUI')
      ..$slots.main = Scaffold(
        appBar: AppBar(
          title: Header(child: tabBars),
          actions: [
            if (isPc) ...[
              MinimizeWindowButton(
                animate: true,
              ),
              MaximizeWindowButton(
                animate: true,
              ),
              CloseWindowButton(
                animate: true,
              ),
            ]
          ],
        ),
        body: tabView,
      );
  }

  Widget get logoZoom {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            WImage()..$props.src = 'assets:logo.png',
            Text(
              '   WaoUI',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: CfgGlobal.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> get materialGuideData {
  return [
    {
      'id': 'quick_start',
      'text': '快速开始',
      "children": [
        {"id": "all", "text": "组件总览"},
      ]
    },
    {
      'id': 'basic',
      'text': '基本使用',
      "children": [
        {
          "id": "button",
          "text": "按钮",
          "children": [
            {"id": "all", "text": "概览"},
            {"id": "button", "text": "按钮"},
          ]
        },
      ]
    },
    {
      'id': 'display',
      'text': '数据展示',
      "children": [
        {"id": "DataTable", "text": "表格"},
        {"id": "GridTile", "text": "类公众号文章卡片元素"},
        {"id": "ListTile", "text": "列表元素"},
        {"id": "Progress", "text": "进度条"},
        {"id": "UserAccountsDrawerHeader", "text": "用户账号信息"},
      ]
    },
    {
      'id': 'navigation',
      'text': '导航',
      "children": [
        {"id": "NavigationBar", "text": "导航栏"},
        {"id": "NavigationRail", "text": "侧边导航"},
        {"id": "PlatformMenuBar", "text": "菜单"},
        {"id": "PopupMenuButton", "text": "弹出菜单"},
        {"id": "Stepper", "text": "步骤条"},
        {"id": "Tabs", "text": "标签页"},
      ]
    },
    {
      'id': 'feedback',
      'text': '反馈',
      "children": [
        {"id": "SnackBar", "text": "横幅提示"},
        {"id": "Tooltip", "text": "鼠标提示语"},
      ]
    },
    {
      'id': 'form',
      'text': '表单',
      "children": [
        {"id": "Autocomplete", "text": "可搜索下拉"},
        {"id": "Checkbox", "text": "复选"},
        {"id": "DateTime", "text": "日期与时间"},
        {"id": "Input", "text": "输入域"},
        {"id": "Radio", "text": "单选"},
        {"id": "Select", "text": "选择下拉框"},
        {"id": "Slider", "text": "滑块"},
        {"id": "Swatch", "text": "开关"},
      ]
    }
  ];
}

List<Map<String, dynamic>> get waouiGuideData {
  return [
    {
      "id": "about",
      "text": "关于",
      "children": [
        {"id": "about/conscience", "text": "本心"},
        {"id": "about/thinking", "text": "设计思路"},
        {"id": "about/plan", "text": "开源计划"},
        {"id": "about/introduce", "text": "项目介绍"},
      ]
    },
    {
      "id": "basic",
      "text": "常用组件",
      "children": [
        {"id": "WButton", "text": "按钮", "finish": true},
        {"id": "WContainer", "text": "布局", "finish": true}
      ]
    },
    {
      "id": "data",
      "text": "展示",
      "children": [
        {"id": "WAvatar", "text": "头像", "finish": true},
        {"id": "WBadge", "text": "角标", "finish": true},
        {"id": "WDescriptions", "text": "对象描述"},
        {"id": "WEmpty", "text": "空提醒", "finish": true},
        {"id": "WPagination", "text": "分页", "finish": true},
        {"id": "WProgress", "text": "进度条", "finish": true},
        {"id": "WResult", "text": "结果", "finish": true},
        {"id": "WSkeleton", "text": "页面骨架"},
        {"id": "WTable", "text": "表格", 'finish': true},
        {"id": "WTag", "text": "标签", "finish": true},
        {"id": "WTree", "text": "树"}
      ]
    },
    {
      "id": "form",
      "text": "表单",
      "children": [
        {"id": "WForm", "text": "表单"},
        {"id": "WCascader", "text": "级联选择器", 'finish': true},
        {"id": "WCheckbox", "text": "复选", 'finish': true},
        {"id": "WColorPicker", "text": "颜色选择器"},
        {"id": "WDatePicker", "text": "日期选择器"},
        {"id": "WDateTimePicker", "text": "日期时间选择器"},
        {"id": "WInputNumber", "text": "数字输入框", 'finish': true},
        {"id": "WInput", "text": "输入框", 'finish': true},
        {"id": "WRadio", "text": "单选", 'finish': true},
        {"id": "WRate", "text": "评分"},
        {"id": "WSelect", "text": "下拉框", 'finish': true},
        {"id": "WSlider", "text": "滑动设值", "finish": true},
        {"id": "WSwitch", "text": "开关", "finish": true},
        {"id": "WTimePicker", "text": "时间选择器"},
        {"id": "WTransfer", "text": "穿梭框"},
        {"id": "WUpload", "text": "文件上传", "finish": true}
      ]
    },
    {
      "id": "navigation",
      "text": "导航",
      "children": [
        {"id": "WBreadcrumb", "text": "面包屑", "finish": true},
        {"id": "WDropdown", "text": "下拉菜单", "finish": true},
        {"id": "WMenu", "text": "菜单", "finish": true},
        {"id": "WPageHeader", "text": "表头"},
        {"id": "WSteps", "text": "步骤"},
        {"id": "WTabs", "text": "Tab 页", "finish": true},
      ]
    },
    {
      "id": "notice",
      "text": "通知/消息",
      "children": [
        {"id": "WAlert", "text": "对话框", "finish": true},
        {"id": "WLoading", "text": "加载中"},
        {"id": "WMessage", "text": "提醒"},
        {"id": "WMessageBox", "text": "消息窗"},
        {"id": "WNotification", "text": "消息提醒"}
      ]
    },
    {
      "id": "others",
      "text": "其他",
      "children": [
        {"id": "WBacktop", "text": "回到顶部"},
        {"id": "WCalendar", "text": "日历"},
        {"id": "WCard", "text": "卡片", 'finish': true},
        {"id": "WCarousel", "text": "走马灯", 'finish': true},
        {"id": "WCollapse", "text": "折叠面板"},
        {"id": "WDialog", "text": "弹窗", 'finish': true},
        {"id": "WDivider", "text": "分隔线"},
        {"id": "WDrawer", "text": "抽屉"},
        {"id": "WImage", "text": "图片"},
        {"id": "WInfiniteScroll", "text": "无限下拉"},
        {"id": "WPopconfirm", "text": "确认框"},
        {"id": "WPopover", "text": "WPopover"},
        {"id": "WTimeline", "text": "时间轴"},
        {"id": "WTooltip", "text": "提示"}
      ]
    }
  ];
}

class ApiPage extends StatefulWidget {
  List<Map<String, dynamic>> guideData;
  String path;
  String initialRoute;
  ApiPage({
    Key? key,
    required this.guideData,
    required this.initialRoute,
    this.path = 'assets/md/',
  }) : super(key: key);

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  BuildContext? navContext;
  Map<String, RoutePageBuilder> cache = {};

  Navigator createNav() {
    return Navigator(
      // Navigator
      initialRoute: widget.initialRoute,
      onGenerateRoute: (val) {
        RoutePageBuilder builder = getNext(val.name!);
        return PageRouteBuilder(
          pageBuilder: builder,
          // transitionDuration: const Duration(milliseconds: 0),
        );
      },
      onUnknownRoute: (val) {
        debugPrint('$val');
        return null;
      },
      observers: <NavigatorObserver>[],
    );
  }

  var guideContext = null;
  var guideSetState = null;
  var currentName = null;

  RoutePageBuilder getNext(String routeName) {
    return cache.putIfAbsent(
        routeName,
        () => (BuildContext nContext, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              navContext = nContext;
              return ApiDetail(
                name: routeName,
                path: widget.path,
              );
            });
  }

  Widget get guideNew {
    var theme = Theme.of(context);
    return StatefulBuilder(builder: (context, setState) {
      guideContext = context;
      guideSetState = setState;
      return Material(
        color: Colors.white,
        child: Column(children: [
          // logoZoom,
          ...guideDataToWidget(widget.guideData),
        ]),
      );
    });
  }

  TextStyle navTextStyle(int i) {
    var theme = Theme.of(context);
    var textStyles = [
      theme.textTheme.titleMedium,
      theme.textTheme.titleSmall,
      theme.textTheme.bodyLarge,
      theme.textTheme.bodyMedium,
      theme.textTheme.bodySmall,
    ];
    var levelStyle = i < textStyles.length ? textStyles[i]! : textStyles.last!;
    return levelStyle.copyWith(fontWeight: FontWeight.bold);
  }

  List<Widget> guideDataToWidget(data, {level = 0, preId = ''}) {
    if (data == null) return List.empty();
    var result = <Widget>[];
    for (var i = 0; i < data.length; i++) {
      var node = data[i];
      var text = '${' ' * level}${node['text']}';
      if (node['children'] is List) {
        List<Widget> children = guideDataToWidget(
          node['children'],
          level: level + 1,
          preId: '$preId/${node['id']}',
        );
        result.add(
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                text,
                style: navTextStyle(level),
              ),
              children: children,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: Text(
          //       node['text'],
          //       style: theme.textTheme.titleLarge
          //           ?.copyWith(fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
        );
      } else {
        result.add(
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            onTap: () => to(node['text'], fileId(preId, node['id'])),
            title: Text(text, style: const TextStyle(fontSize: 14)),
            // subtitle: Text(node['id']),
            trailing: (node['finish'] is bool && node['finish'])
                ? Icon(Icons.check, color: CfgGlobal.successColor)
                : null,
            selected: currentName == fileId(preId, node['id']),
          ),
        );
      }
    }
    return result;
  }

  String fileId(String folderName, String fileName) {
    return fileName.startsWith(folderName) ? fileName : '$folderName/$fileName';
  }

  to(String name, String id) {
    if (currentName == id) return;
    currentName = id;
    if (isPc) (appWindow.title = name);
    if (navContext != null) {
      // 150ms 避免切换路由时，按钮的水波纹卡顿，造成程序卡顿的视觉效果。部分延迟感官上显得更流畅。
      Timer(Duration(milliseconds: 150), () {
        // Navigator.maybePop(navContext!);
        Navigator.pushNamed(navContext!, id);
      });
      guideSetState?.call(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1360),
        child: WContainerLayout(
          slots: WContainerLayoutSlot(
            createNav(),
            footer: ColoredBox(
                color: Colors.grey.shade50,
                child: const Center(
                    child: Text('Copyright © 2021-present, Weicheng Ye'))),
            asideLeft: SingleChildScrollView(
              child: guideNew,
            ),
          ),
          props: WContainerLayoutProp(
            leftJudge: true,
            asideLeftMinWidth: 200.0,
            asideRightWidth: 46.0,
            footerHeight: 30.0,
          ),
        ),
      ),
    );
  }
}
