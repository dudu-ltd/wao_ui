import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'dart:convert';

import '../../core/utils/collect_util.dart';

class WInput
    extends WStatefulWidget<WInputOn, WInputProp, WInputSlot, WInputStyle> {
  WInput({
    Key? key,
    WInputOn? on,
    WInputProp? props,
    WInputSlot? slots,
    WInputStyle? style,
    this.$prefixSize = MainAxisSize.min,
    this.$prefixAlignment = MainAxisAlignment.center,
    this.$strictOneRow = true,
  }) : super(key: key) {
    $on = on ?? WInputOn();
    $props = props ?? WInputProp();
    $slots = slots ?? WInputSlot(null);
    $style = style ?? WInputStyle();
    init();
  }

  MainAxisSize? $prefixSize;
  MainAxisAlignment? $prefixAlignment;

  bool $strictOneRow;
  @override
  WInputState createState() => WInputState();
  /* // TODO 赋鹬组件基本的操作能力
      focus	使 input 获取焦点	—
      blur	使 input 失去焦点	—
      select	选中 input 中的文字	—
   */
}

class WInputState extends WState<WInput> {
  bool visiblePassword = false;
  bool isHover = false;
  bool isFocus = false;

  @override
  void initState() {
    super.initState();
    // widget.$props._value.addListener(updateView);
  }

  @override
  void dispose() {
    // widget.$props._value.removeListener(updateView);
    super.dispose();
  }

  @override
  Widget wbuild(BuildContext context) {
    var textFormField = TextFormField(
      onTap: widget.$on.click,
      onChanged: (v) {
        print('-----------$v');
        widget.$on.change?.call(v);
        // setState(() {});
      },
      keyboardType: widget.$props.isTextarea
          ? TextInputType.multiline
          : widget.$props.$keyboardType,
      textInputAction: widget.$props.isTextarea
          ? TextInputAction.newline
          : TextInputAction.next,
      controller: widget.$props._value,
      // cursorHeight: fontSize * 1.6,
      cursorColor: Colors.grey.shade900,
      cursorWidth: 1,
      obscureText: widget.$props.showPassword && !visiblePassword,
      showCursor: showCursor,
      readOnly: widget.$props.readonly,
      minLines: textAreaMinLines,
      maxLines: textAreaMaxLines,
      decoration: decoration,
      maxLength: widget.$props.maxlength,
      maxLengthEnforcement: MaxLengthEnforcement.none,

      textAlignVertical: TextAlignVertical.center,
      textAlign: widget.$props.$textAlign,
    );

    var focus = Focus(
      child: textFormField,
      onFocusChange: (hasFocus) {
        isFocus = hasFocus;
        var handle = hasFocus ? widget.$on.focus : widget.$on.blur;
        handle?.call();
        setState(() {});
      },
    );

    return MouseRegion(
      child: focus,
      onEnter: (e) {
        isHover = true;
        setState(() {});
      },
      onExit: (e) {
        isHover = false;
        setState(() {});
      },
    );
  }

  Widget? get label {
    var lab = widget.$props.label;
    return lab is String
        ? Text(lab)
        : lab is Widget
            ? lab
            : null;
  }

  Widget? get counter {
    var count = widget.$props._value.text.length;
    var total = widget.$props.maxlength;
    return total != null
        ? Container(
            color: Colors.white,
            margin: const EdgeInsets.all(8),
            child: Text(
              '$count / $total',
              style: TextStyle(
                color: count > total ? CfgGlobal.dangerColor : placeholderColor,
              ),
            ),
          )
        : null;
  }

  Widget? get prefixIcon {
    var children = [
      if (prefix != null) prefix!,
      if (widget.$props.prefixIcon != null)
        Icon(widget.$props.prefixIcon, size: iconSize),
      ...widget.$slots.prefix
    ];
    return children.isNotEmpty
        ? Padding(
            padding: EdgeInsets.fromLTRB(
                children.length > 1 ? (widget.style.padding?.left ?? 0) : 0,
                0,
                0,
                0),
            child: Row(
              mainAxisSize: widget.$prefixSize ?? MainAxisSize.min,
              mainAxisAlignment:
                  widget.$prefixAlignment ?? MainAxisAlignment.center,
              children: children,
            ),
          )
        : null;
  }

  Widget? get suffixIcon {
    var children = [
      if (showClearIcon)
        InkWell(
          child: Icon(Icons.close_rounded, size: iconSize),
          onTap: () {
            widget.$props._value.text = '';
            widget.$on.clear?.call();
            setState(() {});
          },
        ),
      if (widget.$props.suffixIcon != null)
        Icon(widget.$props.suffixIcon, size: iconSize),
      if (!showClearIcon) ...widget.$slots.suffix,
      if (widget.$props.showPassword)
        InkWell(
          child: Icon(Icons.remove_red_eye_rounded, size: iconSize),
          onTap: () {
            visiblePassword = !visiblePassword;
            setState(() {});
          },
        ),
      if (!showClearIcon && suffix != null) suffix!,
      if (counter != null) counter!,
    ];
    return children.isNotEmpty
        ? Padding(
            padding: EdgeInsets.fromLTRB(
                0,
                0,
                children.length > 1 ? (widget.style.padding?.right ?? 0) : 0,
                0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          )
        : null;
  }

  Widget? get prefix {
    return widget.$slots.prepend.isNotEmpty
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [...widget.$slots.prepend],
          )
        : null;
  }

  Widget? get suffix {
    return widget.$slots.append.isNotEmpty
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [...widget.$slots.append],
          )
        : null;
  }

  InputDecoration get decoration {
    var baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: widget.$style.borderColor ?? CfgGlobal.primaryColor,
        width: widget.$style.borderWidth ?? 1,
      ),
    );

    var inputDecoration = InputDecoration(
      counter: widget.$props.maxlength != null
          ? const Offstage(
              offstage: true,
            )
          : null,
      //
      enabled: !widget.$props.disabled,
      filled: widget.$props.disabled,
      //
      isDense: true,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      prefixIconColor: placeholderColor,
      suffixIconColor: placeholderColor,
      contentPadding: widget.style.padding,
      hintStyle: TextStyle(color: placeholderColor, fontSize: fontSize),
      hintText: widget.$props.placeholder,
      label: label,
      alignLabelWithHint: false,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      // constraints: widget.$props.isTextarea
      //     ? null
      //     : BoxConstraints(
      //         minWidth: minWidth,
      //         maxWidth: maxWidth,
      //         minHeight: minHeight,
      //         maxHeight: widget.$strictOneRow ? minHeight : double.infinity,
      //       ),
      focusedBorder: baseBorder,
      focusedErrorBorder: baseBorder.copyWith(
        borderSide: BorderSide(color: CfgGlobal.dangerColor),
      ),
      // hoverColor: Colors.red,
      border: baseBorder.copyWith(
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: baseBorder.copyWith(
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      disabledBorder: baseBorder.copyWith(
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
    );
    return inputDecoration;
  }

  bool get showCursor {
    return !widget.$props.disabled && !widget.$props.readonly;
  }

  bool get hasSlot {
    return prefixIcon != null && suffixIcon != null;
  }

  bool get showClearIcon {
    var valueIsNotEmpty = widget.$props._value.text.isNotEmpty ||
        (widget.$props.$model != null && widget.$props.$model!.value != null);
    return widget.$props.clearable &&
        valueIsNotEmpty &&
        isHover; //  || isFocus 聚焦时将不再响应清空按钮
  }

  double get maxWidth {
    return widget.$style.maxWidth ?? cfgGlobal.input.maxWidth ?? 300;
  }

  double get minWidth {
    return widget.$style.minWidth ??
        widget.$style.minWidth ??
        cfgGlobal.input.minWidth ??
        0;
  }

  double get minHeight {
    return widget.$style.minHeight ??
        fontSize + (CfgGlobal.padding[widget.$props.size]?.left ?? 1) * 2.0;
  }

  double get fontSize {
    return widget.$style.fontSize ?? cfgGlobal.font.val(widget.$props.size);
  }

  double get iconSize {
    return fontSize * 1.2;
  }

  Color get placeholderColor {
    return Colors.grey;
  }

  int get textAreaMinLines {
    if (!widget.$props.isTextarea) return 1;
    if (widget.$props.autosize is bool && widget.$props.autosize) {
      return widget.$props.rows;
    } else if (widget.$props.autosize is Map &&
        (widget.$props.autosize as Map).containsKey('minRows')) {
      return widget.$props.autosize['minRows'];
    }
    return widget.$props.rows;
  }

  int get textAreaMaxLines {
    if (!widget.$props.isTextarea) return 1;
    if (widget.$props.autosize is bool) {
      if (widget.$props.autosize) {
        return (1 << 31);
      }
    } else if (widget.$props.autosize is Map &&
        (widget.$props.autosize as Map).containsKey('maxRows')) {
      return widget.$props.autosize['maxRows'];
    }
    return widget.$props.rows;
  }
}

class WInputOn extends BaseOn {
  Function()? click;

  /// blur在 Input 失去焦点时触发	(event: Event)
  Function()? blur;

  /// focus	在 Input 获得焦点时触发	(event: Event)
  Function()? focus;

  /// change	仅在输入框失去焦点或用户按下回车时触发	(value: string | number)
  Function(dynamic)? change;

  /// input	在 Input 值改变时触发	(value: string | number)
  Function()? input;

  /// clear	在点击由 clearable 属性生成的清空按钮时触发	—
  Function()? clear;
  WInputOn({
    this.click,
    this.blur,
    this.focus,
    this.change,
    this.input,
    this.clear,
  });
}

class WInputProp extends BaseProp with ModelDriveProp {
  late String type;
  late TextEditingController _value;
  int? maxlength;
  int? minlength;
  late bool showWordLimit;
  late String placeholder;
  late bool clearable;
  late bool showPassword;
  late bool disabled;
  late String size;
  IconData? prefixIcon;
  IconData? suffixIcon;
  late int rows;
  late dynamic autosize;
  late String autocomplete;
  late String autoComplete;
  String? name;
  late bool readonly;
  num? max;
  num? min;
  late num step;
  String? resize;
  late bool autofocus;
  late String? form;
  late String? label;
  late String? tabindex;
  late bool validateEvent;

  /// 键盘类型，ElementUI 中没有的属性，加了前缀 $ 以区分
  late TextInputType $keyboardType;

  TextAlign $textAlign;

  String Function(ValueNotifier) encode = ($model) {
    var model = $model.value;
    return model is String ? model : const JsonEncoder().convert(model);
  };

  dynamic Function(String) decode = (text) {
    try {
      return const JsonDecoder().convert(text);
    } catch (e) {
      return text;
    }
  };

  WInputProp({
    String? type,
    dynamic model,
    this.maxlength,
    this.minlength,
    bool? showWordLimit,
    String? placeholder,
    bool? clearable,
    bool? showPassword,
    bool? disabled,
    String? size,
    this.prefixIcon,
    this.suffixIcon,
    int? rows,
    dynamic autosize,
    String? autocomplete,
    String? autoComplete,
    this.name,
    bool? readonly,
    this.max,
    this.min,
    num? step,
    this.resize,
    bool? autofocus,
    this.form,
    this.label,
    this.tabindex,
    bool? validateEvent,
    // ElementUI 中没有的属性，加了前缀 $ 以区分
    TextInputType? $keyboardType,
    this.$textAlign = TextAlign.left,
    ValueNotifier? $model,
  }) {
    this.type = type ?? 'text';
    _value = TextEditingController();
    this.$model = $model ?? this.$model;

    _value.addListener(updateModelValue);
    $addModelListener(updateTextValue);
    this.model = model ?? this.model ?? '';

    this.showWordLimit = showWordLimit ?? false;
    this.placeholder = placeholder ?? '';
    this.clearable = clearable ?? false;
    this.showPassword = showPassword ?? false;
    this.disabled = disabled ?? false;
    this.size = size ?? 'large';
    this.rows = rows ?? 2;
    this.autosize = autosize ?? false;
    this.autocomplete = autocomplete ?? 'off';
    this.autoComplete = autoComplete ?? 'off';
    this.step = step ?? 1;
    this.readonly = readonly ?? false;
    this.autofocus = autofocus ?? false;
    this.validateEvent = validateEvent ?? true;

    this.$keyboardType = isTextarea
        ? TextInputType.multiline
        : $keyboardType ?? TextInputType.text;
  }

  bool get isTextarea {
    return type == 'textarea';
  }

  updateModelValue() {
    model = decode(_value.text);
  }

  updateTextValue() {
    var selection = _value.selection;
    _value.text = encode($model!);
    _value.selection = selection;
  }
}

class WInputSlot extends BaseSlot {
  /// prefix	输入框头部内容，只对 type="text" 有效
  List<Widget> prefix = [];

  /// suffix	输入框尾部内容，只对 type="text" 有效
  List<Widget> suffix = [];

  /// prepend	输入框前置内容，只对 type="text" 有效
  List<Widget> prepend = [];

  /// append	输入框后置内容，只对 type="text" 有效
  List<Widget> append = [];

  WInputSlot(
    defaultSlotBefore, {
    dynamic prefix,
    dynamic suffix,
    dynamic prepend,
    dynamic append,
  }) : super(defaultSlotBefore) {
    addSlot(prefix, this.prefix);
    addSlot(suffix, this.suffix);
    addSlot(prepend, this.prepend);
    addSlot(append, this.append);
  }

  addPrefix(dynamic prefix) {
    addSlot(prefix, this.prefix);
  }

  addSuffix(dynamic suffix) {
    addSlot(suffix, this.suffix);
  }

  addPrepend(dynamic prepend) {
    addSlot(prepend, this.prepend);
  }

  addAppend(dynamic append) {
    addSlot(append, this.append);
  }
}
