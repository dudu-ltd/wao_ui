import 'dart:convert';

import 'package:example/demo/button/_index.dart' as button;
import 'package:example/demo/container/_index.dart' as container;
import 'package:example/demo/drawer/_index.dart' as drawer;
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
                    namedCodeBlockBuilder: {'widget': nameCodeBlockBuild},
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
      textAlign: WrapAlignment.start,
      code: const TextStyle(
          color: Colors.blue,
          backgroundColor: Colors.transparent,
          wordSpacing: 8,
          height: 1,
          textBaseline: TextBaseline.ideographic),
      blockquotePadding:
          const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
  nameCodeBlockBuild(name) {
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
                  child: demo.widget,
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
