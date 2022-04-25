List<Map<String, dynamic>> demoTreeJson = [
  {
    "id": "demo",
    "text": "demo",
    "children": [
      {
        "id": "menu",
        "text": "menu.dart",
        "content": r'''
      WContainerLayout()
        ..$slots.header = (WHeader()
          ..$slots.$ = (WMenu()
            ..$props.value = ValueNotifier('1')
            ..$props.mode = 'horizontal')
            ..$slots.$ = [
              {
                'text': 'File',
                'value': '1',
                'children': [
                  [
                    {'text': 'New File', 'value': '1-1'},
                    {'text': 'New File...', 'value': '1-2'},
                    {'text': 'New Window', 'value': '1-3'},
                  ],
                  [
                    {'text': 'Open File...', 'value': '1-4'},
                    {'text': 'Open Folder...', 'value': '1-5'},
                    {'text': 'Open Workspace from File...', 'value': '1-6'},
                    {
                      'text': 'New Window',
                      'value': '1-7',
                      'children': [
                        [
                          {'text': 'Reopen Closed Editor', 'value': '1-7-1'},
                        ],
                        [
                          {'text': 'More...', 'value': '1-7-2'},
                        ],
                        [
                          {'text': 'Clear Recently Opend', 'value': '1-7-3'},
                        ]
                      ]
                    },
                  ],
                  [
                    {'text': 'Add Folder to Workspace...', 'value': '1-8'},
                    {'text': 'Save Workspace As...', 'value': '1-9'},
                    {'text': 'Duplicate Workspace', 'value': '1-10'},
                  ],
                ],
              },
              {
                'text': 'Edit',
                'value': '2',
                'children': [
                  [
                    {'text': 'Undo', 'value': '2-1'},
                    {'text': 'Redo', 'value': '2-2'},
                  ],
                  [
                    {'text': 'Cut', 'value': '2-3'},
                    {'text': 'Copy', 'value': '2-4'},
                    {'text': 'Paste', 'value': '2-5'},
                  ],
                ]
              },
              {'text': 'Selection', 'value': '3'},
              {'text': 'View', 'value': '4'},
              {'text': 'Go', 'value': '5'},
              {'text': 'Run', 'value': '6'},
              {'text': 'Terminal', 'value': '7'},
              {
                'text': 'Help',
                'value': '8',
                'children': [
                  [
                    {'text': 'New File', 'value': '1-1'},
                  ],
                ]
              },
            ])'''
      },
      {
        "id": "nav",
        "text": "nav.dart",
        "content": r'''
  Widget get editorZoom {
    return StatefulBuilder(builder: (ctx, setState) {
      TextSpan result =
          SyntaxHighlighter(source: fileContent.value).highlight(ctx);
      var richText = SelectableText.rich(result);
      return Container(
        padding: const EdgeInsets.all(20),
        width: 870,
        color: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: richText,
        ),
      );
    });
  }'''
      },
      {"id": "collapse", "text": "collapse", "content": r''''''},
    ]
  },
];
