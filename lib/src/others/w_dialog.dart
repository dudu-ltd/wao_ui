import 'package:flutter/material.dart';
import 'package:simple_observable/simple_observable.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class WDialog extends StatelessWidget
    implements BaseWidget<WDialogOn, WDialogProp, WDialogSlot> {
  @override
  late final WDialogOn $on;

  @override
  late final WDialogProp $props;

  @override
  late final WDialogSlot $slots;

  Function(bool value)? show;

  WDialog(
    Widget defalutSlot, {
    Key? key,
    WDialogOn? on,
    WDialogProp? props,
    WDialogSlot? slots,
  }) : super(key: key) {
    $on = on ?? WDialogOn();
    $props = props ?? WDialogProp();
    $props._widget = this;
    $slots = slots ?? WDialogSlot();
    $slots.defalutSlot = defalutSlot;
  }

  setShow(BuildContext context) {
    show = (bool visible) {
      if (!visible) return;
      // ignore: prefer_function_declarations_over_variables
      var builder = (BuildContext context) {
        return AlertDialog(
          title: $slots.title ??
              ($props.title != null ? Text($props.title!) : null),
          content: $slots.defalutSlot!,
          actions: $slots.footer == null
              ? []
              : List.generate(
                  $slots.footer!.length,
                  (index) {
                    return Listener(
                      onPointerUp: (e) {
                        $props.visible = false;
                        Navigator.of(context).pop();
                      },
                      child: $slots.footer![index],
                    );
                  },
                ),
        );
      };
      showDialog(context: context, builder: builder).then((val) {
        $props.visible = false;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    setShow(context);
    $props.visible = false;
    print('--${$slots.footer}$hashCode');
    return $slots.btn != null
        ? InkWell(
            onTap: () {
              $props.visible = true;
            },
            child: $slots.btn!,
          )
        : $props.btn != null
            ? TextButton(
                onPressed: () {
                  $props.visible = true;
                },
                child: Text($props.btn!),
              )
            : const Offstage();
  }
}

class WDialogOn extends BaseOn {
  late Function beforeClose;
}

class WDialogProp extends BaseProp {
  Observable? _visibleListener;
  WDialog? _widget;

  set visible(visible) {
    _visibleListener ??= Observable<bool>(
        initialValue: false, onChanged: _widget!.show!, checkEquality: true);
    _visibleListener!.value = visible;
  }

  get visible {
    return _visibleListener?.value;
  }

  String? title;
  late String? btn;
  late String width;
  late bool fullscreen;
  late String top;
  late bool modal;
  late bool modalAppendToBody;
  late bool appendToBody;
  late bool lockScroll;
  late String? customClass;
  late bool closeOnClickModal;
  late bool closeOnPressEscape;
  late bool showClose;
  late bool center;
  late bool destroyOnClose;

  WDialogProp({
    btn,
    title,
    width,
    fullscreen,
    top,
    modal,
    modalAppendToBody,
    appendToBody,
    lockScroll,
    customClass,
    closeOnClickModal,
    closeOnPressEscape,
    showClose,
    center,
    destroyOnClose,
  }) {
    this.btn = btn;
    this.title = title;
    this.width = width ?? '50%';
    this.fullscreen = fullscreen ?? false;
    this.top = top ?? '15vh';
    this.modal = modal ?? true;
    this.modalAppendToBody = modalAppendToBody ?? true;
    this.appendToBody = appendToBody ?? false;
    this.lockScroll = lockScroll ?? true;
    this.customClass = customClass;
    this.closeOnClickModal = closeOnClickModal ?? true;
    this.closeOnPressEscape = closeOnPressEscape ?? true;
    this.showClose = showClose ?? true;
    this.center = center ?? false;
    this.destroyOnClose = destroyOnClose ?? false;
  }
}

class WDialogSlot extends BaseSlot {
  Widget? title;
  List<Widget>? footer;
  Widget? btn;
  WDialogSlot({this.title, this.footer, this.btn});
}
