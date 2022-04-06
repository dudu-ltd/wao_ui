import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  var cardBasic = Demo(
    'cardBasic',
    WCard()
      ..$slots.$ = List.generate(
        4,
        (index) => Text('列表内容${index + 1}'),
      )
      ..$slots.header = Row(
        children: [
          const Expanded(
            child: Text(
              '卡片名称',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          WButton()
            ..$props.type = 'text'
            ..$props.size = 'mini'
            ..$slots.$ = Text(
              '操作按钮',
              style: TextStyle(
                color: CfgGlobal.primaryColor,
              ),
            ),
        ],
      ),
    r'''
    WCard()
      ..$slots.$ = List.generate(
        4,
        (index) => Text('列表内容${index + 1}'),
      )
      ..$slots.header = Row(
        children: [
          const Expanded(
            child: Text(
              '卡片名称',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          WButton()
            ..$props.type = 'text'
            ..$props.size = 'mini'
            ..$slots.$ = Text(
              '操作按钮',
              style: TextStyle(
                color: CfgGlobal.primaryColor,
              ),
            ),
        ],
      ),
    ''',
  );

  var cardSimple = Demo(
    'cardSimple',
    WCard()
      ..$style?.width = 480
      ..$slots.$ = List.generate(
        4,
        (index) => Text('列表内容${index + 1}'),
      ),
    r'''
    WCard()
      ..$slots.$ = List.generate(
        4,
        (index) => Text('列表内容${index + 1}'),
      )
    ''',
  );

  var cardImage = Demo(
    'cardImage',
    WCard()
      // ..$style?.width = 480
      ..$style?.padding = EdgeInsets.zero
      ..$style?.spacing = 0
      ..$slots.$ = [
        WImage()
          ..$props.src = 'assets:logo.png'
          ..$props.fit = BoxFit.cover,
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 641),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('WaoUI'),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        DateTime.now().toString(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    WButton()
                      ..$props.type = 'text'
                      ..$props.size = 'mini'
                      ..$on.click = (() => print('click here'))
                      ..$slots.$ = '操作按钮',
                  ],
                )
              ],
            ),
          ),
        )
      ],
    r'''
    WCard()
      // ..$style?.width = 480
      ..$style?.padding = EdgeInsets.zero
      ..$style?.spacing = 0
      ..$slots.$ = [
        WImage()
          ..$props.src = 'assets:logo.png'
          ..$props.fit = BoxFit.cover,
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 641),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('WaoUI'),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        DateTime.now().toString(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    WButton()
                      ..$props.type = 'text'
                      ..$props.size = 'mini'
                      ..$on.click = (() => print('click here'))
                      ..$slots.$ = '操作按钮',
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ''',
  );

  var cardShadowAlways = Demo(
    'cardShadowAlways',
    WCard()
      ..$props.shadow = 'always'
      ..$slots.$ = const Text(
        '总是显示',
      ),
    r'''
    WCard()
      ..$props.shadow = 'always'
      ..$slots.$ = const Text(
        '总是显示',
      )
    ''',
  );

  var cardShadowHover = Demo(
    'cardShadowHover',
    WCard()
      ..$props.shadow = 'hover'
      ..$slots.$ = const Text(
        '鼠标悬停时显示',
      ),
    r'''
    WCard()
      ..$props.shadow = 'hover'
      ..$slots.$ = const Text(
        '鼠标悬停时显示',
      )
    ''',
  );

  var cardShadowNone = Demo(
    'cardShadowNone',
    WCard()
      ..$props.shadow = 'never'
      ..$slots.$ = const Text(
        '从不显示',
      ),
    r'''
    WCard()
      ..$props.shadow = 'never'
      ..$slots.$ = const Text(
        '从不显示',
      )
    ''',
  );
}
