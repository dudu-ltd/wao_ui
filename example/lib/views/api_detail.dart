import 'dart:convert';
import 'package:example/demo/demos.dart';
import 'package:example/demo/regist_material.dart';
import 'package:example/demo/regist_waoui.dart';
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
  late String path;
  ApiDetail({Key? key, required this.name, this.path = 'assets/md/'})
      : super(key: key);
}

class _ApiDetailState extends State<ApiDetail>
    with AutomaticKeepAliveClientMixin {
  Widget content = Container();
  late ScrollController scrollCtrl;
  late Widget snap = Container();
  GlobalKey? lastKey;

  _registerDemo(context) {
    registWaoUI();
    registMaterial(context);
  }

  @override
  void initState() {
    scrollCtrl = ScrollController();
    // _setRefBuild();
    _registerDemo(context);
    rootBundle.load("${widget.path}${widget.name}.md").then(
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
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (demo.title != null)
                ColoredBox(
                  color: Colors.black12,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: SelectableText(
                        demo.title!,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              borderWrapper(
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(child: demo.widget),
                ),
                Border.fromBorderSide(BorderSide(color: Colors.grey.shade300)),
                false,
              ),
              code(
                  '${demo.code.trim().startsWith('class') ? '' : '    '}${demo.code.trim()}'),
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
    super.build(context);
    return WScrollSnap(key: lastKey)
      ..$slots.content = Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: shadowWrapper(content),
      );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
