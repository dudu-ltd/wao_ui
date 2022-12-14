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
          initialRoute: '/basic/WButton',
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
      'text': '????????????',
      "children": [
        {"id": "all", "text": "????????????"},
      ]
    },
    {
      'id': 'basic',
      'text': '????????????',
      "children": [
        {
          "id": "button",
          "text": "??????",
          "children": [
            {"id": "all", "text": "??????"},
            {"id": "button", "text": "??????"},
          ]
        },
      ]
    },
    {
      'id': 'display',
      'text': '????????????',
      "children": [
        {"id": "DataTable", "text": "??????"},
        {"id": "GridTile", "text": "??????????????????????????????"},
        {"id": "ListTile", "text": "????????????"},
        {"id": "Progress", "text": "?????????"},
        {"id": "UserAccountsDrawerHeader", "text": "??????????????????"},
      ]
    },
    {
      'id': 'navigation',
      'text': '??????',
      "children": [
        {"id": "NavigationBar", "text": "?????????"},
        {"id": "NavigationRail", "text": "????????????"},
        {"id": "PlatformMenuBar", "text": "??????"},
        {"id": "PopupMenuButton", "text": "????????????"},
        {"id": "Stepper", "text": "?????????"},
        {"id": "Tabs", "text": "?????????"},
      ]
    },
    {
      'id': 'feedback',
      'text': '??????',
      "children": [
        {"id": "SnackBar", "text": "????????????"},
        {"id": "Tooltip", "text": "???????????????"},
      ]
    },
    {
      'id': 'form',
      'text': '??????',
      "children": [
        {"id": "Autocomplete", "text": "???????????????"},
        {"id": "Checkbox", "text": "??????"},
        {"id": "DateTime", "text": "???????????????"},
        {"id": "Input", "text": "?????????"},
        {"id": "Radio", "text": "??????"},
        {"id": "Select", "text": "???????????????"},
        {"id": "Slider", "text": "??????"},
        {"id": "Swatch", "text": "??????"},
      ]
    }
  ];
}

List<Map<String, dynamic>> get waouiGuideData {
  return [
    {
      "id": "about",
      "text": "??????",
      "children": [
        {"id": "about/conscience", "text": "??????"},
        {"id": "about/thinking", "text": "????????????"},
        {"id": "about/plan", "text": "????????????"},
        {"id": "about/introduce", "text": "????????????"},
      ]
    },
    {
      "id": "basic",
      "text": "????????????",
      "children": [
        {"id": "WButton", "text": "??????", "finish": true},
        {"id": "WContainer", "text": "??????", "finish": true}
      ]
    },
    {
      "id": "data",
      "text": "??????",
      "children": [
        {"id": "WAvatar", "text": "??????", "finish": true},
        {"id": "WBadge", "text": "??????", "finish": true},
        {"id": "WDescriptions", "text": "????????????"},
        {"id": "WEmpty", "text": "?????????", "finish": true},
        {"id": "WPagination", "text": "??????", "finish": true},
        {"id": "WProgress", "text": "?????????", "finish": true},
        {"id": "WResult", "text": "??????", "finish": true},
        {"id": "WSkeleton", "text": "????????????"},
        {"id": "WTable", "text": "??????", 'finish': true},
        {"id": "WTag", "text": "??????", "finish": true},
        {"id": "WTree", "text": "???"}
      ]
    },
    {
      "id": "form",
      "text": "??????",
      "children": [
        {"id": "WForm", "text": "??????"},
        {"id": "WCascader", "text": "???????????????", 'finish': true},
        {"id": "WCheckbox", "text": "??????", 'finish': true},
        {"id": "WColorPicker", "text": "???????????????"},
        {"id": "WDatePicker", "text": "???????????????"},
        {"id": "WDateTimePicker", "text": "?????????????????????"},
        {"id": "WInputNumber", "text": "???????????????", 'finish': true},
        {"id": "WInput", "text": "?????????", 'finish': true},
        {"id": "WRadio", "text": "??????", 'finish': true},
        {"id": "WRate", "text": "??????"},
        {"id": "WSelect", "text": "?????????", 'finish': true},
        {"id": "WSlider", "text": "????????????", "finish": true},
        {"id": "WSwitch", "text": "??????", "finish": true},
        {"id": "WTimePicker", "text": "???????????????"},
        {"id": "WTransfer", "text": "?????????"},
        {"id": "WUpload", "text": "????????????", "finish": true}
      ]
    },
    {
      "id": "navigation",
      "text": "??????",
      "children": [
        {"id": "WBreadcrumb", "text": "?????????", "finish": true},
        {"id": "WDropdown", "text": "????????????", "finish": true},
        {"id": "WMenu", "text": "??????", "finish": true},
        {"id": "WPageHeader", "text": "??????"},
        {"id": "WSteps", "text": "??????"},
        {"id": "WTabs", "text": "Tab ???", "finish": true},
      ]
    },
    {
      "id": "notice",
      "text": "??????/??????",
      "children": [
        {"id": "WAlert", "text": "?????????", "finish": true},
        {"id": "WLoading", "text": "?????????"},
        {"id": "WMessage", "text": "??????"},
        {"id": "WMessageBox", "text": "?????????"},
        {"id": "WNotification", "text": "????????????"}
      ]
    },
    {
      "id": "others",
      "text": "??????",
      "children": [
        {"id": "WBacktop", "text": "????????????"},
        {"id": "WCalendar", "text": "??????"},
        {"id": "WCard", "text": "??????", 'finish': true},
        {"id": "WCarousel", "text": "?????????", 'finish': true},
        {"id": "WCollapse", "text": "????????????"},
        {"id": "WDialog", "text": "??????", 'finish': true},
        {"id": "WDivider", "text": "?????????"},
        {"id": "WDrawer", "text": "??????"},
        {"id": "WImage", "text": "??????"},
        {"id": "WInfiniteScroll", "text": "????????????"},
        {"id": "WPopconfirm", "text": "?????????"},
        {"id": "WPopover", "text": "WPopover"},
        {"id": "WTimeline", "text": "?????????"},
        {"id": "WTooltip", "text": "??????"}
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
      // 150ms ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
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
                    child: Text('Copyright ?? 2021-present, Weicheng Ye'))),
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
