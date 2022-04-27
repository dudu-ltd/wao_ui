import 'package:flutter/material.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  var inputBasic = Demo(
    'inputBasic',
    WInput()..$props.placeholder = '请输入内容',
    r'''
    WInput()..$props.placeholder = '请输入内容'
    ''',
  );

  var inputDisabled = Demo(
    'inputDisabled',
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.disabled = true,
    r'''
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.disabled = true
    ''',
  );

  var inputClearable = Demo(
    'inputClearable',
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.clearable = true,
    r'''
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.clearable = true
    ''',
  );

  var inputPassword = Demo(
    'inputPassword',
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.showPassword = true
      ..$props.clearable = true
      ..$props.suffixIcon = Icons.person_rounded,
    r'''
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.showPassword = true
      ..$props.clearable = true
      ..$props.suffixIcon = Icons.person_rounded
    ''',
  );

  var inputPropIcon1 = Demo(
    'inputPropIcon1',
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.suffixIcon = Icons.calendar_today_rounded,
    r'''
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.suffixIcon = Icons.calendar_today_rounded
    ''',
  );

  var inputPropIcon2 = Demo(
    'inputPropIcon2',
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.prefixIcon = Icons.search_rounded,
    r'''
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.prefixIcon = Icons.search_rounded
    ''',
  );

  var inputSlotIcon1 = Demo(
    'inputSlotIcon1',
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$slots.addSuffix(Icons.calendar_today_rounded),
    r'''
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$slots.addSuffix(Icons.calendar_today_rounded)
    ''',
  );

  var inputSlotIcon2 = Demo(
    'inputSlotIcon2',
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$slots.addPrefix(
        paddingWrapper(
          const Icon(
            Icons.search_rounded,
          ),
        ),
      ),
    r'''
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$slots.addPrefix(
        paddingWrapper(
          const Icon(
            Icons.search_rounded,
          ),
        ),
      )
    ''',
  );

  var inputTextArea = Demo(
    'inputTextArea',
    WInput()
      ..$props.type = 'textarea'
      ..$props.rows = 2
      ..$props.placeholder = '请输入内容',
    r'''
    WInput()
      ..$props.type = 'textarea'
      ..$props.rows = 2
      ..$props.placeholder = '请输入内容'
    ''',
  );

  var inputFitTextLength1 = Demo(
    'inputFitTextLength1',
    WInput()
      ..$props.type = 'textarea'
      ..$props.autosize = true
      ..$props.placeholder = '请输入内容',
    r'''
    WInput()
      ..$props.type = 'textarea'
      ..$props.autosize = true
      ..$props.placeholder = '请输入内容'
    ''',
  );

  var inputFitTextLength2 = Demo(
    'inputFitTextLength2',
    WInput()
      ..$props.type = 'textarea'
      ..$props.autosize = {'minRow': 2, 'maxRows': 4}
      ..$props.placeholder = '请输入内容',
    r'''
    WInput()
      ..$props.type = 'textarea'
      ..$props.autosize = {'minRow': 2, 'maxRows': 4}
      ..$props.placeholder = '请输入内容'
    ''',
  );

  var inputPrependSlot1 = Demo(
    'inputPrependSlot1',
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$slots.addPrepend(const Text('  http://  ')),
    r'''
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$slots.addPrepend(const Text('  http://  '))
    ''',
  );

  var inputAppendSlot1 = Demo(
    'inputAppendSlot1',
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$slots.addAppend(const Text('  .com  ')),
    r'''
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$slots.addAppend(const Text('  .com  '))
    ''',
  );

  var inputAppendSlot2 = Demo(
    'inputAppendSlot2',
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$slots.addAppend(const Icon(
        Icons.expand_more_rounded,
      )),
    r'''
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$slots.addAppend(const Icon(
        Icons.expand_more_rounded,
      ))
    ''',
  );

  var inputSize1 = Demo(
    'inputSize1',
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.suffixIcon = Icons.calendar_today_rounded,
    r'''
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.suffixIcon = Icons.calendar_today_rounded
    ''',
  );

  var inputSize2 = Demo(
    'inputSize2',
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.suffixIcon = Icons.calendar_today_rounded
      ..$props.size = 'medium',
    r'''
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.suffixIcon = Icons.calendar_today_rounded
      ..$props.size = 'medium'
    ''',
  );

  var inputSize3 = Demo(
    'inputSize3',
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.suffixIcon = Icons.calendar_today_rounded
      ..$props.size = 'small',
    r'''
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.suffixIcon = Icons.calendar_today_rounded
      ..$props.size = 'small'
    ''',
  );

  var inputSize4 = Demo(
    'inputSize4',
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.suffixIcon = Icons.calendar_today_rounded
      ..$props.size = 'mini',
    r'''
    WInput()
      ..$props.placeholder = '请输入内容'
      ..$props.suffixIcon = Icons.calendar_today_rounded
      ..$props.size = 'mini'
    ''',
  );

  var inputAutocomplete1 = Demo(
    'inputAutocomplete1',
    WAutocomplete()
      ..$props.placeholder = '请输入内容'
      ..$props.value = ''
      ..$props.fetchSuggestions = (q, fn) {},
    r'''
    WAutocomplete()
      ..$props.placeholder = '请输入内容'
      ..$props.value = ''
      ..$props.fetchSuggestions = (q, fn) {}
    ''',
  );

  var inputAutocomplate2 = Demo(
    'inputAutocomplate2',
    WAutocomplete()
      ..$props.placeholder = '请输入内容'
      ..$props.value = ''
      ..$props.fetchSuggestions = (q, fn) {},
    r'''
    WAutocomplete()
      ..$props.placeholder = '请输入内容'
      ..$props.value = ''
      ..$props.fetchSuggestions = (q, fn) {}
    ''',
  );

  var inputCustomTpl = Demo(
    'inputCustomTpl',
    Container(),
    r'''
  Container()
    ''',
  );

  var inputLengthLimit = Demo(
    'inputLengthLimit',
    WInput()
      ..$props.type = 'text'
      ..$props.placeholder = '请输入内容'
      ..$props.model = ''
      ..$props.maxlength = 10
      ..$props.showPassword = true,
    r'''
    WInput()
      ..$props.type = 'text'
      ..$props.placeholder = '请输入内容'
      ..$props.value = ''
      ..$props.maxlength = 10
      ..$props.showPassword = true
    ''',
  );

  var inputTextAreaLengthLimit = Demo(
    'inputTextAreaLengthLimit',
    WInput()
      ..$props.type = 'textarea'
      ..$props.placeholder = '请输入内容'
      ..$props.model = ''
      ..$props.maxlength = 30
      ..$props.showWordLimit = true,
    r'''
    WInput()
      ..$props.type = 'textarea'
      ..$props.placeholder = '请输入内容'
      ..$props.value = ''
      ..$props.maxlength = 30
      ..$props.showWordLimit = true
    ''',
  );
}
