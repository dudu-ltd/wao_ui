import 'package:example/demo/demos.dart';
import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

var w = SizedBox(
  height: 300,
  child: WContainerLayout()
    ..$props.barSize = 3.0
    ..$props.leftJudge = true
    ..$props.rightJudge = true
    ..$props.headerJudge = true
    ..$props.footerJudge = true
    ..$slots.$ = Container(
      child: const Center(
        child: Text("MAIN"),
      ),
      decoration: BoxDecoration(
        color: CfgGlobal.primaryColor.shade500,
      ),
    )
    //
    ..$slots.asideLeft = Container(
      child: const Center(child: Text("LEFT")),
      decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade600),
    )
    //
    ..$slots.asideRight = const Padding(
      padding: EdgeInsets.zero,
      child: Center(child: Text("RIGHT")),
    )
    //
    ..$slots.footer = Container(
      child: const Center(child: Text("FOOTER")),
      decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade700),
    )
    //
    ..$slots.header = Container(
      child: const Center(child: Text("HEADER")),
      decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade300),
    ),
);

var layout = SizedBox(
    height: 300,
    child: WContainerLayout(
      props: WContainerLayoutProp(
        barSize: 3.0,
        leftJudge: true,
        rightJudge: true,
        headerJudge: true,
        footerJudge: true,
      ),
      slots: WContainerLayoutSlot(
        Container(
          child: const Center(
            child: Text("MAIN"),
          ),
          decoration: BoxDecoration(
            color: CfgGlobal.primaryColor.shade500,
          ),
        ),
        asideLeft: Container(
          child: const Center(
            child: Text("LEFT"),
          ),
          decoration: BoxDecoration(
            color: CfgGlobal.primaryColor.shade600,
          ),
        ),
        asideRight: Container(
          child: const Center(
            child: Text("RIGHT"),
          ),
          decoration: BoxDecoration(
            color: CfgGlobal.primaryColor.shade400,
          ),
        ),
        footer: Container(
          child: const Center(
            child: Text("FOOTER"),
          ),
          decoration: BoxDecoration(
            color: CfgGlobal.primaryColor.shade700,
          ),
        ),
        header: Container(
          child: const Center(
            child: Text("HEADER"),
          ),
          decoration: BoxDecoration(
            color: CfgGlobal.primaryColor.shade300,
          ),
        ),
      ),
    ));

var containerBase = Demo('containerBase', w, '');

var header = Container(
  child: const Center(
    child: Text(
      "Header",
      style: TextStyle(height: 60 / 14, textBaseline: TextBaseline.ideographic),
      textAlign: TextAlign.start,
    ),
  ),
  decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade300),
);
var footer = Container(
  child: const Center(
      child: Text("Footer",
          style: TextStyle(
              height: 60 / 14, textBaseline: TextBaseline.ideographic))),
  decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade700),
);
var _main = Container(
  child: const Center(
      child: Text("MAIN",
          style: TextStyle(
              height: 60 / 14, textBaseline: TextBaseline.ideographic))),
  decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade500),
);

var containerBasic1 = Demo(
  'containerBasic1',
  SizedBox(
    height: 300,
    child: WContainer()
      ..$slots.$ = [
        WHeader()..$slots.$ = header,
        WMain()
          ..$slots.$ = Container(
            child: const Center(
              child: Text(
                "MAIN",
                style: TextStyle(
                  height: 240 / 14,
                  textBaseline: TextBaseline.ideographic,
                ),
              ),
            ),
            decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade500),
          ),
      ],
  ),
  r'''
  SizedBox(
    height: 300,
    child: WContainer()
      ..$slots.$ = [
        WHeader()..$slots.$ = header,
        WMain()
          ..$slots.$ = Container(
            child: const Center(
              child: Text(
                "MAIN",
                style: TextStyle(
                  height: 240 / 14,
                  textBaseline: TextBaseline.ideographic,textBaseline: TextBaseline.ideographic,textBaseline: TextBaseline.ideographic,textBaseline: TextBaseline.ideographic,textBaseline: TextBaseline.ideographic,textBaseline: TextBaseline.ideographic,textBaseline: TextBaseline.ideographic,textBaseline: TextBaseline.ideographic,textBaseline: TextBaseline.ideographic,textBaseline: TextBaseline.ideographic,textBaseline: TextBaseline.ideographic,textBaseline: TextBaseline.ideographic,textBaseline: TextBaseline.ideographic,textBaseline: TextBaseline.ideographic,
                ),
              ),
            ),
            decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade500),
          ),
      ],
  )''',
);

var containerBasic2 = Demo(
  'containerBasic2',
  SizedBox(
    height: 300,
    child: WContainer()
      ..$slots.$ = [
        WHeader()..$slots.$ = header,
        WMain()
          ..$slots.$ = Container(
            child: const Center(
                child: Text("MAIN",
                    style: TextStyle(
                        height: 180 / 14,
                        textBaseline: TextBaseline.ideographic))),
            decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade500),
          ),
        WFooter()..$slots.$ = footer,
      ],
  ),
  r'''
    SizedBox(
      height: 300,
      child: WContainer()
        ..$slots.$ = [
          WHeader()..$slots.$ = 'Header',
          WMain()..$slots.$ = _main,
          WFooter()..$slots.$ = 'Footer',
        ],
    )
  ''',
);

var containerBasic3 = Demo(
  'containerBasic3',
  SizedBox(
    height: 300,
    child: WContainer()
      ..$slots.$ = [
        WAside()
          ..$slots.$ = SingleChildScrollView(
            child: Container(
              child: const Center(
                  child: Text("Aside",
                      style: TextStyle(
                          height: 300 / 14,
                          textBaseline: TextBaseline.ideographic))),
              decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade600),
            ),
          ),
        WMain()
          ..$slots.$ = Container(
            child: const Center(
                child: Text("MAIN",
                    style: TextStyle(
                        height: 300 / 14,
                        textBaseline: TextBaseline.ideographic))),
            decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade500),
          ),
      ],
  ),
  r'''
    SizedBox(
      height: 300,
      child: WContainer()
        ..$slots.$ = [
          WAside()..$slots.$ = SingleChildScrollView(
            child: Container(
              child:
                  const Center(child: Text("Aside", style: TextStyle(height: 300 / 14, textBaseline: TextBaseline.ideographic))),
              decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade600),
            ),
          ),
          WMain()..$slots.$ = _main,
        ],
    )
  ''',
);

var containerBasic4 = Demo(
  'containerBasic4',
  SizedBox(
    height: 300,
    child: WContainer()
      ..$slots.$ = [
        WHeader()..$slots.$ = header,
        WContainer()
          ..$slots.$ = [
            WAside()
              ..$slots.$ = SingleChildScrollView(
                child: Container(
                  child: const Center(
                      child: Text("Aside",
                          style: TextStyle(
                              height: 240 / 14,
                              textBaseline: TextBaseline.ideographic))),
                  decoration:
                      BoxDecoration(color: CfgGlobal.primaryColor.shade600),
                ),
              ),
            WMain()
              ..$slots.$ = Container(
                child: const Center(
                    child: Text("MAIN",
                        style: TextStyle(
                            height: 240 / 14,
                            textBaseline: TextBaseline.ideographic))),
                decoration:
                    BoxDecoration(color: CfgGlobal.primaryColor.shade500),
              ),
          ],
      ],
  ),
  r'''

    SizedBox(
      height: 300,
      child: WContainer()
        ..$slots.$ = [
          WHeader()..$slots.$ = 'Header',
          WContainer()
            ..$slots.$ = [
              WAside()
                ..$slots.$ = SingleChildScrollView(
  child: Container(
    child:
        const Center(child: Text("Aside", style: TextStyle(height: 300 / 14, textBaseline: TextBaseline.ideographic))),
    decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade600),
  ),
)
                ..style.width = 200,
              WMain()..$slots.$ = _main,
            ],
        ],
    )
  ''',
);

var containerBasic5 = Demo(
  'containerBasic5',
  SizedBox(
    height: 300,
    child: WContainer()
      ..$slots.$ = [
        WHeader()..$slots.$ = header,
        WContainer()
          ..$slots.$ = [
            WAside()
              ..$slots.$ = SingleChildScrollView(
                child: Container(
                  child: const Center(
                      child: Text("Aside",
                          style: TextStyle(
                              height: 240 / 14,
                              textBaseline: TextBaseline.ideographic))),
                  decoration:
                      BoxDecoration(color: CfgGlobal.primaryColor.shade600),
                ),
              ),
            WContainer()
              ..$slots.$ = [
                WMain()
                  ..$slots.$ = Container(
                    child: const Center(
                        child: Text("MAIN",
                            style: TextStyle(
                                height: 180 / 14,
                                textBaseline: TextBaseline.ideographic))),
                    decoration:
                        BoxDecoration(color: CfgGlobal.primaryColor.shade500),
                  ),
                WFooter()..$slots.$ = footer,
              ],
          ],
      ],
  ),
  r'''
SizedBox(
      height: 300,
      child: WContainer()
        ..$slots.$ = [
          WHeader()..$slots.$ = 'Header',
          WContainer()
            ..$slots.$ = [
              WAside()
                ..$slots.$ = aside
                ..style.width = 200,
              WContainer()
                ..$slots.$ = [
                  WMain()..$slots.$ = _main,
                  WFooter()..$slots.$ = 'Footer',
                ],
            ],
        ],
    )
  ''',
);

var containerBasic6 = Demo(
  'containerBasic6',
  SizedBox(
    height: 300,
    child: WContainer()
      ..$slots.$ = [
        WAside()
          ..$slots.$ = SingleChildScrollView(
            child: Container(
              child: const Center(
                  child: Text("Aside",
                      style: TextStyle(
                          height: 300 / 14,
                          textBaseline: TextBaseline.ideographic))),
              decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade600),
            ),
          ),
        WContainer()
          ..$slots.$ = [
            WHeader()..$slots.$ = header,
            WMain()
              ..$slots.$ = Container(
                child: const Center(
                    child: Text("MAIN",
                        style: TextStyle(
                            height: 240 / 14,
                            textBaseline: TextBaseline.ideographic))),
                decoration:
                    BoxDecoration(color: CfgGlobal.primaryColor.shade500),
              ),
          ],
      ],
  ),
  r'''
    SizedBox(
      height: 300,
      child: WContainer()
        ..$slots.$ = [
          WAside()
            ..$slots.$ = aside
            ..style.width = 200,
          WContainer()
            ..$slots.$ = [
              WHeader()..$slots.$ = 'Header',
              WMain()..$slots.$ = _main,
            ],
        ],
    )
  ''',
);

var containerBasic7 = Demo(
  'containerBasic7',
  SizedBox(
    height: 300,
    child: WContainer()
      ..$slots.$ = [
        WAside()
          ..$slots.$ = SingleChildScrollView(
            child: Container(
              child: const Center(
                  child: Text("Aside",
                      style: TextStyle(
                          height: 300 / 14,
                          textBaseline: TextBaseline.ideographic))),
              decoration: BoxDecoration(color: CfgGlobal.primaryColor.shade600),
            ),
          )
          ..style.width = 200,
        WContainer()
          ..$slots.$ = [
            WHeader()..$slots.$ = header,
            WMain()
              ..$slots.$ = Container(
                child: const Center(
                    child: Text("MAIN",
                        style: TextStyle(
                            height: 180 / 14,
                            textBaseline: TextBaseline.ideographic))),
                decoration:
                    BoxDecoration(color: CfgGlobal.primaryColor.shade500),
              ),
            WFooter()..$slots.$ = footer,
          ],
      ],
  ),
  r'''
    SizedBox(
      height: 300,
      child: WContainer()
        ..$slots.$ = [
          WAside()
            ..$slots.$ = aside
            ..style.width = 200,
          WContainer()
            ..$slots.$ = [
              WHeader()..$slots.$ = 'Header',
              WMain()..$slots.$ = _main,
              WFooter()..$slots.$ = 'Footer',
            ],
        ],
    )
  ''',
);
