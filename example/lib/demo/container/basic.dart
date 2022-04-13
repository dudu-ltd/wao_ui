import 'package:example/demo/demos.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_style.dart';
import 'package:wao_ui/wao_ui.dart';

var containerBasic1 = Demo(
  'containerBasic1',
  WContainer()
    ..$slots.$ = [
      WHeader()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade100
        ..$style.textAlign = Alignment.center
        ..$slots.$ = const Text("Header"),
      WMain()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade200
        ..$style.textAlign = Alignment.center
        ..$slots.$ = const SingleChildScrollView(
          child: Text("Main"),
        ),
    ]
    ..$style.height = 300,
  r'''
  WContainer()
    ..$slots.$ = [
      WHeader()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade100
        ..$style.textAlign = Alignment.center
        ..$slots.$ = const Text("Header"),
      WMain()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade200
        ..$style.textAlign = Alignment.center
        ..$slots.$ = const SingleChildScrollView(
          child: Text("Main"),
        ),
    ]
    ..$style.height = 300,
  ''',
);

var containerBasic2 = Demo(
  'containerBasic2',
  WContainer()
    ..$slots.$ = [
      WHeader()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade100
        ..$style.textAlign = Alignment.center
        ..$slots.$ = const Text("Header"),
      WMain()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade200
        ..$style.textAlign = Alignment.center
        ..$slots.$ = const SingleChildScrollView(
          child: Text("Main"),
        ),
      WFooter()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade300
        ..$style.textAlign = Alignment.center
        ..$slots.$ = const Text("Footer"),
    ]
    ..$style.height = 300,
  r'''
  WContainer()
    ..$slots.$ = [
      WHeader()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade100
        ..$style.textAlign = Alignment.center
        ..$slots.$ = const Text("Header"),
      WMain()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade200
        ..$style.textAlign = Alignment.center
        ..$slots.$ = const SingleChildScrollView(
          child: Text("Main"),
        ),
      WFooter()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade300
        ..$style.textAlign = Alignment.center
        ..$slots.$ = const Text("Footer"),
    ]
    ..$style.height = 300,
  ''',
);

var containerBasic3 = Demo(
  'containerBasic3',
  WContainer()
    ..$slots.$ = [
      WAside()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade100
        ..$style.textAlign = Alignment.center
        ..$style.height = 300
        ..$slots.$ = const SingleChildScrollView(
          child: Text("Aside"),
        ),
      WMain()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade200
        ..$style.textAlign = Alignment.center
        ..$slots.$ = const SingleChildScrollView(
          child: Text("Main"),
        ),
    ]
    ..$style.height = 300,
  r'''
  WContainer()
    ..$slots.$ = [
      WAside()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade100
        ..$style.textAlign = Alignment.center
        ..$style.height = 300
        ..$slots.$ = const SingleChildScrollView(
          child: Text("Aside"),
        ),
      WMain()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade200
        ..$style.textAlign = Alignment.center
        ..$slots.$ = const SingleChildScrollView(
          child: Text("Main"),
        ),
    ]
    ..$style.height = 300,
  ''',
);

var containerBasic4 = Demo(
  'containerBasic4',
  WContainer()
    ..$slots.$ = [
      WHeader()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade100
        ..$style.textAlign = Alignment.center
        ..$slots.$ = const Text("Header"),
      WContainer()
        ..$slots.$ = [
          WAside()
            ..$style.backgroundColor = CfgGlobal.primaryColor.shade200
            ..$style.textAlign = Alignment.center
            ..$style.height = 240
            ..$slots.$ = const SingleChildScrollView(
              child: Text("Aside"),
            ),
          WMain()
            ..$style.backgroundColor = CfgGlobal.primaryColor.shade300
            ..$style.textAlign = Alignment.center
            ..$slots.$ = const SingleChildScrollView(
              child: Text("Main"),
            ),
        ],
    ]
    ..$style.height = 300,
  r'''
  WContainer()
    ..$slots.$ = [
      WHeader()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade100
        ..$style.textAlign = Alignment.center
        ..$slots.$ = const Text("Header"),
      WContainer()
        ..$slots.$ = [
          WAside()
            ..$style.backgroundColor = CfgGlobal.primaryColor.shade200
            ..$style.textAlign = Alignment.center
            ..$style.height = 240
            ..$slots.$ = const SingleChildScrollView(
              child: Text("Aside"),
            ),
          WMain()
            ..$style.backgroundColor = CfgGlobal.primaryColor.shade300
            ..$style.textAlign = Alignment.center
            ..$slots.$ = const SingleChildScrollView(
              child: Text("Main"),
            ),
        ],
    ]
    ..$style.height = 300,
  ''',
);

var containerBasic5 = Demo(
  'containerBasic5',
  WContainer()
    ..$slots.$ = [
      WHeader()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade100
        ..$style.textAlign = Alignment.center
        ..$slots.$ = const Text("Header"),
      WContainer()
        ..$slots.$ = [
          WAside()
            ..$style.backgroundColor = CfgGlobal.primaryColor.shade200
            ..$style.textAlign = Alignment.center
            ..$style.height = 240
            ..$slots.$ = const SingleChildScrollView(
              child: Text("Aside"),
            ),
          WContainer()
            ..$slots.$ = [
              WMain()
                ..$style.backgroundColor = CfgGlobal.primaryColor.shade300
                ..$style.textAlign = Alignment.center
                ..$slots.$ = const SingleChildScrollView(
                  child: Text("Main"),
                ),
              WFooter()
                ..$style.backgroundColor = CfgGlobal.primaryColor.shade400
                ..$style.textAlign = Alignment.center
                ..$slots.$ = const Text("Footer"),
            ],
        ],
    ]
    ..$style.height = 300,
  r'''
  WContainer()
    ..$slots.$ = [
      WHeader()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade100
        ..$style.textAlign = Alignment.center
        ..$slots.$ = const Text("Header"),
      WContainer()
        ..$slots.$ = [
          WAside()
            ..$style.backgroundColor = CfgGlobal.primaryColor.shade200
            ..$style.textAlign = Alignment.center
            ..$style.height = 240
            ..$slots.$ = const SingleChildScrollView(
              child: Text("Aside"),
            ),
          WContainer()
            ..$slots.$ = [
              WMain()
                ..$style.backgroundColor = CfgGlobal.primaryColor.shade300
                ..$style.textAlign = Alignment.center
                ..$slots.$ = const SingleChildScrollView(
                  child: Text("Main"),
                ),
              WFooter()
                ..$style.backgroundColor = CfgGlobal.primaryColor.shade400
                ..$style.textAlign = Alignment.center
                ..$slots.$ = const Text("Footer"),
            ],
        ],
    ]
    ..$style.height = 300,
  ''',
);

var containerBasic6 = Demo(
  'containerBasic6',
  WContainer()
    ..$slots.$ = [
      WAside()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade100
        ..$style.textAlign = Alignment.center
        ..$style.height = 300
        ..$slots.$ = const SingleChildScrollView(
          child: Text("Aside"),
        ),
      WContainer()
        ..$slots.$ = [
          WHeader()
            ..$style.backgroundColor = CfgGlobal.primaryColor.shade200
            ..$style.textAlign = Alignment.center
            ..$slots.$ = const Text("Header"),
          WMain()
            ..$style.backgroundColor = CfgGlobal.primaryColor.shade300
            ..$style.textAlign = Alignment.center
            ..$slots.$ = const SingleChildScrollView(
              child: Text("Main"),
            ),
        ],
    ]
    ..$style.height = 300,
  r'''
  WContainer()
    ..$slots.$ = [
      WAside()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade100
        ..$style.textAlign = Alignment.center
        ..$style.height = 300
        ..$slots.$ = const SingleChildScrollView(
          child: Text("Aside"),
        ),
      WContainer()
        ..$slots.$ = [
          WHeader()
            ..$style.backgroundColor = CfgGlobal.primaryColor.shade200
            ..$style.textAlign = Alignment.center
            ..$slots.$ = const Text("Header"),
          WMain()
            ..$style.backgroundColor = CfgGlobal.primaryColor.shade300
            ..$style.textAlign = Alignment.center
            ..$slots.$ = const SingleChildScrollView(
              child: Text("Main"),
            ),
        ],
    ]
    ..$style.height = 300,
  ''',
);

var containerBasic7 = Demo(
  'containerBasic7',
  WContainer()
    ..$slots.$ = [
      WAside()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade100
        ..$style.textAlign = Alignment.center
        ..$style.height = 300
        ..$style.width = 200
        ..$slots.$ = const SingleChildScrollView(
          child: Text("Aside"),
        ),
      WContainer()
        ..$slots.$ = [
          WHeader()
            ..$style.backgroundColor = CfgGlobal.primaryColor.shade200
            ..$style.textAlign = Alignment.center
            ..$slots.$ = const Text("Header"),
          WMain()
            ..$style.backgroundColor = CfgGlobal.primaryColor.shade300
            ..$style.textAlign = Alignment.center
            ..$slots.$ = const SingleChildScrollView(
              child: Text("Main"),
            ),
          WFooter()
            ..$style.backgroundColor = CfgGlobal.primaryColor.shade400
            ..$style.textAlign = Alignment.center
            ..$slots.$ = const Text("Footer"),
        ],
    ]
    ..$style.height = 300,
  r'''
  WContainer()
    ..$slots.$ = [
      WAside()
        ..$style.backgroundColor = CfgGlobal.primaryColor.shade100
        ..$style.textAlign = Alignment.center
        ..$style.height = 300
        ..$style.width = 200
        ..$slots.$ = const SingleChildScrollView(
          child: Text("Aside"),
        ),
      WContainer()
        ..$slots.$ = [
          WHeader()
            ..$style.backgroundColor = CfgGlobal.primaryColor.shade200
            ..$style.textAlign = Alignment.center
            ..$slots.$ = const Text("Header"),
          WMain()
            ..$style.backgroundColor = CfgGlobal.primaryColor.shade300
            ..$style.textAlign = Alignment.center
            ..$slots.$ = const SingleChildScrollView(
              child: Text("Main"),
            ),
          WFooter()
            ..$style.backgroundColor = CfgGlobal.primaryColor.shade400
            ..$style.textAlign = Alignment.center
            ..$slots.$ = const Text("Footer"),
        ],
    ]
    ..$style.height = 300,
  ''',
);

var containerBase = Demo(
    'containerBase',
    WContainerLayout()
      ..$props.barSize = 3.0
      ..$props.leftJudge = true
      ..$props.rightJudge = true
      ..$props.headerJudge = true
      ..$props.footerJudge = true
      //
      ..$slots.header = Container(
        decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade100),
        child: const Center(child: Text("HEADER")),
      )
      //
      ..$slots.asideLeft = Container(
        decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade200),
        child: const Center(child: Text("LEFT")),
      )
      //
      ..$slots.$ = Container(
        decoration: BoxDecoration(
          color: CfgGlobal.primaryColor.shade300,
        ),
        child: const Center(
          child: Text("Main"),
        ),
      )
      //
      ..$slots.asideRight = Container(
        decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade400),
        child: const Center(child: Text("RIGHT")),
      )
      //
      ..$slots.footer = Container(
        decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade500),
        child: const Center(child: Text("FOOTER")),
      )
      ..$style.height = 300,
    r'''
    WContainerLayout()
      ..$props.barSize = 3.0
      ..$props.leftJudge = true
      ..$props.rightJudge = true
      ..$props.headerJudge = true
      ..$props.footerJudge = true
      ..$slots.$ = Container(
        decoration: BoxDecoration(
          color: CfgGlobal.primaryColor.shade300,
        ),
        child: const Center(
          child: Text("Main"),
        ),
      )
      //
      ..$slots.asideLeft = Container(
        decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade600),
        child: const Center(child: Text("LEFT")),
      )
      //
      ..$slots.asideRight = const Padding(
        padding: EdgeInsets.zero,
        child: Center(child: Text("RIGHT")),
      )
      //
      ..$slots.footer = Container(
        decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade400),
        child: const Center(child: Text("FOOTER")),
      )
      //
      ..$slots.header = Container(
        decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade200),
        child: const Center(child: Text("HEADER")),
      )
      ..$style.height = 300,
    ''');
