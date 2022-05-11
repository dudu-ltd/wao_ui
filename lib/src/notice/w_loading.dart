import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/layout_util.dart';
import 'package:wao_ui/src/others/w_spin.dart';
import 'package:wao_ui/wao_ui.dart';

extension WidgetLoading on Widget {
  static final Map<Widget, ValueNotifier<bool>> _instanceLoading = {};
  ValueNotifier<bool> get _loading {
    var loading = _instanceLoading.putIfAbsent(this, () {
      var _loading = ValueNotifier(false);
      _loading.addListener(() {
        if (_loading.value && key is GlobalKey) {
          print('show loading');
          // TODO 拓展 wLoading 的具体操作，在当前组件的范围内，弹出等待框
          // Timer(Duration(milliseconds: 300), () {
          //   GlobalKey _key = key as GlobalKey;
          //   showDialog(
          //     context: _key.currentContext!,
          //     builder: (c) => WSpin(
          //       child: Icon(Icons.check),
          //     ),
          //     useRootNavigator: false,
          //   );
          // });
        }
      });
      return _loading;
    });
    return loading;
  }

  bool get wLoading {
    return _loading.value;
  }

  set wLoading(bool loadingValue) {
    _loading.value = loadingValue;
  }
}

class WLoading extends WStatelessWidget<WLoadingOn, WLoadingProp, WLoadingSlot,
    WLoadingStyle> {
  WLoading({
    Key? key,
    WLoadingOn? on,
    WLoadingProp? props,
    WLoadingSlot? slots,
    WLoadingStyle? style,
  }) : super(key: key) {
    $on = on ?? WLoadingOn();
    $props = props ?? WLoadingProp();
    $slots = slots ?? WLoadingSlot(null);
    $style = style ?? WLoadingStyle();
    init();
  }

  @override
  Widget wbuild(BuildContext context) {
    return Container();
  }
}

class WLoadingOn extends BaseOn {}

class WLoadingProp extends BaseProp {}

class WLoadingSlot extends BaseSlot {
  WLoadingSlot(defaultSlotBefore) : super(defaultSlotBefore);
}
