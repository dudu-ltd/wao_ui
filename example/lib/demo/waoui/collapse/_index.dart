import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

import '../../demos.dart';

regist() {
  var collapseBasic = Demo(
    'collapseBasic',
    WCollapse()
      ..$props.model = ['First']
      ..$slots.$ = [
        WCollapseItem()
          ..$props.name = 'First'
          ..$props.title = '初衷'
          ..$slots.$ = '一栈全端，通过一个技术栈，满足全端开发的需求。',
        WCollapseItem()
          ..$props.name = 'Future'
          ..$props.title = '展望'
          ..$slots.$ = '形成可定制主题的全端UI框架，融入具有传统文化特色的元素，在科技输出的同时，满足文化输出的需求。',
      ],
    r'''
    WCollapse()
      ..$props.model = ['First']
      ..$slots.$ = [
        WCollapseItem()
          ..$props.name = 'First'
          ..$props.title = '初衷'
          ..$slots.$ = '一栈全端，通过一个技术栈，满足全端开发的需求。',
        WCollapseItem()
          ..$props.name = 'Future'
          ..$props.title = '展望'
          ..$slots.$ = '形成可定制主题的全端UI框架，融入具有传统文化特色的元素，在科技输出的同时，满足文化输出的需求。',
      ]
    ''',
  );

  var collapseAccordion = Demo(
    'collapseAccordion',
    WCollapse()
      ..$props.accordion = true
      ..$props.model = 'Future'
      ..$slots.$ = [
        WCollapseItem()
          ..$props.name = 'First'
          ..$props.title = '初衷'
          ..$slots.$ = '一栈全端，通过一个技术栈，满足全端开发的需求。',
        WCollapseItem()
          ..$props.name = 'Future'
          ..$props.title = '展望'
          ..$slots.$ = '形成可定制主题的全端UI框架，融入具有传统文化特色的元素，在科技输出的同时，满足文化输出的需求。',
      ],
    r'''
    WCollapse()
      ..$props.accordion = true
      ..$props.model = 'First'
      ..$slots.$ = [
        WCollapseItem()
          ..$props.name = 'First'
          ..$props.title = '初衷'
          ..$slots.$ = '一栈全端，通过一个技术栈，满足全端开发的需求。',
        WCollapseItem()
          ..$props.name = 'Future'
          ..$props.title = '展望'
          ..$slots.$ = '形成可定制主题的全端UI框架，融入具有传统文化特色的元素，在科技输出的同时，满足文化输出的需求。',
      ]
    ''',
  );
}
