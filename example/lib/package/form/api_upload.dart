// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wao_ui/core/utils/layout_util.dart';
import 'package:wao_ui/wao_ui.dart';
import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';

class ApiUpload extends StatelessWidget {
  ApiUpload({Key? key}) : super(key: key);

  final Widget ____________________________________ = const SizedBox(
    height: 10,
    width: 1,
  );

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

  handleRemove(file, fileList) {
    print(file);
    print(fileList);
  }

  handlePreview(file) {
    print(file);
  }

  handleExceed(files, fileList) {
    print(
        r'当前限制选择 3 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件');
  }

  beforeRemove(file, fileList) {
    print('确定移除 ${file.name}？');
    return true;
  }

  Widget get addBtn {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(70),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: CfgGlobal.disabledColor,
          style: BorderStyle.none,
        ),
      ),
      child: const Icon(
        Icons.add,
        color: Colors.grey,
        size: 40,
      ),
    );
  }

  Widget get clickUpload {
    return WUpload(
      props: WUploadProp(
        action: 'https://jsonplaceholder.typicode.com/posts/',
        accept: '  txt,  jpeg',
        onPreview: handlePreview,
        onRemove: handleRemove,
        beforeRemove: beforeRemove,
        multiple: true,
        limit: 3,
        onExceed: handleExceed,
        fileList: fileList,
      ),
      slots: WUploadSlot(
        WButton(
          props: WButtonProp(type: 'primary'),
          slots: WButtonSlot('点击上传'),
        ),
        tip: const Text('只能上传jpg/png文件，且不超过500kb'),
      ),
    );
  }

  String imageUrl = '';

  handleAvatarSuccess(res, file, files) {
    imageUrl = '';
  }

  beforeAvatarUpload(file, files) {
    var isJPG = file.type == 'image/jpeg';
    var isLt2M = file.size / 1024 / 1024 < 2;

    if (!isJPG) {
      print('上传头像图片只能是 JPG 格式!');
    }
    if (!isLt2M) {
      print('上传头像图片大小不能超过 2MB!');
    }
    return isJPG && isLt2M;
  }

  Widget get img {
    return Image.network(imageUrl);
  }

  Widget get userAvatorUpload {
    return WUpload(
      props: WUploadProp(
        action: 'https://jsonplaceholder.typicode.com/posts/',
        showFileList: false,
        onSuccess: handleAvatarSuccess,
        beforeUpload: beforeAvatarUpload,
      ),
      slots: WUploadSlot(
        StatefulBuilder(builder: (context, setState) {
          return imageUrl.isNotEmpty ? img : addBtn;
        }),
      ),
    );
  }

  String dialogImageUrl = '';
  bool dialogVisible = false;

  handlePictureCardPreview(file) {
    dialogImageUrl = file.url;
    dialogVisible = true;
  }

  WDialog dialog = WDialog();

  Widget get photoWall {
    return Column(
      children: [
        WUpload(
          props: WUploadProp(
            action: 'https://jsonplaceholder.typicode.com/posts/',
            listType: 'pictureCard',
            onPreview: handlePreview,
            onRemove: handleRemove,
          ),
          slots: WUploadSlot(const Icon(Icons.add)),
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
    );
  }

  Widget get filePreview {
    return Column(
      children: [
        WUpload(
          props: WUploadProp(
            action: '#',
            listType: 'picture-card',
            autoUpload: false,
          ),
          slots: WUploadSlot(const Icon(Icons.add), file: (file) {
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
    );
  }

  Widget get picListPreview {
    return WUpload(
      props: WUploadProp(
        action: '#',
        onPreview: handlePreview,
        onRemove: handleRemove,
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
    );
  }

  handleChange(file, fileList) {
    this.fileList = fileList.slice(-3);
  }

  Widget get fileListControl {
    return WUpload(
      props: WUploadProp(
        action: '#',
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
    );
  }

  Widget get dragUpload {
    return WUpload(
      props: WUploadProp(
        action: '#',
        drag: true,
        multiple: true,
      ),
      slots: WUploadSlot(
        Column(
          children: const [
            Icon(Icons.drag_handle),
            Text('将文件拖到此处，或点击上传'),
          ],
        ),
        tip: const Text('只能上传jpg/png文件，且不超过500kb'),
      ),
    );
  }

  submitUpload() {
    upload.submit();
  }

  late WUpload upload;
  Widget get autoUploadFalse {
    return upload = WUpload(
      props: WUploadProp(
        action: '#',
        onPreview: handlePreview,
        onRemove: handleRemove,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    var paddingRight = MediaQuery.of(context).size.width * .6;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(right: paddingRight),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('WUpload'),
              ____________________________________,
              const Text('点击上传'),
              ____________________________________,
              clickUpload,
              ____________________________________,
              const Text('用户头像上传'),
              ____________________________________,
              userAvatorUpload,
              ____________________________________,
              const Text('照片墙'),
              ____________________________________,
              photoWall,
              ____________________________________,
              const Text('文件缩略图'),
              ____________________________________,
              filePreview,
              ____________________________________,
              const Text('图片列表缩略图'),
              ____________________________________,
              picListPreview,
              ____________________________________,
              const Text('上传文件列表控制'),
              ____________________________________,
              fileListControl,
              ____________________________________,
              const Text('拖拽上传'),
              ____________________________________,
              dragUpload,
              ____________________________________,
              const Text('手动上传'),
              ____________________________________,
              autoUploadFalse,
              ____________________________________,
            ],
          ),
        ),
      ),
    );
  }
}
