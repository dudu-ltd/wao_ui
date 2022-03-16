import 'dart:convert';

import 'package:example/demo/button/_index.dart' as button;
import 'package:example/demo/demos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_md/flutter_md.dart';
import 'package:wao_ui/core/utils/wrapper.dart';

import '../package/basic/api_button.dart';

class ApiDetail extends StatefulWidget {
  @override
  State<ApiDetail> createState() => _ApiDetailState();
  String name;

  ApiDetail({Key? key, required this.name}) : super(key: key);
}

class _ApiDetailState extends State<ApiDetail> {
  Widget content = Container();

  _registerDemo() {
    button.regist();
  }

  @override
  void initState() {
    _setRefBuild();
    _registerDemo();
    rootBundle.load("assets/md/${widget.name}.md").then(
      (bytes) {
        final buffer = bytes.buffer;
        var list = buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
        var text = utf8.decode(list);
        setState(() {
          content = SingleChildScrollView(
            child: ColoredBox(
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 870,
                  child: MdRoot(content: text),
                ),
              ),
            ),
          );
        });
      },
    );
    super.initState();
  }

  _setRefBuild() {
    MarkdownBuilder.$refBuild = (name) {
      var demo = demos[name];
      if (demo != null) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: shadowWrapper(
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  demo.widget,
                  // SelectableText(demo.code),
                ],
              ),
            ),
          ),
        );
      }
      return Container();
    };
  }

  @override
  Widget build(BuildContext context) {
    return content;
  }
}
