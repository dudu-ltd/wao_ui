import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_style.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demo/menu/_index.dart';
import '../jsonData/tree_json.dart';
import '../third_party/syntax_highlight.dart';

class Demo extends StatelessWidget {
  Demo({Key? key}) : super(key: key);

  late BuildContext cxt;
  @override
  Widget build(BuildContext context) {
    cxt = context;
    style();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 73.5, horizontal: 88),
      child: shadowWrapper(
        Center(
            child: SizedBox(
          height: 600,
          width: 1360,
          child: WContainerLayout()
            ..$slots.header = (WHeader()
              ..$style.clazz.addAll(['.demo-dark'])
              ..$slots.$ = (WMenu()
                ..$style.clazz.addAll(['.demo-dark'])
                ..$props.menuTrigger = 'click'
                ..$props.value = ValueNotifier('1')
                ..$slots.$ = menus
                ..$props.mode = 'horizontal'))
            ..$slots.footer = ColoredBox(
              color: Colors.black38,
              child: Center(
                  child: Text(
                '状态',
                style: TextStyle(
                  color: CfgGlobal.textColor.shade50,
                ),
              )),
            )
            ..$props.footerHeight = 30
            ..$slots.asideLeft = ColoredBox(
              color: CfgGlobal.basicColor.shade50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      WButton()
                        ..$props.icon = Icons.file_copy
                        ..$props.circle = true
                        ..$style.clazz.addAll(['.demo-dark']),
                      WButton()
                        ..$props.icon = Icons.search
                        ..$props.circle = true
                        ..$style.clazz.addAll(['.demo-dark']),
                      WButton()
                        ..$props.icon = Icons.menu
                        ..$props.circle = true
                        ..$style.clazz.addAll(['.demo-dark']),
                    ],
                  )),
                  settingBtn,
                ],
              ),
            )
            ..$props.headerHeight = 57
            ..$props.asideLeftWidth = 50
            ..$slots.$ = editor,
        )),
      ),
    );
  }

  Widget get settingBtn {
    return WMenu(
      key: GlobalKey(),
      props: WMenuProp(
        defaultActive: '1-4-1',
        collapse: true,
      ),
      slots: WMenuSlot([
        WSubmenu(
          props: WSubmenuProp(
            index: '1',
          ),
          slots: WSubmenuSlot(
            [
              WMenuItemGroup(
                slots: WMenuItemGroupSlot(
                  [
                    WMenuItem(
                      props: WMenuItemProp(index: '1-1'),
                      slots: WMenuItemSlot('选项1'),
                    ),
                    WMenuItem(
                      props: WMenuItemProp(index: '1-2'),
                      slots: WMenuItemSlot('选项2'),
                    ),
                  ],
                ),
              ),
              WMenuItemGroup(
                slots: WMenuItemGroupSlot(
                  [
                    WMenuItem(
                      props: WMenuItemProp(index: '1-3'),
                      slots: WMenuItemSlot('选项3'),
                    ),
                  ],
                ),
              ),
            ],
            title: WMenuItem(
              slots: WMenuItemSlot(
                Center(
                  child: WButton()
                    ..$props.icon = Icons.person
                    ..$props.circle = true
                    ..$style.clazz.addAll(['.demo-dark']),
                ),
                title: '导航一',
              ),
            ),
          ),
        ),
        WSubmenu(
          props: WSubmenuProp(index: '1-4'),
          slots: WSubmenuSlot(
            [
              WMenuItem(
                props: WMenuItemProp(index: '2-4-1'),
                slots: WMenuItemSlot(
                  '选项1',
                ),
              )
            ],
            title: WMenuItem(
              slots: WMenuItemSlot(
                Center(
                  child: WButton()
                    ..$props.icon = Icons.settings
                    ..$props.circle = true
                    ..$style.clazz.addAll(['.demo-dark']),
                ),
                title: '导航一',
              ),
            )..$style.backgroundColor = Colors.white,
          ),
        ),
      ]),
    )..$style.clazz = ['no-border'];
  }

  Widget get editor {
    return WContainerLayout()
      ..$slots.asideLeft = collapse
      ..$props.leftJudge = true
      ..$slots.$ = operate;
  }

  Widget get operate {
    return WContainerLayout()
      ..$props.footerJudge = true
      ..$props.footerHeight = 120
      ..$slots.$ = tabs
      ..$slots.footer = cmd;
  }

  Widget get cmd {
    return WTabs()
      ..$props.closable = true
      ..$style.backgroundColor = CfgGlobal.basicColor.shade50
      ..$props.value = openFile.value
      ..$slots.$ = [
        WTabPane()
          ..$props.label = 'TERMINAL'
          ..$props.name = 'TERMINAL'
          ..$props.closable = true
          ..$style.backgroundColor = Colors.grey.shade300
          ..$slots.$ = ClipRect(
            child: SelectableText(r'''尝试新的跨平台 PowerShell https://aka.ms/pscore6
          
PS D:\work\meta_number\wao_ui>'''),
          ),
        WTabPane()
          ..$props.label = 'DEBUG CONSOLE'
          ..$props.name = 'DEBUG CONSOLE'
          ..$props.closable = true
          ..$style.backgroundColor = Colors.grey.shade300
          ..$slots.$ = SelectableText(r'''DEBUG CONSOLE''')
      ];
  }

  ValueNotifier<List> openFiles = ValueNotifier([]);
  ValueNotifier<String> openFile = ValueNotifier('');
  PlainTree? _fileTree;
  Widget get tabs {
    return StatefulBuilder(builder: (cxt, setState) {
      openFiles.addListener(() => setState(() {}));
      if (openFiles.value.isEmpty) return WEmpty();
      var tabs = WTabs()
        ..$props.value = null
        // ..$props.closable = true
        ..$on.tabClick = (e) {
          openFile.value = e;
          _fileTree?.$props.value = e;
          // print(openFile.value);
        }
        ..$style.backgroundColor = CfgGlobal.basicColor.shade50
        ..$props.value = openFile.value
        ..$slots.$ = List.generate(openFiles.value.length, (index) {
          var node = openFiles.value[index];
          return WTabPane()
            ..$props.label = node.text
            ..$props.name = node.id
            ..$props.closable = true
            ..$style.backgroundColor = Colors.grey.shade300
            ..$slots.$ = editorZoom(node);
        });

      return tabs;
    });
  }

  Widget editorZoom(node) {
    var lines = node.content.split('\n');
    TextSpan result = SyntaxHighlighter(source: node.content).highlight(cxt);
    var richText = SelectableText.rich(result);
    return ColoredBox(
      color: Colors.grey.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WBreadcrumb()
            ..$props.separator = ' > '
            ..$slots.$ = [
              WBreadcrumbData()..text = 'demo',
              WBreadcrumbData()
                ..icon = Icons.language
                ..text = node.text,
            ],
          const Divider(),
          SizedBox(
            height: 431 - 123,
            child: node.content.isEmpty
                ? Center(child: WEmpty())
                : (WScrollSnap(
                    key: GlobalKey(),
                  )..$slots.content = Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 40,
                        child: ColoredBox(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: List.generate(
                                lines.length ?? 10,
                                (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text('${index + 1}'),
                                    )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: richText,
                      ),
                    ],
                  )),
          ),
        ],
      ),
    );
  }

  Widget get collapse {
    return WCollapse(
      props: WCollapseProp(value: [1], accordion: true),
      slots: WCollapseSlot(inner),
    )..$style.clazz.addAll(['.demo-dark']);
  }

  List<Widget> get inner {
    return [
      WCollapseItem()
        ..$props.title = 'WORKSPACE'
        ..$props.name = 1
        ..$slots.$ = fileTree,
      WCollapseItem()
        ..$props.title = 'OPEN EDITORS'
        ..$props.name = 2,
      WCollapseItem()
        ..$props.title = 'OUTLINE'
        ..$props.name = 3,
      WCollapseItem()
        ..$props.title = 'TIMELINE'
        ..$props.name = 4,
      WCollapseItem()
        ..$props.title = 'DEPENDENCES'
        ..$props.name = 5,
    ];
  }

  Widget get fileTree {
    return _fileTree = PlainTree(
      props: PlainTreeProp(data: demoTreeJson),
    )..$on.nodeClick = (ctx, node) {
        return () {
          selectFileByNode(node);
        };
      };
  }

  selectFileByNode(node) {
    if (!openFiles.value.contains(node)) {
      openFiles.value.add(node);
    }
    openFile.value = node.id;
    openFiles.notifyListeners();
  }

  style() {
    CfgGlobal.css.addAll({
      // [
      //   [Clazz.menu, Clazz.horizontalSuf, '.demo-dark']
      // ]: BaseStyle()..backgroundColor = CfgGlobal.basicColor.shade100,
      [
        [Clazz.menu, 'no-border']
      ]: BaseStyle()..border = Border.all(width: 0, color: Colors.white),
      [
        [Clazz.menu, Clazz.menuItem, Clazz.horizontalSuf, '.demo-dark'],
        [Clazz.menu, Clazz.horizontalSuf, '.demo-dark', Clazz.titleSuf]
      ]: BaseStyle()..backgroundColor = CfgGlobal.basicColor.shade100,
      [
        [Clazz.collapse, '.demo-dark']
      ]: BaseStyle()
        ..paddingLeft = 10
        ..backgroundColor = Colors.grey.shade100,
      [
        [Clazz.header, '.demo-dark']
      ]: BaseStyle()..padding = EdgeInsets.zero,
      [
        [Clazz.footer, '.demo-dark']
      ]: BaseStyle()..padding = EdgeInsets.zero,
      [
        [Clazz.button, '.menu-btn', '.demo-dark']
      ]: BaseStyle()..padding = EdgeInsets.zero,
      [
        [Clazz.button, '.demo-dark']
      ]: BaseStyle()
        ..backgroundColor = Colors.transparent
        ..color = CfgGlobal.textColor.shade500,
      [
        [Clazz.button, '.demo-dark', Clazz.active],
        [Clazz.button, '.demo-dark', Clazz.isActive],
      ]: BaseStyle()
        ..backgroundColor = Colors.transparent
        ..color = CfgGlobal.primaryColor,
      [
        [Clazz.button, Clazz.hover, '.demo-dark']
      ]: BaseStyle()
        // ..backgroundColor = Colors.transparent
        ..color = CfgGlobal.textColor.shade800,
      [
        ['.no-padding']
      ]: BaseStyle()..padding = EdgeInsets.zero
    });
  }
}
