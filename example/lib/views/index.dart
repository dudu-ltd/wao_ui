import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:example/package/basic/api_container_layout.dart';
import 'package:example/package/Index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/src/basic/w_container_layout.dart';
import 'package:wao_ui/src/tree/tree.dart';
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
import 'package:example/package/navigation/api_nav_menu.dart';
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

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);
  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late BuildContext navContext;

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
    'WNavMenu': ApiNavMenu(),
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
    return (BuildContext nContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      navContext = nContext;
      return _route[routeName] ?? const Index();
    };
  }

  Navigator createNav() {
    return Navigator(
      // Navigator
      initialRoute: 'WUpload',
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

  @override
  Widget build(BuildContext context) {
    Navigator nav = createNav();
    return Scaffold(
      body: WContainerLayout(
        slots: WContainerLayoutSlot(
          nav,
          asideLeft: SingleChildScrollView(
            child: PlainTree(
              on: PlainTreeOn(
                nodeClick: (ctx, node) {
                  return () {
                    if (!kIsWeb) (appWindow.title = node.text);
                    Navigator.pushNamed(navContext, node.id);
                  };
                },
              ),
              props: PlainTreeProp(
                data: [
                  {
                    "id": "basic",
                    "text": "basic",
                    "children": [
                      {"id": "WButton", "text": "WButton", "finish": true},
                      {
                        "id": "WContainerLayout",
                        "text": "WContainerLayout",
                        "finish": true
                      }
                    ]
                  },
                  {
                    "id": "data",
                    "text": "data",
                    "children": [
                      {"id": "WAvatar", "text": "WAvatar"},
                      {"id": "WBadge", "text": "WBadge"},
                      {"id": "WDescriptions", "text": "WDescriptions"},
                      {"id": "WEmpty", "text": "WEmpty"},
                      {"id": "WPagination", "text": "WPagination"},
                      {"id": "WProgress", "text": "WProgress"},
                      {"id": "WResult", "text": "WResult"},
                      {"id": "WSkeleton", "text": "WSkeleton"},
                      {"id": "WTable", "text": "WTable"},
                      {"id": "WTag", "text": "WTag"},
                      {"id": "WTree", "text": "WTree"}
                    ]
                  },
                  {
                    "id": "form",
                    "text": "form",
                    "children": [
                      {"id": "WCascader", "text": "WCascader"},
                      {"id": "WCheckbox", "text": "WCheckbox"},
                      {"id": "WColorPicker", "text": "WColorPicker"},
                      {"id": "WDatePicker", "text": "WDatePicker"},
                      {"id": "WDateTimePicker", "text": "WDateTimePicker"},
                      {"id": "WInputNumber", "text": "WInputNumber"},
                      {"id": "WInput", "text": "WInput"},
                      {"id": "WRadio", "text": "WRadio"},
                      {"id": "WRate", "text": "WRate"},
                      {"id": "WSelect", "text": "WSelect"},
                      {"id": "WSlider", "text": "WSlider"},
                      {"id": "WSwitch", "text": "WSwitch"},
                      {"id": "WTimePicker", "text": "WTimePicker"},
                      {"id": "WTransfer", "text": "WTransfer"},
                      {"id": "WUpload", "text": "WUpload"}
                    ]
                  },
                  {
                    "id": "navigation",
                    "text": "navigation",
                    "children": [
                      {"id": "WBreadcrumb", "text": "WBreadcrumb"},
                      {"id": "WDropdown", "text": "WDropdown"},
                      {"id": "WNavMenu", "text": "WNavMenu"},
                      {"id": "WPageHeader", "text": "WPageHeader"},
                      {"id": "WSteps", "text": "WSteps"},
                      {"id": "WTabs", "text": "WTabs"}
                    ]
                  },
                  {
                    "id": "notice",
                    "text": "notice",
                    "children": [
                      {"id": "WAlert", "text": "WAlert"},
                      {"id": "WLoading", "text": "WLoading"},
                      {"id": "WMessage", "text": "WMessage"},
                      {"id": "WMessageBox", "text": "WMessageBox"},
                      {"id": "WNotification", "text": "WNotification"}
                    ]
                  },
                  {
                    "id": "opengl",
                    "text": "opengl",
                    "children": [
                      {"id": "ApiGl", "text": "ApiGl"},
                    ]
                  },
                  {
                    "id": "others",
                    "text": "others",
                    "children": [
                      {"id": "WBacktop", "text": "WBacktop"},
                      {"id": "WCalendar", "text": "WCalendar"},
                      {"id": "WCard", "text": "WCard"},
                      {"id": "WCarousel", "text": "WCarousel"},
                      {"id": "WCollapse", "text": "WCollapse"},
                      {"id": "WDialog", "text": "WDialog"},
                      {"id": "WDivider", "text": "WDivider"},
                      {"id": "WDrawer", "text": "WDrawer"},
                      {"id": "WImage", "text": "WImage"},
                      {"id": "WInfiniteScroll", "text": "WInfiniteScroll"},
                      {"id": "WPopconfirm", "text": "WPopconfirm"},
                      {"id": "WPopover", "text": "WPopover"},
                      {"id": "WTimeline", "text": "WTimeline"},
                      {"id": "WTooltip", "text": "WTooltip"}
                    ]
                  }
                ],
              ),
            ),
          ),
        ),
        props: WContainerLayoutProp(
          leftJudge: true,
          asideLeftMinWidth: 200.0,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
