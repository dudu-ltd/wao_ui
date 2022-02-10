import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/wao_ui.dart';
import 'package:bitsdojo_window/src/widgets/mouse_state_builder.dart';

class WUpload extends StatefulWidget
    implements BaseWidget<WUploadOn, WUploadProp, WUploadSlot, WUploadStyle> {
  @override
  late final WUploadOn $on;
  @override
  late final WUploadProp $props;
  @override
  late final WUploadSlot $slots;
  @override
  late WUploadStyle $style;

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
  }

  @override
  State<WUpload> createState() => _WUploadState();

  clearFiles() {}
  abort() {}
  submit() {}
}

class _WUploadState extends State<WUpload> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.state = this;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        trigger,
        if (widget.$slots.tip != null)
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: widget.$slots.tip!,
          ),
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

    if (widget.$slots.hasDefault) {
      for (var child in widget.$slots.defaultSlot!) {
        if (widget.$slots.trigger == null) {
          bindPicker(child, _triggers);
        } else {
          _triggers.add(child);
        }
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _triggers,
    );
  }

  List<Widget> get fileListWidget {
    return List.generate(widget.$props.fileList.length, (index) {
      var file = widget.$props.fileList[index];
      var listType = widget.$props.listType;
      return Padding(
        padding:
            EdgeInsets.only(top: widget.$props.listType == 'text' ? 5 : 10),
        child: MouseStateBuilder(builder: (context, state) {
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
                  color: cfgGlobal.color.success.withAlpha(255 ~/ 4 * 3),
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
                color: CfgGlobal.blankColor,
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
        borderRadius: BorderRadius.circular(cfgGlobal.borderRadius.large),
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
    return Container();
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
              color: cfgGlobal.color.success,
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
    if (file is Map) {
      return Image.network(file['url']);
    } else if (file is FilePickerResult) {
      return kIsWeb
          ? Image.memory(file.files.first.bytes!)
          : Image.file(File(file.files.first.path!));
    }
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
      widget.$props.fileList.add(result);
      var promise = doUpload(result);
      if (promise != null) {
        promise.then((v) {
          setState(() {});
        });
      } else {
        setState(() {});
      }
    });
  }

  doUpload(FilePickerResult result) {
    if (widget.$props.action != null && widget.$props.autoUpload) {
      var dio = Dio();
      var bytes = kIsWeb
          ? result.files.first.bytes!
          : File(result.files.first.path!).readAsBytesSync();
      var form = FormData.fromMap({
        widget.$props.name: MultipartFile.fromBytes(
          bytes,
          filename: result.files.first.name,
        )
      });
      return dio
          .post(
        widget.$props.action!,
        data: form,
        options: Options(contentType: ContentType.binary.toString()),
      )
          .then((value) {
        widget.$props.onSuccess?.call(value, bytes, widget.$props.fileList);
      });
    }
  }

  String get platform {
    return kIsWeb ? 'web' : 'pc';
  }

  double get pictureSize {
    return widget.$style.pictureSize ?? cfgGlobal.upload.pictureSize ?? 60;
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
    @Deprecated("暂时不支持文件的拖拽上传。(File upload by drag is not support in current version.)")
        bool? drag,
    String? accept,
    Function(File)? onPreview,
    Function(File, List<File>)? onRemove,
    Function(dynamic, Uint8List, List)? onSuccess,
    Function(dynamic, Uint8List, List)? onError,
    Function(dynamic, Uint8List, List)? onProgress,
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
