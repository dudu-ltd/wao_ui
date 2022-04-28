import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wao_ui/core/theme/element/theme_element.dart';
import 'package:wao_ui/src/form/w_input.dart';
import 'package:wao_ui/src/form/w_upload.dart';
import 'package:wao_ui/wao_ui.dart';

void main() {
  String imageUrl = '';
  late Uint8List bytes = Uint8List.fromList([]);

  addBtn() {
    return Container(
      key: GlobalKey(),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(75),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: CfgGlobal.disabledColor,
          style: BorderStyle.solid,
        ),
      ),
      child: const Icon(
        Icons.add,
        color: Colors.grey,
        size: 28,
      ),
    );
  }

  img() {
    if (imageUrl.isNotEmpty) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: CfgGlobal.disabledColor,
            style: BorderStyle.solid,
          ),
        ),
        child: WHoverHandle(
          props: WHoverHandleProp(handles: <IconAndEvent>[
            IconAndEvent(
              icon: Icon(Icons.zoom_in, color: Colors.white),
              event: () {
                print('zoom_in');
              },
            ),
            IconAndEvent(
              icon: Icon(Icons.delete_outline_outlined, color: Colors.white),
              event: () {
                print('add');
              },
            ),
          ]),
          slots: WHoverHandleSlot(
            ConstrainedBox(
              key: GlobalKey(),
              constraints: BoxConstraints(maxHeight: 178),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.memory(
                  bytes,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Image.memory(bytes);
    }
  }

  testWidgets('test upload', (WidgetTester tester) async {
    element();
    late WUpload userAvator;

    var input = StatefulBuilder(
      builder: (context, setState) {
        return userAvator = WUpload(
          props: WUploadProp(
            action: 'http://localhost:8080/upload/single',
            showFileList: false,
            onSuccess: ((res, file, fileList) {
              imageUrl =
                  'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100';
              bytes = file;
              setState(() {});
            }),
            onError: (a, b, c) {
              print(a);
            },
            beforeUpload: ((ByteFile file, files) {
              var isJPG = file.name.endsWith('jpg');
              var isLt2M = file.bytes.length / 1024 / 1024 < 2;

              if (!isJPG) {
                print('上传头像图片只能是 JPG 格式!');
              }
              if (!isLt2M) {
                print('上传头像图片大小不能超过 2MB!');
              }
              return isJPG && isLt2M;
            }),
          ),
          slots: WUploadSlot(
            StatefulBuilder(builder: (context, setState) {
              return imageUrl.isNotEmpty || bytes.isNotEmpty ? img() : addBtn();
            }),
          ),
        );
      },
    );

    await tester.pumpWidget(MaterialApp(home: Scaffold(body: input)));
    await tester.tap(find.byType(WUpload));

    // expect(find.byType(Icon), findsNWidgets(4));
  });
}
