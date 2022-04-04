import 'dart:convert';
import 'package:example/demo/progress/_index.dart' as progress;
import 'package:example/demo/datePicker/_index.dart' as date_picker;
import 'package:example/demo/tag/_index.dart' as tag;
import 'package:example/demo/skeleton/_index.dart' as skeleton;
import 'package:example/demo/result/_index.dart' as result;
import 'package:example/demo/cascader/_index.dart' as cascader;
import 'package:example/demo/tree/_index.dart' as tree;
import 'package:example/demo/inputNumber/_index.dart' as input_number;
import 'package:example/demo/select/_index.dart' as select;
import 'package:example/demo/dateTimePicker/_index.dart' as date_time_picker;
import 'package:example/demo/upload/_index.dart' as upload;
import 'package:example/demo/radio/_index.dart' as radio;
import 'package:example/demo/pageHeader/_index.dart' as page_header;
import 'package:example/demo/slider/_index.dart' as slider;
import 'package:example/demo/tabs/_index.dart' as tabs;
import 'package:example/demo/input/_index.dart' as input;
import 'package:example/demo/timePicker/_index.dart' as time_picker;
import 'package:example/demo/checkbox/_index.dart' as checkbox;
import 'package:example/demo/message/_index.dart' as message;
import 'package:example/demo/timeline/_index.dart' as timeline;
import 'package:example/demo/dialog/_index.dart' as dialog;
import 'package:example/demo/notification/_index.dart' as notification;
import 'package:example/demo/rate/_index.dart' as rate;
import 'package:example/demo/popover/_index.dart' as popover;
import 'package:example/demo/divider/_index.dart' as divider;
import 'package:example/demo/transfer/_index.dart' as transfer;
import 'package:example/demo/colorPicker/_index.dart' as color_picker;
import 'package:example/demo/card/_index.dart' as card;
import 'package:example/demo/calendar/_index.dart' as calendar;
import 'package:example/demo/swatch/_index.dart' as swatch;
import 'package:example/demo/collapse/_index.dart' as collapse;
import 'package:example/demo/backtop/_index.dart' as backtop;
import 'package:example/demo/infiniteScroll/_index.dart' as infinite_scroll;
import 'package:example/demo/messageBox/_index.dart' as message_box;
import 'package:example/demo/breadcrumb/_index.dart' as breadcrumb;
import 'package:example/demo/steps/_index.dart' as steps;
import 'package:example/demo/dropdown/_index.dart' as dropdown;
import 'package:example/demo/popconfirm/_index.dart' as popconfirm;
import 'package:example/demo/alert/_index.dart' as alert;
import 'package:example/demo/tooltip/_index.dart' as tooltip;
import 'package:example/demo/carousel/_index.dart' as carousel;
import 'package:example/demo/image/_index.dart' as image;
import 'package:example/demo/loading/_index.dart' as loading;
import 'package:example/demo/button/_index.dart' as button;
import 'package:example/demo/container/_index.dart' as container;
import 'package:example/demo/drawer/_index.dart' as drawer;
import 'package:example/demo/avatar/_index.dart' as avatar;
import 'package:example/demo/badge/_index.dart' as badge;
import 'package:example/demo/descriptions/_index.dart' as descriptions;
import 'package:example/demo/pagination/_index.dart' as pagination;
import 'package:example/demo/empty/_index.dart' as empty;
import 'package:example/demo/table/_index.dart' as table;
import 'package:example/demo/demos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart' as md;
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';
import '../third_party/syntax_highlight.dart';

class ApiDetail extends StatefulWidget {
  @override
  State<ApiDetail> createState() => _ApiDetailState();
  String name;
  ApiDetail({Key? key, required this.name}) : super(key: key);
}

class _ApiDetailState extends State<ApiDetail> {
  Widget content = Container();
  late ScrollController scrollCtrl;
  late Widget snap = Container();
  GlobalKey? lastKey;

  _registerDemo() {
    button.regist();
    container.regist();
    drawer.regist();
    avatar.regist();
    badge.regist();
    descriptions.regist();
    pagination.regist();
    empty.regist();

    progress.regist();
    date_picker.regist();
    tag.regist();
    skeleton.regist();
    result.regist();
    cascader.regist();
    tree.regist();
    input_number.regist();
    select.regist();
    date_time_picker.regist();
    upload.regist();
    radio.regist();
    page_header.regist();
    slider.regist();
    tabs.regist();
    input.regist();
    time_picker.regist();
    checkbox.regist();
    message.regist();

    timeline.regist();
    dialog.regist();
    notification.regist();
    popover.regist();
    transfer.regist();
    color_picker.regist();
    card.regist();
    calendar.regist();
    swatch.regist();
    collapse.regist();
    backtop.regist();
    infinite_scroll.regist();
    message_box.regist();
    breadcrumb.regist();
    steps.regist();
    dropdown.regist();
    popconfirm.regist();
    alert.regist();
    tooltip.regist();
    carousel.regist();
    image.regist();
    loading.regist();
    rate.regist();
    divider.regist();
    table.regist();
  }

  @override
  void initState() {
    scrollCtrl = ScrollController();
    // _setRefBuild();
    _registerDemo();
    rootBundle.load("assets/md/${widget.name}.md").then(
      (bytes) {
        final buffer = bytes.buffer;
        var list = buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
        var text = utf8.decode(list);
        setState(() {
          content = ColoredBox(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 870,
                  child: md.MarkdownBody(
                    data: text,
                    styleSheet: getMdStyle(),
                    namedCodeBlockBuilder: {
                      'widget': widgetCodeBlockBuilder,
                      'widgets': widgetsCodeBlockBuilder,
                      'widgetsRow': widgetsRowCodeBlockBuilder,
                    },
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
    super.initState();
  }

  getMdStyle() {
    return md.MarkdownStyleSheet(
      h1Align: WrapAlignment.end,
      h1: const TextStyle(fontSize: 26, height: 1.8),
      h2: const TextStyle(fontSize: 24, height: 1.7),
      h3: const TextStyle(fontSize: 22, height: 1.6),
      h4: const TextStyle(fontSize: 20, height: 1.5),
      h5: const TextStyle(fontSize: 18, height: 1.4),
      h6: const TextStyle(fontSize: 16, height: 1.3),
      textAlign: WrapAlignment.start,
      code: const TextStyle(
          color: Colors.blue,
          backgroundColor: Colors.transparent,
          wordSpacing: 8,
          height: 1,
          textBaseline: TextBaseline.ideographic),
      blockquotePadding: const EdgeInsets.fromLTRB(20, 8, 24, 8),
      blockquoteDecoration: BoxDecoration(
        border:
            Border(left: BorderSide(width: 4, color: CfgGlobal.primaryColor)),
        color: CfgGlobal.primaryColor.shade50,
      ),
    );
  }

  // MdTheme get mdTheme {
  //   return MdTheme();
  // }
  widgetsCodeBlockBuilder(name) {
    var names = name.toString().split(',');
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      children: List.generate(
          names.length,
          (index) => FractionallySizedBox(
                widthFactor: .5,
                child: widgetCodeBlockBuilder(names[index]),
              )),
    );
  }

  widgetsRowCodeBlockBuilder(name) {
    var names = name.toString().split(',');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(names.length, (index) {
        var widgetCodeBlockBuilder2 = widgetCodeBlockBuilder(names[index]);
        return Expanded(child: widgetCodeBlockBuilder2);
      }),
    );
  }

  Widget widgetCodeBlockBuilder(name) {
    var demo = demos[name];
    if (demo != null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: shadowWrapper(
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              borderWrapper(
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(child: demo.widget),
                ),
                Border.fromBorderSide(BorderSide(color: Colors.grey.shade300)),
                false,
              ),
              code(demo.code),
            ],
          ),
        ),
      );
    }
    return Container();
  }
  // _setRefBuild() {
  //   Md.namedHandles.putIfAbsent(
  //     'widget',
  //     () => nameCodeBlockBuild,
  //   );
  // }

  Widget code(String source) {
    TextSpan result = SyntaxHighlighter(source: source).highlight(context);
    var richText = SelectableText.rich(result);
    return borderWrapper(
      Container(
        padding: const EdgeInsets.all(20),
        width: 870,
        color: Colors.grey.shade100,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: scrollCtrl,
          child: richText,
        ),
      ),
      Border.fromBorderSide(BorderSide(color: Colors.grey.shade300)),
      true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WScrollSnap(key: lastKey)
      ..$slots.content = Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: shadowWrapper(content),
      );
  }
}
