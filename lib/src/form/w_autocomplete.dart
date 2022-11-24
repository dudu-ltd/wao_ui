// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../../core/base_mixins.dart';
import '../../core/base_on.dart';
import '../../core/base_prop.dart';
import '../../core/base_slot.dart';
import '../../wao_ui.dart';

class WAutocomplete extends WStatelessWidget<WAutocompleteOn, WAutocompleteProp,
    WAutocompleteSlot, WAutocompleteStyle> {
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
    init();
  }

  @override
  Widget wbuild(BuildContext context) {
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
