import 'package:flutter/material.dart';

import 'package:wao_ui/src/others/w_dialog.dart';
import 'package:wao_ui/wao_ui.dart';

class ApiDialog extends StatelessWidget {
  late WDialog baseDialog = WDialog(
    props: WDialogProp(btn: '无标题弹窗', top: '20vh'),
    slots: WDialogSlot(const Text('无标题弹窗')),
  );

  late WDialog titleDialog = WDialog(
    slots: WDialogSlot(Text('标题弹窗'),
        title: Row(
          children: const [
            Icon(Icons.flutter_dash),
            Text('我是标题'),
          ],
        )),
    props: WDialogProp(btn: '标题弹窗', top: '400px'),
  );

  late WDialog customBtnDialog = WDialog(
    slots: WDialogSlot(const Text('自定义按钮弹窗'), btn: const Icon(Icons.ac_unit)),
  );
  late WDialog nestedBtnDialog = WDialog(
    props: WDialogProp(title: "我是标题", appendToBody: true),
    slots: WDialogSlot(
      Text('自定义按钮弹窗'),
      btn: const Icon(Icons.edit_location_rounded),
      footer: [
        TextButton(
          child: const Text('取消'),
          onPressed: () {},
        ),
        titleDialog
      ],
    ),
  );

  ApiDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late WDialog customActionDialog;
    customActionDialog = WDialog(
      slots: WDialogSlot(
        const Text('自定义按钮弹窗'),
        btn: const Icon(Icons.ac_unit),
        footer: [
          TextButton(
            child: const Text('取消'),
            onPressed: () {},
          )
        ],
      ),
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('基本用法'),
          ____________________________________,
          basic,
          ____________________________________,
          const Text('自定义内容'),
          ____________________________________,
          custom,
          ____________________________________,
          const Text('嵌套的 Dialog'),
          ____________________________________,
          appendToBody,
          ____________________________________,
          const Text('居中布局'),
          ____________________________________,
          center,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          ____________________________________,
          baseDialog,
          titleDialog,
          customBtnDialog,
          customActionDialog,
          nestedBtnDialog
        ],
      ),
    );
  }

  final Widget ____________________________________ = const SizedBox(
    height: 10,
    width: 1,
  );
  Widget get basic {
    var self;
    return self = WDialog(
      props: WDialogProp(
        btn: '点击打开 Dialog',
        title: '提示',
        beforeClose: () {},
      ),
      slots: WDialogSlot(
        const Text('这是一段信息'),
        footer: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: WButton(
                  on: WButtonOn(click: () {
                    print('取消了');
                  }),
                  slots: WButtonSlot('取消'),
                ),
              ),
              Expanded(
                child: WButton(
                  props: WButtonProp(type: 'primary'),
                  on: WButtonOn(click: () {
                    print('确定了');
                  }),
                  slots: WButtonSlot('确定'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget get custom {
    var testData = <Map<dynamic, dynamic>>[
      {'date': '2016-05-03', 'name': '王小虎1', 'address': '上海市普陀区金沙江路 1516 弄'},
      {'date': '2016-05-01', 'name': '王小虎2', 'address': '上海市普陀区金沙江路 1519 弄'},
      {'date': '2016-05-02', 'name': '王小虎3', 'address': '上海市普陀区金沙江路 1518 弄'},
      {'date': '2016-05-04', 'name': '王小虎4', 'address': '上海市普陀区金沙江路 1517 弄'},
    ];
    var form = {
      'name': '',
      'region': '',
      'date1': '',
      'date2': '',
      'delivery': false,
      'type': [],
      'resource': '',
      'desc': ''
    };
    return Row(
      children: [
        WDialog(
          props: WDialogProp(
            btn: '打开嵌套表格的 Dialog',
            title: '提示',
            beforeClose: () {},
          ),
          slots: WDialogSlot(
            SizedBox(
              height: 300,
              child: WTable(
                slots: WTableSlot(
                  [
                    WTableColumnProp(
                      prop: (row) => row['date'],
                      label: '日期',
                      width: '180',
                    ),
                    WTableColumnProp(
                      prop: (row) => row['name'],
                      label: '姓名',
                      width: '180',
                    ),
                    WTableColumnProp(
                      prop: (row) => row['address'],
                      label: '地址',
                    ),
                  ],
                ),
                props: WTableProp(data: testData),
              ),
            ),
          ),
        ),
        WDialog(
          props: WDialogProp(
            btn: '打开嵌套表单的 Dialog',
            title: '提示',
            beforeClose: () {},
          ),
          // slots: WDialogSlot(WForm( // TODO 实现 WForm 时一并来写 demo
          //   slots: WFormSlot(WFormItem),
          // )),
        ),
      ],
    );
  }

  Widget get appendToBody {
    var self;
    return self = WDialog(
      props: WDialogProp(
        btn: '点击打开外层 Dialog',
        title: '外层 Dialog',
        beforeClose: () {},
      ),
      slots: WDialogSlot(
        const Text('这是一段信息'),
        footer: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: WButton(
                  on: WButtonOn(click: () {
                    print('取消了');
                  }),
                  slots: WButtonSlot('取消'),
                ),
              ),
              Expanded(
                child: WDialog(
                  props: WDialogProp(
                    btn: '点击打开 Dialog',
                    title: '内层 Dialog',
                    width: '30%',
                    appendToBody: true,
                    beforeClose: () {},
                  ),
                  slots: WDialogSlot(
                    const Text('这是一段信息'),
                    footer: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: WButton(
                              on: WButtonOn(click: () {
                                print('取消了');
                              }),
                              slots: WButtonSlot('取消'),
                            ),
                          ),
                          Expanded(
                            child: WButton(
                              props: WButtonProp(type: 'primary'),
                              on: WButtonOn(click: () {
                                print('确定了');
                              }),
                              slots: WButtonSlot('确定'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget get center {
    var self;
    return self = WDialog(
      props: WDialogProp(
        btn: '点击打开 Dialog',
        title: '提示',
        center: true,
        beforeClose: () {},
      ),
      slots: WDialogSlot(
        const Text('这是一段信息'),
        footer: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              WButton(
                on: WButtonOn(click: () {
                  print('取消了');
                }),
                slots: WButtonSlot('取消'),
              ),
              WButton(
                props: WButtonProp(type: 'primary'),
                on: WButtonOn(click: () {
                  print('确定了');
                }),
                slots: WButtonSlot('确定'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
