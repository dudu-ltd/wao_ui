// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';
import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';

class WUpload
    extends WStatefulWidget<WUploadOn, WUploadProp, WUploadSlot, WUploadStyle> {
  late _WUploadState state;

  WUpload({
    Key? key,
    WUploadOn? on,
    WUploadProp? props,
    WUploadSlot? slots,
    WUploadStyle? style,
  }) : super(key: key) {
    $on = on ?? WUploadOn();
    $props = props ?? WUploadProp();
    $slots = slots ?? WUploadSlot(null);
    $style = style ?? WUploadStyle();
    init();
  }

  @override
  State<WUpload> createState() => _WUploadState();

  clearFiles() {}
  abort() {}
  submit() {}
}

class _WUploadState extends WState<WUpload> {
  @override
  void initState() {
    super.initState();
    widget.state = this;
  }

  @override
  Widget wbuild(BuildContext context) {
    var tip = widget.$slots.tip != null
        ? Padding(
            padding: const EdgeInsets.only(top: 7),
            child: widget.$slots.tip!,
          )
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.$props.listTypePictureCard
          ? [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (widget.$props.showFileList && fileListWidget.isNotEmpty)
                    ...fileListWidget,
                  trigger,
                ],
              ),
              if (tip != null) tip,
            ]
          : [
              trigger,
              if (tip != null) tip,
              if (widget.$props.showFileList) ...fileListWidget,
            ],
    );
  }

  bindPicker(Widget child, List<Widget> _triggers) {
    if (child is WButton) {
      _triggers.add(child);
      child.$on.click = triggerAction;
    } else {
      _triggers.add(InkWell(
        key: GlobalKey(),
        child: child,
        onTap: () {
          triggerAction.call();
        },
      ));
    }
  }

  Widget get trigger {
    var _triggers = <Widget>[];
    if (widget.$slots.trigger != null) {
      bindPicker(widget.$slots.trigger!, _triggers);
    }

    if (widget.defaultSlot.isNotEmpty) {
      for (var child in widget.defaultSlot) {
        if (widget.$slots.trigger == null) {
          bindPicker(child, _triggers);
        } else {
          _triggers.add(child);
        }
      }
    }

    return dragWrapper(Row(
      key: GlobalKey(),
      mainAxisSize: MainAxisSize.min,
      children: _triggers,
    ));
  }

  bool _dragging = false;

  FilePickerResult toFilePickerResult(List<PlatformFile> files) {
    return FilePickerResult(files);
  }

  Future<PlatformFile> xFileToPlatformFile(dynamic file) async {
    return PlatformFile(
        name: file.name,
        size: (await file.readAsBytes()).length,
        path: file.path);
  }

  Future<List<PlatformFile>> xFilesToPlatformFiles(List files) async {
    var pfiles = <PlatformFile>[];
    for (var file in files) {
      var pfile = await xFileToPlatformFile(file);
      pfiles.add(pfile);
    }
    return pfiles;
  }

  Widget dragWrapper(Widget child) {
    if (widget.$props.drag) {
      print(' use drag to upload ');
      return DropTarget(
        onDragDone: (detail) async {
          List<PlatformFile> pfiles = await xFilesToPlatformFiles(detail.files);
          FilePickerResult fpResult = FilePickerResult(pfiles);
          addAndUpload(fpResult);
        },
        onDragEntered: (detail) {},
        onDragExited: (detail) {},
        child: child,
      );
    }
    return child;
  }

  List<Widget> get fileListWidget {
    return List.generate(widget.$props.fileList.length, (index) {
      var file = widget.$props.fileList[index];
      var listType = widget.$props.listType;
      return Padding(
        padding: EdgeInsets.only(top: fileListPaddingTop),
        child: widget.$props.listTypePictureCard
            ? builderByListType(listType).call(
                null,
                null,
                null,
                null,
                file,
              )
            : MouseStateBuilder(builder: (context, state) {
                Color contentColor =
                    state.isMouseOver ? CfgGlobal.primaryColor : Colors.black;
                var fileNameWidget = Expanded(
                  child: Text(
                    fileTranslate(file),
                    style: TextStyle(
                      color: contentColor,
                    ),
                  ),
                );

                var removeWidget = InkWell(
                  child: const Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 14,
                  ),
                  onTap: () {
                    widget.$props.fileList.remove(file);
                    setState(() {});
                  },
                );

                return builderByListType(listType).call(
                  state.isMouseOver,
                  fileNameWidget,
                  removeWidget,
                  contentColor,
                  file,
                );
              }),
      );
    });
  }

  Function builderByListType(listType) {
    Map<String, Function> listTypeStrategy = {
      'text': textListType,
      'picture': pictureListType,
      'picture-card': pictureCardListType,
    };
    return listTypeStrategy[listType] ?? textListType;
  }

  Widget pictureListType(
    isHover,
    fileNameWidget,
    removeWidget,
    contentColor,
    file,
  ) {
    var row = Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: pictureSize,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: imageTranslate(file),
                ),
              ),
            ),
            fileNameWidget,
          ],
        ),
        if (isHover)
          Positioned(
            right: 0,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: removeWidget,
            ),
          ),
        if (!isHover) ...[
          Positioned(
            right: -17,
            top: -7,
            child: Transform.rotate(
              angle: pi / 4,
              child: SizedBox(
                width: 46,
                height: 26,
                child: ColoredBox(
                  color: CfgGlobal.successColor.withAlpha(255 ~/ 4 * 3),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.check,
                size: 12,
                color: CfgGlobal.basicColor,
              ),
            ),
          ),
        ],
      ],
    );
    return Container(
      child: row,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: widget.style.borderRadius,
      ),
    );
  }

  Widget pictureCardListType(
    isHover,
    fileNameWidget,
    removeWidget,
    contentColor,
    file,
  ) {
    return WHoverHandle(
      props: WHoverHandleProp(handles: <IconAndEvent>[
        IconAndEvent(
          icon: Icon(Icons.zoom_in, color: Colors.white),
          event: () {
            print('zoom_in');
          },
        ),
        IconAndEvent(
          icon: Icon(Icons.download, color: Colors.white),
          event: () {
            print('download');
          },
        ),
        IconAndEvent(
          icon: Icon(Icons.delete_outline_outlined, color: Colors.white),
          event: () {
            print('add');
          },
        ),
      ]),
      slots: WHoverHandleSlot(imageTranslate(file)),
    );
  }

  Widget textListType(
    isHover,
    fileNameWidget,
    removeWidget,
    contentColor,
    file,
  ) {
    var row = Padding(
      padding: EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 7.0),
            child: Icon(
              Icons.file_present,
              size: 14,
              color: contentColor,
            ),
          ),
          fileNameWidget,
          if (isHover) removeWidget,
          if (!isHover)
            Icon(
              Icons.check_circle_outline,
              size: 14,
              color: CfgGlobal.successColor,
            )
        ],
      ),
    );
    if (isHover) {
      return ColoredBox(
        color: Theme.of(context).primaryColorLight.withAlpha(50),
        child: row,
      );
    } else {
      return row;
    }
  }

  fileTranslate(file) {
    if (file is Map) {
      return file['name'];
    } else if (file is FilePickerResult) {
      return file.files.first.name;
    }
    return '';
  }

  imageTranslate(file) {
    var image = null;
    if (file is Map) {
      image = Image.network(file['url'], fit: pictureFit);
    } else if (file is FilePickerResult) {
      image = kIsWeb
          ? Image.memory(file.files.first.bytes!, fit: pictureFit)
          : Image.file(File(file.files.first.path!), fit: pictureFit);
    } else if (file is ByteFile) {
      image = Image.memory(file.bytes, fit: pictureFit);
    }
    return ConstrainedBox(
      key: GlobalKey(),
      constraints: BoxConstraints(maxHeight: triggerHeight),
      child: AspectRatio(
        aspectRatio: pictureAspectRatio,
        child: borderWrapper(
          image,
          Border.all(
            color: CfgGlobal.disabledColor,
            style: BorderStyle.solid,
          ),
          true,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  double get pictureAspectRatio {
    return 1;
  }

  BoxFit get pictureFit {
    return BoxFit.cover;
  }

  Map<String, WFilePicker> get platformPicker {
    var allowedExtensions = widget.$props.accept?.split(',');
    if (allowedExtensions != null) {
      for (var i = 0; i < allowedExtensions.length; i++) {
        allowedExtensions[i] = allowedExtensions[i].trim();
      }
    }
    return {
      'web': WebFilePicker(allowedExtensions: allowedExtensions),
      'pc': PcFilePicker(allowedExtensions: allowedExtensions),
    };
  }

  triggerAction() async {
    platformPicker[platform]?.doPicker((result) {
      addAndUpload(result);
    });
  }

  addAndUpload(FilePickerResult result) {
    widget.$props.fileList.add(result);
    var promise = doUpload(result);
    if (promise != null) {
      promise.then((v) {
        setState(() {});
      });
    } else {
      setState(() {});
    }
  }

  doBeforeUpload(ByteFile file) {
    if (widget.$props.beforeUpload != null) {
      var valid =
          widget.$props.beforeUpload?.call(file, widget.$props.fileList);
      if (!valid) {
        throw Exception(
            '上传中止。("beforeUpload" made decision to cancel upload process.)');
      }
    }
    return true;
  }

  doUpload(FilePickerResult result) {
    if (widget.$props.action != null && widget.$props.autoUpload) {
      var dio = Dio();
      var bytes = kIsWeb
          ? result.files.first.bytes!
          : File(result.files.first.path!).readAsBytesSync();
      var file = MultipartFile.fromBytes(
        bytes,
        filename: result.files.first.name,
      );
      doBeforeUpload(ByteFile(bytes: bytes, name: result.files.first.name));
      var form = FormData.fromMap({widget.$props.name: file});
      return dio
          .post(
        widget.$props.action!,
        data: form,
        options: Options(contentType: ContentType.binary.toString()),
      )
          .then((value) {
        widget.$props.onSuccess?.call(value, bytes, widget.$props.fileList);
      }).onError((error, stackTrace) {
        widget.$props.onError?.call(error, bytes, widget.$props.fileList);
      });
    }
  }

  String get platform {
    return kIsWeb ? 'web' : 'pc';
  }

  double get pictureSize {
    return widget.$style.pictureSize ?? cfgGlobal.upload.pictureSize ?? 60;
  }

  double get fileListPaddingTop {
    return widget.$props.listTypeText
        ? 5
        : widget.$props.listTypePicture
            ? 10
            : 0;
  }

  double get triggerHeight {
    var height = 0.0;
    if (widget.$slots.trigger != null && widget.$slots.trigger!.key != null) {
      height = ((widget.$slots.trigger!.key as GlobalKey)
              .currentContext!
              .findRenderObject() as RenderBox)
          .size
          .height;
    }

    for (var child in widget.defaultSlot) {
      if (child.key != null) {
        var newHeight = ((child.key as GlobalKey)
                .currentContext!
                .findRenderObject() as RenderBox)
            .size
            .height;
        if (newHeight > height) height = newHeight;
      }
    }
    return height;
  }
}

class WUploadOn extends BaseOn {}

class WUploadProp extends BaseProp {
  String? action;
  Object? headers;
  bool? multiple;
  Object? data;
  late String name;
  late bool withCredentials;
  late bool showFileList;
  late bool drag;
  String? accept;
  late Function(File)? onPreview;
  late Function(File, List<File>)? onRemove;
  late Function(dynamic, Uint8List, List)? onSuccess;
  late Function(dynamic, Uint8List, List)? onError;
  late Function(dynamic, Uint8List, List)? onProgress;
  late Function(ByteFile, List)? onChange;
  late Function(ByteFile, List)? beforeUpload;
  late Function(ByteFile, List)? beforeRemove;
  late String listType;
  late bool autoUpload;
  late List fileList;
  late Function? httpRequest;
  late bool disabled;
  int? limit;
  late Function(File, List<File>)? onExceed;

  WUploadProp({
    String? action,
    Object? headers,
    bool? multiple,
    Object? data,
    String? name,
    bool? withCredentials,
    bool? showFileList,
    bool? drag,
    String? accept,
    Function(File)? onPreview,
    Function(File, List<File>)? onRemove,
    Function(dynamic, Uint8List, List)? onSuccess,
    Function(dynamic, Uint8List, List)? onError,
    Function(dynamic, Uint8List, List)? onProgress,
    Function(ByteFile, List)? onChange,
    Function(ByteFile, List)? beforeUpload,
    Function(ByteFile, List)? beforeRemove,
    String? listType,
    bool? autoUpload,
    List? fileList,
    Function? httpRequest,
    bool? disabled,
    int? limit,
    Function(File, List<File>)? onExceed,
  }) {
    this.action = action;
    this.headers = headers;
    this.multiple = multiple;
    this.data = data;
    this.name = name ?? 'file';
    this.withCredentials = withCredentials ?? false;
    this.showFileList = showFileList ?? true;
    this.drag = drag ?? false;
    this.accept = accept;
    this.onPreview = onPreview;
    this.onRemove = onRemove;
    this.onSuccess = onSuccess;
    this.onError = onError;
    this.onProgress = onProgress;
    this.onChange = onChange;
    this.beforeUpload = beforeUpload;
    this.beforeRemove = beforeRemove;
    this.listType = listType ?? 'text';
    this.autoUpload = autoUpload ?? true;
    this.fileList = fileList ?? [];
    this.httpRequest = httpRequest;
    this.disabled = disabled ?? false;
    this.limit = limit;
    this.onExceed = onExceed;
  }

  bool get listTypePictureCard {
    return listType == 'picture-card';
  }

  bool get listTypePicture {
    return listType == 'picture';
  }

  bool get listTypeText {
    return listType == 'text';
  }
}

class WUploadSlot extends BaseSlot {
  Widget? trigger;
  Widget? tip;
  Widget Function(dynamic)? file;
  WUploadSlot(defaultSlotBefore, {this.tip, this.trigger, this.file})
      : super(defaultSlotBefore);
}

abstract class WFilePicker {
  List<String> allowedExtensions = [];
  doPicker(Function(FilePickerResult) callback);
}

class PcFilePicker extends WFilePicker {
  PcFilePicker({List<String>? allowedExtensions}) {
    super.allowedExtensions = allowedExtensions ?? [];
  }
  doPicker(Function(FilePickerResult) callback) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: allowedExtensions.isEmpty ? FileType.any : FileType.custom,
      lockParentWindow: true,
      allowedExtensions: allowedExtensions,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      callback.call(result);
    } else {
      // User canceled the picker
    }
  }
}

class WebFilePicker extends WFilePicker {
  WebFilePicker({List<String>? allowedExtensions}) {
    super.allowedExtensions = allowedExtensions ?? [];
  }
  doPicker(Function(FilePickerResult) callback) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: allowedExtensions.isEmpty ? FileType.any : FileType.custom,
      lockParentWindow: true,
      allowedExtensions: allowedExtensions,
    );

    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      String fileName = result.files.first.name;

      callback.call(result);
    }
  }
}
