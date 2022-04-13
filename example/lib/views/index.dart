import 'dart:async';
import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:example/package/basic/api_container_layout.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/core/env.dart';
import 'package:example/package/basic/api_button.dart';
import 'package:example/package/data/api_avatar.dart';
import 'package:example/package/data/api_badge.dart';
import 'package:example/package/data/api_descriptions.dart';
import 'package:example/package/data/api_empty.dart';
import 'package:example/package/data/api_pagination.dart';
import 'package:example/package/data/api_progress.dart';
import 'package:example/package/data/api_result.dart';
import 'package:example/package/data/api_skeleton.dart';
import 'package:example/package/data/api_table.dart';
import 'package:example/package/data/api_tag.dart';
import 'package:example/package/data/api_tree.dart';
import 'package:example/package/form/api_cascader.dart';
import 'package:example/package/form/api_checkbox.dart';
import 'package:example/package/form/api_color_picker.dart';
import 'package:example/package/form/api_date_picker.dart';
import 'package:example/package/form/api_date_time_picker.dart';
import 'package:example/package/form/api_input_number.dart';
import 'package:example/package/form/api_input.dart';
import 'package:example/package/form/api_radio.dart';
import 'package:example/package/form/api_rate.dart';
import 'package:example/package/form/api_select.dart';
import 'package:example/package/form/api_slider.dart';
import 'package:example/package/form/api_switch.dart';
import 'package:example/package/form/api_time_picker.dart';
import 'package:example/package/form/api_transfer.dart';
import 'package:example/package/form/api_upload.dart';
import 'package:example/package/navigation/api_breadcrumb.dart';
import 'package:example/package/navigation/api_dropdown.dart';
import 'package:example/package/navigation/api_menu.dart';
import 'package:example/package/navigation/api_page_header.dart';
import 'package:example/package/navigation/api_steps.dart';
import 'package:example/package/navigation/api_tabs.dart';
import 'package:example/package/notice/api_alert.dart';
import 'package:example/package/notice/api_loading.dart';
import 'package:example/package/notice/api_message.dart';
import 'package:example/package/notice/api_message_box.dart';
import 'package:example/package/notice/api_notification.dart';
import 'package:example/package/others/api_backtop.dart';
import 'package:example/package/others/api_calendar.dart';
import 'package:example/package/others/api_card.dart';
import 'package:example/package/others/api_carousel.dart';
import 'package:example/package/others/api_collapse.dart';
import 'package:example/package/others/api_dialog.dart';
import 'package:example/package/others/api_divider.dart';
import 'package:example/package/others/api_drawer.dart';
import 'package:example/package/others/api_image.dart';
import 'package:example/package/others/api_infinite_scroll.dart';
import 'package:example/package/others/api_popconfirm.dart';
import 'package:example/package/others/api_popover.dart';
import 'package:example/package/others/api_timeline.dart';
import 'package:example/package/others/api_tooltip.dart';
import 'package:wao_ui/wao_ui.dart';

import 'api_detail.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);
  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  BuildContext? navContext;
  Map<String, RoutePageBuilder> cache = {};

  static final Map<String, Widget> _route = {
    'WButton': ApiButton(),
    'WContainerLayout': ApiContainerLayout(),
    'WAvatar': ApiAvatar(),
    'WBadge': ApiBadge(),
    'WDescriptions': ApiDescriptions(),
    'WEmpty': ApiEmpty(),
    'WPagination': ApiPagination(),
    'WProgress': ApiProgress(),
    'WResult': ApiResult(),
    'WSkeleton': ApiSkeleton(),
    'WTable': ApiTable(),
    'WTag': ApiTag(),
    'WTree': ApiTree(),
    'WCascader': ApiCascader(),
    'WCheckbox': ApiCheckbox(),
    'WColorPicker': ApiColorPicker(),
    'WDatePicker': ApiDatePicker(),
    'WDateTimePicker': ApiDateTimePicker(),
    'WInputNumber': ApiInputNumber(),
    'WInput': ApiInput(),
    'WRadio': ApiRadio(),
    'WRate': ApiRate(),
    'WSelect': ApiSelect(),
    'WSlider': ApiSlider(),
    'WSwitch': ApiSwitch(),
    'WTimePicker': ApiTimePicker(),
    'WTransfer': ApiTransfer(),
    'WUpload': ApiUpload(),
    'WBreadcrumb': ApiBreadcrumb(),
    'WDropdown': ApiDropdown(),
    'WMenu': ApiMenu(),
    'WPageHeader': ApiPageHeader(),
    'WSteps': ApiSteps(),
    'WTabs': ApiTabs(),
    'WAlert': ApiAlert(),
    'WLoading': ApiLoading(),
    'WMessage': ApiMessage(),
    'WMessageBox': ApiMessageBox(),
    'WNotification': ApiNotification(),
    'WBacktop': ApiBacktop(),
    'WCalendar': ApiCalendar(),
    'WCard': ApiCard(),
    'WCarousel': ApiCarousel(),
    'WCollapse': ApiCollapse(),
    'WDialog': ApiDialog(),
    'WDivider': ApiDivider(),
    'WDrawer': ApiDrawer(),
    'WImage': ApiImage(),
    'WInfiniteScroll': ApiInfiniteScroll(),
    'WPopconfirm': ApiPopconfirm(),
    'WPopover': ApiPopover(),
    'WTimeline': ApiTimeline(),
    'WTooltip': ApiTooltip(),
    // 'ApiGl': ApiGl(),
  };

  RoutePageBuilder getNext(String routeName) {
    return cache.putIfAbsent(
        routeName,
        () => (BuildContext nContext, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              navContext = nContext;
              // return _route[routeName.split('/')[1]]!;
              return ApiDetail(name: routeName);
            });
  }

  Navigator createNav() {
    return Navigator(
      // Navigator
      initialRoute: 'data/WAvatar',
      onGenerateRoute: (val) {
        RoutePageBuilder builder = getNext(val.name!);
        return PageRouteBuilder(
          pageBuilder: builder,
          // transitionDuration: const Duration(milliseconds: 0),
        );
      },
      onUnknownRoute: (val) {
        print(val);
      },
      observers: <NavigatorObserver>[],
    );
  }

  to(String name, String id) {
    if (currentName == id) return;
    currentName = id;
    if (isPc) (appWindow.title = name);
    if (navContext != null) {
      Timer(Duration(milliseconds: 150), () {
        // Navigator.maybePop(navContext!);
        Navigator.pushNamed(navContext!, id);
      });
      guideSetState?.call(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Navigator nav = createNav();
    var activeIndex = '1';
    var activeIndex2 = '2';

    var handleClose = (key, keyPath) {
      print('$key $keyPath');
    };
    var handleOpen = (key, keyPath) {
      print('$key $keyPath');
    };
    return WFrame()
      ..$slots.header = Text('WaoUI')
      ..$slots.main = Scaffold(
        appBar: AppBar(
          title: Text(currentName ?? ''),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1360),
            child: WContainerLayout(
              slots: WContainerLayoutSlot(
                nav,
                footer: ColoredBox(
                    color: Colors.grey.shade50,
                    child: const Center(
                        child: Text('Copyright © 2021-present, Weicheng Ye'))),
                asideLeft: SingleChildScrollView(
                  child: guide,
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
        ),
      );
  }

  Widget get guide {
    return guideNew;
  }

  var guideContext;
  var guideSetState;
  var currentName = null;

  Widget get guideNew {
    var theme = Theme.of(context);
    return StatefulBuilder(builder: (context, setState) {
      guideContext = context;
      guideSetState = setState;
      var menu = guideData;
      return Material(
        color: Colors.white,
        child: Column(children: [
          logoZoom,
          ...guideDataToWidget(guideData),
        ]),
      );
    });
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Text('快速开始', style: theme.textTheme.headline6),
    //     ...List.generate(buttons.length, (index) {
    //       return WButton()
    //         ..$props.round = true
    //         ..$props.plain = true
    //         ..$props.type = 'success'
    //         ..style.borderWidth = 0
    //         ..style.marginTop = 5
    //         ..$slots.$ = buttons[index]
    //         ..$on.click = () => to(buttons[index], buttons[index]);
    //     })
    //   ],
    // );
  }

  List<Widget> guideDataToWidget(data, {level = 0, preId = ''}) {
    var theme = Theme.of(context);
    if (data == null) return List.empty();
    var result = <Widget>[];
    for (var i = 0; i < data.length; i++) {
      var node = data[i];
      if (level == 0) {
        result.add(Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              node['text'],
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ));
      } else {
        // createMd(preId, node['id']).then((e) {});
        // createDemo(preId, node['id']).then((e) {});
        result.add(ListTile(
          onTap: () => to(node['text'], fileId(preId, node['id'])),
          title: Text(node['text']),
          subtitle: Text(node['id']),
          trailing: (node['finish'] is bool && node['finish'])
              ? Icon(Icons.check, color: CfgGlobal.successColor)
              : null,
          selected: currentName == fileId(preId, node['id']),
        ));
      }
      if (node['children'] is List) {
        var children = guideDataToWidget(node['children'],
            level: level + 1, preId: '$preId${node['id']}');
        result.addAll(children);
      }
    }
    return result;
  }

  String fileId(String folderName, String fileName) {
    return fileName.startsWith(folderName) ? fileName : '$folderName/$fileName';
  }

  createMd(String folderName, String fileName) async {
    var basePath = 'D:/work/meta_number/wao_ui/example/assets/md';
    var dirPath = '$basePath/$folderName';
    var dir = Directory(dirPath);
    bool exists = await dir.exists();
    if (!exists) {
      await dir.create();
    }
    var filePath = '${fileId(folderName, fileName)}.md';
    var file = File('$basePath/$filePath');
    var fileExists = file.existsSync();
    if (!fileExists) {
      // file.create();
    }
    print('    - assets/md/$filePath');
    // print('$folderName  file: $filePath exists $fileExists');
  }

  createDemo(String folderName, String dirName) async {
    var basePath = 'D:/work/meta_number/wao_ui/example/lib/demo';
    var a = dirName.substring(1).substring(0, 1).toLowerCase() +
        dirName.substring(2);
    a = a == 'switch' ? 'swatch' : a;
    var dirPath = 'D:/work/meta_number/wao_ui/example/lib/demo/$a';
    var dir = Directory(dirPath);
    bool exists = await dir.exists();
    if (!exists) {
      await dir.create();
      var file = File('$dirPath/_index.dart');
      await file.create();
      file.writeAsString(r'''import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {}''');
      print('import \'package:example/demo/$a/_index.dart\' as $a;');
      print('$a.regist();');
    }
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

  List<Map<String, dynamic>> get guideData {
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
          {"id": "WUpload", "text": "文件上传"}
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
          {"id": "WAlert", "text": "对话框"},
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
          {"id": "WDialog", "text": "弹窗"},
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

  // Widget get guideOld {
  //   return PlainTree(
  //     on: PlainTreeOn(
  //       nodeClick: (ctx, node) {
  //         return () {
  //           to(node.text, node.id);
  //         };
  //       },
  //     ),
  //     props: PlainTreeProp(
  //       data: guideData,
  //     ),
  //   );
  // }
}
