// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../../../wao_ui.dart';
import '../../base_style.dart';

form() {
  var inline = Clazz.inline;
  var isFirst = Clazz.firstChild;
  var isLast = Clazz.lastChild;
  var _form = Clazz.form = '.el-form';

  var _labelTop = '--label-top';

  var _formItem = Clazz.formItem = '.el-form-item';

  CfgGlobal.selectors.addAll({
    'WForm': (cpn) {
      cpn as WForm;
      return [_form];
    },
  });

  CfgGlobal.css.addAll({
    [
      [_form]
    ]: WFormStyle(),
  });

  CfgGlobal.selectors.addAll({
    'WFormItem': (cpn) {
      cpn as WFormItem;
      print(cpn.$props.isFirst);
      return [
        _formItem,
        if (cpn.belongTo?.$props.inline ?? false) inline,
        if (cpn.belongTo?.$props.isLabelPositionTop ?? false) _labelTop,
        if (cpn.$props.isFirst) isFirst,
        if (cpn.$props.isLast) isLast,
      ];
    },
  });
  CfgGlobal.css.addAll({
    [
      [_formItem]
    ]: WFormItemStyle(),
    [
      [_formItem, _labelTop]
    ]: WFormItemStyle()..maxHeight = 100,
    [
      [_formItem, inline]
    ]: WFormItemStyle()
      ..padding = const EdgeInsets.symmetric(horizontal: 8)
      ..width = 200,
    [
      [_formItem, inline, isFirst]
    ]: WFormItemStyle()..paddingLeft = 0,
    [
      [_formItem, inline, isLast]
    ]: WFormItemStyle()..paddingRight = 0,
  });
}
