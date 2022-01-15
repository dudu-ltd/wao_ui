import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/src/basic/w_button.dart';

class WUpload extends StatelessWidget
    implements BaseWidget<WUploadOn, WUploadProp, WUploadSlot> {
  @override
  late final WUploadOn $on;

  @override
  late final WUploadProp $props;

  @override
  late final WUploadSlot $slots;

  Map<String, WFilePicker> platformPicker = {
    'web': WebFilePicker(),
    'pc': PcFilePicker(),
  };

  WUpload({
    Key? key,
    WUploadOn? on,
    WUploadProp? props,
    WUploadSlot? slots,
  }) : super(key: key) {
    $on = on ?? WUploadOn();
    $props = props ?? WUploadProp();
    $slots = slots ?? WUploadSlot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WButton(
        on: WButtonOn(
          click: () async {
            String? outputFile = await FilePicker.platform.saveFile(
              dialogTitle: 'Please select an output file:',
              fileName: 'output-file.pdf',
            );

            print(outputFile);
            if (outputFile == null) {
              // User canceled the picker
            }
            platformPicker[platform]?.doPicker((result) {
              print(result);
            });
          },
        ),
      ),
    );
  }

  String get platform {
    return kIsWeb ? 'web' : 'pc';
  }

  clearFiles() {}
  abort() {}
  submit() {}
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
  late Function(dynamic, File, List<File>)? onSuccess;
  late Function(dynamic, File, List<File>)? onError;
  late Function(dynamic, File, List<File>)? onProgress;
  late Function(File, List<File>)? onChange;
  late Function(File, List<File>)? beforeUpload;
  late Function(File, List<File>)? beforeRemove;
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
    Function(dynamic, File, List<File>)? onSuccess,
    Function(dynamic, File, List<File>)? onError,
    Function(dynamic, File, List<File>)? onProgress,
    Function(File, List<File>)? onChange,
    Function(File, List<File>)? beforeUpload,
    Function(File, List<File>)? beforeRemove,
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
}

class WUploadSlot extends BaseSlot {
  Widget? trigger;
  Widget? tip;
  WUploadSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

abstract class WFilePicker {
  doPicker(Function(FilePickerResult) callback);
}

class PcFilePicker extends WFilePicker {
  doPicker(Function(FilePickerResult) callback) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      print(result.files.single.path!);
      File file = File(result.files.single.path!);
      print(file);
      callback.call(result);
      print('pc');
    } else {
      // User canceled the picker
    }
  }
}

class WebFilePicker extends WFilePicker {
  doPicker(Function(FilePickerResult) callback) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      String fileName = result.files.first.name;

      callback.call(result);
      print(fileName);
      print('web');
    }
  }
}
