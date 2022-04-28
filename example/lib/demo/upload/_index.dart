import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

List fileList = [
  {
    "name": "foo33333333333d.jpeg",
    "url":
        "https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100"
  },
  {
    "name": "food2.jpeg",
    "url":
        "https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100"
  }
];
regist() {
  var uploadBasic = Demo(
    'uploadBasic',
    WUpload()
      ..$props.action = 'http://localhost:8080/upload/single'
      ..$props.accept = '  txt,  jpeg, jpg, png'
      ..$props.onPreview = ((file) => print(file))
      ..$props.onRemove = ((file, fileList) {
        print(file);
        print(fileList);
      })
      ..$props.beforeRemove = ((file, fileList) {
        print('确定移除 ${file.name}？');
        return true;
      })
      ..$props.multiple = true
      ..$props.limit = 3
      ..$props.onExceed = ((files, fileList) => print(
          r'当前限制选择 3 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件'))
      ..$props.fileList = fileList
      ..$slots.tip = const Text('只能上传jpg/png文件，且不超过500kb')
      ..$slots.$ = WButton(
        props: WButtonProp(type: 'primary'),
        slots: WButtonSlot('点击上传'),
      ),
    r'''
  
    ''',
  );

  String imageUrl = '';
  late Uint8List bytes = Uint8List.fromList([]);

  late WUpload userAvator;

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

  var uploadUserAvatar = Demo(
    'uploadUserAvatar',
    StatefulBuilder(
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
            }).builder.call(context, setState),
          ),
        );
      },
    ),
    r'''
  
    ''',
  );

  String dialogImageUrl = '';
  bool dialogVisible = false;
  var uploadPhotoWall = Demo(
    'uploadPhotoWall',
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WUpload(
          props: WUploadProp(
            action: 'http://localhost:8080/upload/single',
            listType: 'picture-card',
            onPreview: ((file) => print(file)),
            onRemove: ((file, fileList) {
              print(file);
              print(fileList);
            }),
          ),
          slots: WUploadSlot(addBtn()),
        ),
        WDialog(
          props: WDialogProp(
            visible: dialogVisible,
          ),
          slots: WDialogSlot(
            Image.network(dialogImageUrl),
          ),
        ),
      ],
    ),
    r'''
  
    ''',
  );

  var uploadFilePreview = Demo(
    'uploadFilePreview',
    SizedBox(
      child: Column(
        children: [
          WUpload(
            props: WUploadProp(
              action: 'http://localhost:8080/upload/single',
              listType: 'picture-card',
              autoUpload: false,
            ),
            slots: WUploadSlot(addBtn(), file: (file) {
              return Stack(
                children: [
                  Image.network(file),
                  // TODO 补充几个操作按钮
                ],
              );
            }),
          ),
          WDialog(
            props: WDialogProp(
              visible: dialogVisible,
            ),
            slots: WDialogSlot(
              Image.network(dialogImageUrl),
            ),
          ),
        ],
      ),
    ),
    r'''
  
    ''',
  );

  var uploadPicList = Demo(
    'uploadPicList',
    WUpload(
      props: WUploadProp(
        action: 'http://localhost:8080/upload/single',
        onPreview: ((file) => print(file)),
        onRemove: ((file, fileList) {
          print(file);
          print(fileList);
        }),
        fileList: fileList,
        listType: 'picture',
      ),
      slots: WUploadSlot(
        WButton(
          props: WButtonProp(type: 'primary'),
          slots: WButtonSlot('点击上传'),
        ),
        tip: const Text('只能上传jpg/png文件，且不超过500kb'),
      ),
    ),
    r'''
  
    ''',
  );

  handleChange(file, fileList) {
    fileList = fileList.slice(-3);
  }

  var uploadFileControl = Demo(
    'uploadFileControl',
    WUpload(
      props: WUploadProp(
        action: 'http://localhost:8080/upload/single',
        onChange: handleChange,
        fileList: fileList,
      ),
      slots: WUploadSlot(
        WButton(
          props: WButtonProp(type: 'primary', size: 'smell'),
          slots: WButtonSlot('点击上传'),
        ),
        tip: const Text('只能上传jpg/png文件，且不超过500kb'),
      ),
    ),
    r'''
  
    ''',
  );

  var uploadDrag = Demo(
    'uploadDrag',
    WUpload(
      props: WUploadProp(
        action: 'http://localhost:8080/upload/single',
        drag: true,
        multiple: true,
      ),
      slots: WUploadSlot(
        Column(
          children: const [
            Icon(Icons.upload),
            Text('将文件拖到此处，或点击上传'),
          ],
        ),
        tip: const Text('只能上传jpg/png文件，且不超过500kb'),
      ),
    ),
    r'''
  
    ''',
  );

  late WUpload upload;
  submitUpload() {
    upload.submit();
  }

  var uploadAutoFalse = Demo(
    'uploadAutoFalse',
    upload = WUpload(
      props: WUploadProp(
        action: '#',
        onPreview: ((file) => print(file)),
        onRemove: ((file, fileList) {
          print(file);
          print(fileList);
        }),
        fileList: fileList,
        autoUpload: false,
      ),
      slots: WUploadSlot(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            WButton(
              props: WButtonProp(type: 'success'),
              on: WButtonOn(click: submitUpload),
              slots: WButtonSlot('上传到服务器'),
            ),
          ],
        ),
        tip: const Text('只能上传jpg/png文件，且不超过500kb'),
        trigger: WButton(
          props: WButtonProp(type: 'primary'),
          slots: WButtonSlot('点击上传'),
        ),
      ),
    ),
    r'''
  
    ''',
  );
}
