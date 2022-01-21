import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';

import '../../core/utils/collect_util.dart';

class WInput extends StatefulWidget
    implements BaseWidget<WInputOn, WInputProp, WInputSlot, WInputStyle> {
  @override
  late final WInputOn $on;
  @override
  late final WInputProp $props;
  @override
  late final WInputSlot $slots;
  @override
  late WInputStyle $style;

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

class WInputState extends State<WInput> {
  bool visiblePassword = false;
  bool isHover = false;
  bool isFocus = false;

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    widget.$props._value.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    widget.$props._value.addListener(() {
      print('change');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var textFormField = TextFormField(
      onTap: widget.$on.click,
      onChanged: (v) {
        widget.$on.change?.call(v);
        setState(() {});
      },
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

      keyboardType: widget.$props.$keyboardType,
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

  InputDecoration get decoration {
    var baseBorder = OutlineInputBorder(
      borderSide: BorderSide(color: CfgGlobal.primaryColor, width: 1),
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
      contentPadding: hasSlot
          ? const EdgeInsets.fromLTRB(0, 0, 0, 0)
          : EdgeInsets.fromLTRB(fontSize, padding, fontSize, padding),
      hintStyle: TextStyle(color: placeholderColor, fontSize: fontSize),
      hintText: widget.$props.placeholder,
      label: label,
      alignLabelWithHint: false,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      constraints: widget.$props.isTextarea
          ? null
          : BoxConstraints(
              minWidth: maxWidth,
              maxWidth: maxWidth,
              minHeight: minHeight,
              maxHeight: widget.$strictOneRow ? minHeight : double.infinity,
            ),
      focusedBorder: baseBorder,
      focusedErrorBorder: baseBorder.copyWith(
        borderSide: BorderSide(color: cfgGlobal.color.danger),
      ),
      hoverColor: Colors.red,
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
                color:
                    count > total ? cfgGlobal.color.danger : placeholderColor,
              ),
            ),
          )
        : null;
  }

  bool get showCursor {
    return !widget.$props.disabled && !widget.$props.readonly;
  }

  bool get hasSlot {
    return prefixIcon != null && suffixIcon != null;
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
            padding:
                EdgeInsets.fromLTRB(children.length > 1 ? padding : 0, 0, 0, 0),
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
      if (widget.$props.suffixIcon != null)
        Icon(widget.$props.suffixIcon, size: iconSize),
      ...widget.$slots.suffix,
      if (showClearIcon)
        InkWell(
          child: Icon(Icons.close_rounded, size: iconSize),
          onTap: () {
            widget.$props._value.text = '';
            widget.$on.clear?.call();
            setState(() {});
          },
        ),
      if (widget.$props.showPassword)
        InkWell(
          child: Icon(Icons.remove_red_eye_rounded, size: iconSize),
          onTap: () {
            visiblePassword = !visiblePassword;
            setState(() {});
          },
        ),
      if (suffix != null) suffix!,
      if (counter != null) counter!,
    ];
    return children.isNotEmpty
        ? Padding(
            padding:
                EdgeInsets.fromLTRB(0, 0, children.length > 1 ? padding : 0, 0),
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

  bool get showClearIcon {
    return widget.$props.clearable &&
        widget.$props._value.text.isNotEmpty &&
        (isHover || isFocus);
  }

  double get maxWidth {
    return widget.$style.width ?? cfgGlobal.input.width ?? 200;
  }

  double get minHeight {
    return fontSize + cfgGlobal.padding.val(widget.$props.size) * 2;
  }

  double get padding {
    return cfgGlobal.padding.val(widget.$props.size);
  }

  double get fontSize {
    return cfgGlobal.font.val(widget.$props.size);
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

class WInputProp extends BaseProp {
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

  set value(value) {
    _value.text = value;
  }

  dynamic get value {
    return _value.text;
  }

  WInputProp({
    String? type,
    value,
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
  }) {
    this.type = type ?? 'text';
    _value = TextEditingController(text: value != null ? value.toString() : '');
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
}

class WAutocomplete extends StatelessWidget
    implements
        BaseWidget<WAutocompleteOn, WAutocompleteProp, WAutocompleteSlot,
            WAutocompleteStyle> {
  @override
  late final WAutocompleteOn $on;
  @override
  late final WAutocompleteProp $props;
  @override
  late final WAutocompleteSlot $slots;
  @override
  late WAutocompleteStyle $style;

  WAutocomplete({
    Key? key,
    WAutocompleteOn? on,
    WAutocompleteProp? props,
    WAutocompleteSlot? slots,
    WAutocompleteStyle? style,
  }) : super(key: key) {
    $on = on ?? WAutocompleteOn();
    $props = props ?? WAutocompleteProp(value: '');
    $slots = slots ?? WAutocompleteSlot(null);
    $style = style ?? WAutocompleteStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WAutocompleteOn extends BaseOn {
  Function? select;
  Function? change;
  WAutocompleteOn({
    this.select,
    this.change,
  });
}

class WAutocompleteProp extends BaseProp {
  String? placeholder;
  late bool disabled;
  late String valueKey;
  late String value;
  late num debounce;
  late String placement;
  Function(String, Function(List))? fetchSuggestions;
  String? popperClass;
  late bool triggerOnFocus;
  String? name;
  late bool selectWhenUnmatched;
  String? label;
  IconData? prefixIcon;
  IconData? suffixIcon;
  late bool hideLoading;
  late bool popperAppendToBody;
  late bool highlightFirstItem;

  WAutocompleteProp({
    this.placeholder,
    this.disabled = false,
    this.valueKey = 'value',
    required this.value,
    this.debounce = 300,
    this.placement = 'bottom-start',
    this.fetchSuggestions,
    this.popperClass,
    this.triggerOnFocus = true,
    this.name,
    this.selectWhenUnmatched = false,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.hideLoading = false,
    this.popperAppendToBody = true,
    this.highlightFirstItem = false,
  });
}

class WAutocompleteSlot extends BaseSlot {
  IconData? prefix;
  IconData? suffix;
  Widget? prepend;
  Widget? append;

  WAutocompleteSlot(
    defaultSlotBefore, {
    this.prefix,
    this.suffix,
    this.prepend,
    this.append,
  }) : super(defaultSlotBefore);
}
