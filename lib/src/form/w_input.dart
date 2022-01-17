import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';

import '../../core/utils/collect_util.dart';

class _WInputState extends State<WInput> {
  bool visiblePassword = false;

  @override
  void initState() {
    super.initState();
    widget.$props._value.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (e) {
        setState(() {});
      },
      controller: widget.$props._value,
      cursorHeight: fontSize * 1.6,
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
    );
  }

  InputDecoration get decoration {
    var baseBorder = OutlineInputBorder(
      borderSide: BorderSide(color: CfgGlobal.primaryColor, width: 1),
    );

    return InputDecoration(
      counter: widget.$props.maxlength != null
          ? const Offstage(
              offstage: true,
            )
          : null,
      enabled: !widget.$props.disabled,
      filled: widget.$props.disabled,
      isDense: true,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      prefixIconColor: placeholderColor,
      suffixIconColor: placeholderColor,
      contentPadding: EdgeInsets.fromLTRB(fontSize, padding, padding, padding),
      hintStyle: TextStyle(color: placeholderColor, fontSize: fontSize),
      hintText: widget.$props.placeholder,
      constraints: widget.$props.isTextarea
          ? null
          : BoxConstraints(maxHeight: maxHeight, maxWidth: 200),
      focusedBorder: baseBorder,
      focusedErrorBorder: baseBorder.copyWith(
        borderSide: BorderSide(color: cfgGlobal.color.danger),
      ),
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
  }

  // Widget? get counterPainter {
  //   var ml = widget.$props.maxlength;
  //   return widget.$props.maxlength == null
  //       ? null
  //       : CustomPaint(
  //           painter: CountPainter(
  //             current: widget.$props._value.text.length,
  //             total: widget.$props.maxlength ?? 0,
  //             invalidColor: cfgGlobal.color.danger,
  //             validColor: placeholderColor,
  //           ),
  //         );
  // }

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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
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
      if (widget.$props.clearable && widget.$props._value.text.isNotEmpty)
        InkWell(
          child: Icon(Icons.close_rounded, size: iconSize),
          onTap: () {
            widget.$props._value.text = '';
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

  double get maxHeight {
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

  /**
      focus	使 input 获取焦点	—
      blur	使 input 失去焦点	—
      select	选中 input 中的文字	—
   */
}

// class CountPainter extends CustomPainter {
//   late Color validColor;
//   late Color invalidColor;
//   late int total;
//   late int current;

//   CountPainter({
//     required this.validColor,
//     required this.invalidColor,
//     required this.total,
//     required this.current,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint p = Paint();
//     p.color = current > total ? invalidColor : validColor;
//     final paragraphStyle = ParagraphStyle(
//       // 字体方向，有些国家语言是从右往左排版的
//       textDirection: TextDirection.ltr,
//       // 字体对齐方式
//       textAlign: TextAlign.justify,
//       fontSize: 14,
//       fontWeight: FontWeight.bold,
//       height: 15,
//     );

//     final paragraphBuilder = ParagraphBuilder(paragraphStyle);
//     paragraphBuilder.addText('$current/$total 111111111111');
//     var paragraph = paragraphBuilder.build();
//     paragraph.layout(const ParagraphConstraints(width: 30));
//     canvas.drawParagraph(
//       paragraph,
//       const Offset(0, 0),
//     );
//   }

//   @override
//   bool shouldRepaint(CountPainter oldDelegate) => true;

//   @override
//   bool shouldRebuildSemantics(CountPainter oldDelegate) => false;
// }

class WInput extends StatefulWidget
    implements BaseWidget<WInputOn, WInputProp, WInputSlot> {
  @override
  late final WInputOn $on;

  @override
  late final WInputProp $props;

  @override
  late final WInputSlot $slots;

  @override
  _WInputState createState() => _WInputState();
  WInput({
    Key? key,
    WInputOn? on,
    WInputProp? props,
    WInputSlot? slots,
  }) : super(key: key) {
    $on = on ?? WInputOn();
    $props = props ?? WInputProp();
    $slots = slots ?? WInputSlot(null);
  }
}

class WInputOn extends BaseOn {
  /**
      blur	在 Input 失去焦点时触发	(event: Event)
      focus	在 Input 获得焦点时触发	(event: Event)
      change	仅在输入框失去焦点或用户按下回车时触发	(value: string | number)
      input	在 Input 值改变时触发	(value: string | number)
      clear	在点击由 clearable 属性生成的清空按钮时触发	—
   */
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
  int? max;
  int? min;
  int? step;
  String? resize;
  late bool autofocus;
  late String? form;
  late String? label;
  late String? tabindex;
  late bool validateEvent;

  set value(value) {
    _value.text = value;
  }

  dynamic get value {
    return _value.value;
  }

  WInputProp({
    String? type,
    value,
    int? maxlength,
    int? minlength,
    bool? showWordLimit,
    String? placeholder,
    bool? clearable,
    bool? showPassword,
    bool? disabled,
    String? size,
    IconData? prefixIcon,
    IconData? suffixIcon,
    int? rows,
    dynamic autosize,
    String? autocomplete,
    String? autoComplete,
    String? name,
    bool? readonly,
    int? max,
    int? min,
    int? step,
    String? resize,
    bool? autofocus,
    String? form,
    String? label,
    String? tabindex,
    bool? validateEvent,
  }) {
    this.type = type ?? 'text';
    this._value =
        TextEditingController(text: value != null ? value.toString() : '');
    this.maxlength = maxlength;
    this.minlength = minlength;
    this.showWordLimit = showWordLimit ?? false;
    this.placeholder = placeholder ?? '';
    this.clearable = clearable ?? false;
    this.showPassword = showPassword ?? false;
    this.disabled = disabled ?? false;
    this.size = size ?? 'large';
    this.prefixIcon = prefixIcon;
    this.suffixIcon = suffixIcon;
    this.rows = rows ?? 2;
    this.autosize = autosize ?? false;
    this.autocomplete = autocomplete ?? 'off';
    this.autoComplete = autoComplete ?? 'off';
    this.name = name;
    this.readonly = readonly ?? false;
    this.max = max;
    this.min = min;
    this.step = step;
    this.resize = resize;
    this.autofocus = autofocus ?? false;
    this.form = form;
    this.label = label;
    this.tabindex = tabindex;
    this.validateEvent = validateEvent ?? true;
  }

  bool get isTextarea {
    return type == 'textarea';
  }
}

class WInputSlot extends BaseSlot {
  /**
      prefix	输入框头部内容，只对 type="text" 有效
      suffix	输入框尾部内容，只对 type="text" 有效
      prepend	输入框前置内容，只对 type="text" 有效
      append	输入框后置内容，只对 type="text" 有效
   */
  List<Widget> prefix = [];
  List<Widget> suffix = [];
  List<Widget> prepend = [];
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
        BaseWidget<WAutocompleteOn, WAutocompleteProp, WAutocompleteSlot> {
  @override
  late final WAutocompleteOn $on;

  @override
  late final WAutocompleteProp $props;

  @override
  late final WAutocompleteSlot $slots;

  WAutocomplete({
    Key? key,
    WAutocompleteOn? on,
    WAutocompleteProp? props,
    WAutocompleteSlot? slots,
  }) : super(key: key) {
    $on = on ?? WAutocompleteOn();
    $props = props ?? WAutocompleteProp(value: '');
    $slots = slots ?? WAutocompleteSlot(null);
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
