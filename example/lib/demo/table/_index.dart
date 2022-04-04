import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';
import 'basic.dart';

regist() {
  var tableBasic = Demo(
    'tableBasic',
    WTable()
      ..$slots.$ = [
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
      ]
      ..$props.data = <Map<dynamic, dynamic>>[
        {'date': '2016-05-03', 'name': '王小虎1', 'address': '上海市普陀区金沙江路 1516 弄'},
        {'date': '2016-05-01', 'name': '王小虎2', 'address': '上海市普陀区金沙江路 1519 弄'},
        {'date': '2016-05-02', 'name': '王小虎3', 'address': '上海市普陀区金沙江路 1518 弄'},
        {'date': '2016-05-04', 'name': '王小虎4', 'address': '上海市普陀区金沙江路 1517 弄'},
      ],
    r'''
    WTable()
      ..$slots.$ = [
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
      ]
      ..$props.data = <Map<dynamic, dynamic>>[
        {'date': '2016-05-03', 'name': '王小虎1', 'address': '上海市普陀区金沙江路 1516 弄'},
        {'date': '2016-05-01', 'name': '王小虎2', 'address': '上海市普陀区金沙江路 1519 弄'},
        {'date': '2016-05-02', 'name': '王小虎3', 'address': '上海市普陀区金沙江路 1518 弄'},
        {'date': '2016-05-04', 'name': '王小虎4', 'address': '上海市普陀区金沙江路 1517 弄'},
      ]
    ''',
  );

  var tableStripe = Demo(
    'tableStripe',
    WTable()
      ..$slots.$ = [
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
      ]
      // 关键代码在这
      ..$props.stripe = true
      ..$props.data = <Map<dynamic, dynamic>>[
        {'date': '2016-05-03', 'name': '王小虎1', 'address': '上海市普陀区金沙江路 1516 弄'},
        {'date': '2016-05-01', 'name': '王小虎2', 'address': '上海市普陀区金沙江路 1519 弄'},
        {'date': '2016-05-02', 'name': '王小虎3', 'address': '上海市普陀区金沙江路 1518 弄'},
        {'date': '2016-05-04', 'name': '王小虎4', 'address': '上海市普陀区金沙江路 1517 弄'},
      ],
    r'''
    WTable()
      ..$slots.$ = [
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
      ]
      // 关键代码在这
      ..$props.stripe = true
      ..$props.data = <Map<dynamic, dynamic>>[
        {'date': '2016-05-03', 'name': '王小虎1', 'address': '上海市普陀区金沙江路 1516 弄'},
        {'date': '2016-05-01', 'name': '王小虎2', 'address': '上海市普陀区金沙江路 1519 弄'},
        {'date': '2016-05-02', 'name': '王小虎3', 'address': '上海市普陀区金沙江路 1518 弄'},
        {'date': '2016-05-04', 'name': '王小虎4', 'address': '上海市普陀区金沙江路 1517 弄'},
      ],
    ''',
  );

  var tableBorder = Demo(
    'tableBorder',
    WTable()
      ..$slots.$ = [
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
      ]
      // 关键代码在这
      ..$props.border = true
      ..$props.data = <Map<dynamic, dynamic>>[
        {'date': '2016-05-03', 'name': '王小虎1', 'address': '上海市普陀区金沙江路 1516 弄'},
        {'date': '2016-05-01', 'name': '王小虎2', 'address': '上海市普陀区金沙江路 1519 弄'},
        {'date': '2016-05-02', 'name': '王小虎3', 'address': '上海市普陀区金沙江路 1518 弄'},
        {'date': '2016-05-04', 'name': '王小虎4', 'address': '上海市普陀区金沙江路 1517 弄'},
      ],
    r'''
    WTable()
      ..$slots.$ = [
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
      ]
      // 关键代码在这
      ..$props.border = true
      ..$props.data = <Map<dynamic, dynamic>>[
        {'date': '2016-05-03', 'name': '王小虎1', 'address': '上海市普陀区金沙江路 1516 弄'},
        {'date': '2016-05-01', 'name': '王小虎2', 'address': '上海市普陀区金沙江路 1519 弄'},
        {'date': '2016-05-02', 'name': '王小虎3', 'address': '上海市普陀区金沙江路 1518 弄'},
        {'date': '2016-05-04', 'name': '王小虎4', 'address': '上海市普陀区金沙江路 1517 弄'},
      ],
    ''',
  );

  var tableFixHeight = Demo(
    'tableFixHeight',
    WTable()
      ..$slots.$ = [
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
      ]
      // 关键代码在这
      ..$props.height = 80
      ..$props.border = true
      ..$props.data = <Map<dynamic, dynamic>>[
        {'date': '2016-05-03', 'name': '王小虎1', 'address': '上海市普陀区金沙江路 1516 弄'},
        {'date': '2016-05-01', 'name': '王小虎2', 'address': '上海市普陀区金沙江路 1519 弄'},
        {'date': '2016-05-02', 'name': '王小虎3', 'address': '上海市普陀区金沙江路 1518 弄'},
        {'date': '2016-05-04', 'name': '王小虎4', 'address': '上海市普陀区金沙江路 1517 弄'},
      ],
    r'''
    WTable()
      ..$slots.$ = [
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
      ]
      // 关键代码在这
      ..$props.height = 80
      ..$props.border = true
      ..$props.data = <Map<dynamic, dynamic>>[
        {'date': '2016-05-03', 'name': '王小虎1', 'address': '上海市普陀区金沙江路 1516 弄'},
        {'date': '2016-05-01', 'name': '王小虎2', 'address': '上海市普陀区金沙江路 1519 弄'},
        {'date': '2016-05-02', 'name': '王小虎3', 'address': '上海市普陀区金沙江路 1518 弄'},
        {'date': '2016-05-04', 'name': '王小虎4', 'address': '上海市普陀区金沙江路 1517 弄'},
      ],
    ''',
  );

  var tableFixColumn = Demo(
    'tableFixColumn',
    WTable()
      ..$slots.$ = [
        WTableColumnProp(
          fixed: true,
          prop: (row) => row['date'],
          label: '日期',
          width: '150',
        ),
        WTableColumnProp(
          prop: (row) => row['name'],
          label: '姓名',
          width: '80',
        ),
        WTableColumnProp(
          prop: (row) => row['province'],
          label: '省份',
          width: '80',
        ),
        WTableColumnProp(
          prop: (row) => row['address'],
          label: '地址',
          width: '300',
        ),
        WTableColumnProp(
          prop: (row) => row['zip'],
          label: '邮编',
          width: '100',
        ),
        WTableColumn()
          ..$props.fixed = 'right'
          ..$props.label = '操作'
          ..$slots.$ = (dynamic row) {
            return Row(
              children: [
                WButton()
                  ..$on.click = (() => print('查看$row'))
                  ..$props.type = 'text'
                  ..$slots.$ = '查看',
                WButton()
                  ..$on.click = (() => print('编辑$row'))
                  ..$props.type = 'text'
                  ..$slots.$ = '编辑',
              ],
            );
          },
      ]
      ..$props.data = [
        {
          'date': '2016-05-02',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1518 弄',
          'zip': 200333
        },
        {
          'date': '2016-05-04',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1517 弄',
          'zip': 200333
        },
        {
          'date': '2016-05-01',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1519 弄',
          'zip': 200333
        },
        {
          'date': '2016-05-03',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1516 弄',
          'zip': 200333
        }
      ],
    r'''   
    WTable()
      ..$slots.$ = [
        WTableColumnProp(
          fixed: true,
          prop: (row) => row['date'],
          label: '日期',
          width: '150',
        ),
        WTableColumnProp(
          prop: (row) => row['name'],
          label: '姓名',
          width: '80',
        ),
        WTableColumnProp(
          prop: (row) => row['province'],
          label: '省份',
          width: '80',
        ),
        WTableColumnProp(
          prop: (row) => row['address'],
          label: '地址',
          width: '300',
        ),
        WTableColumnProp(
          prop: (row) => row['zip'],
          label: '邮编',
          width: '100',
        ),
        WTableColumn()
          ..$props.fixed = 'right'
          ..$props.label = '操作'
          ..$slots.$ = (dynamic row) {
            return Row(
              children: [
                WButton()
                  ..$on.click = (() => print('查看$row'))
                  ..$props.type = 'text'
                  ..$slots.$ = '查看',
                WButton()
                  ..$on.click = (() => print('编辑$row'))
                  ..$props.type = 'text'
                  ..$slots.$ = '编辑',
              ],
            );
          },
      ]
      ..$props.data = [
        {
          'date': '2016-05-02',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1518 弄',
          'zip': 200333
        },
        {
          'date': '2016-05-04',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1517 弄',
          'zip': 200333
        },
        {
          'date': '2016-05-01',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1519 弄',
          'zip': 200333
        },
        {
          'date': '2016-05-03',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1516 弄',
          'zip': 200333
        }
      ]
    ''',
  );

  var maxHeightTable = Demo(
    'maxHeightTable',
    WTable()
      ..$slots.$ = [
        WTableColumnProp(
          fixed: true,
          prop: (row) => row['date'],
          label: '日期',
          width: '150',
        ),
        WTableColumnProp(
          prop: (row) => row['name'],
          label: '姓名',
          width: '80',
        ),
        WTableColumnProp(
          prop: (row) => row['province'],
          label: '省份',
          width: '80',
        ),
        WTableColumnProp(
          prop: (row) => row['address'],
          label: '地址',
          width: '300',
        ),
        WTableColumnProp(
          prop: (row) => row['zip'],
          label: '邮编',
          width: '100',
        ),
        WTableColumn()
          ..$props.fixed = 'right'
          ..$props.label = '操作'
          ..$slots.$ = (dynamic row) {
            return Row(
              children: [
                WButton()
                  ..$on.click = (() => print('查看$row'))
                  ..$props.type = 'text'
                  ..$slots.$ = '查看',
                WButton()
                  ..$on.click = (() => print('编辑$row'))
                  ..$props.type = 'text'
                  ..$slots.$ = '编辑',
              ],
            );
          },
      ]
      // 关键代码在这
      ..$props.maxHeight = 100
      ..$props.data = [
        {
          'date': '2016-05-02',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1518 弄',
          'zip': 200333
        },
        {
          'date': '2016-05-04',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1517 弄',
          'zip': 200333
        },
        {
          'date': '2016-05-01',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1519 弄',
          'zip': 200333
        },
        {
          'date': '2016-05-03',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1516 弄',
          'zip': 200333
        }
      ],
    r'''
    WTable()
      ..$slots.$ = [
        WTableColumnProp(
          fixed: true,
          prop: (row) => row['date'],
          label: '日期',
          width: '150',
        ),
        WTableColumnProp(
          prop: (row) => row['name'],
          label: '姓名',
          width: '80',
        ),
        WTableColumnProp(
          prop: (row) => row['province'],
          label: '省份',
          width: '80',
        ),
        WTableColumnProp(
          prop: (row) => row['address'],
          label: '地址',
          width: '300',
        ),
        WTableColumnProp(
          prop: (row) => row['zip'],
          label: '邮编',
          width: '100',
        ),
        WTableColumn()
          ..$props.fixed = 'right'
          ..$props.label = '操作'
          ..$slots.$ = (dynamic row) {
            return Row(
              children: [
                WButton()
                  ..$on.click = (() => print('查看$row'))
                  ..$props.type = 'text'
                  ..$slots.$ = '查看',
                WButton()
                  ..$on.click = (() => print('编辑$row'))
                  ..$props.type = 'text'
                  ..$slots.$ = '编辑',
              ],
            );
          },
      ]
      // 关键代码在这
      ..$props.maxHeight = 100
      ..$props.data = [
        {
          'date': '2016-05-02',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1518 弄',
          'zip': 200333
        },
        {
          'date': '2016-05-04',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1517 弄',
          'zip': 200333
        },
        {
          'date': '2016-05-01',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1519 弄',
          'zip': 200333
        },
        {
          'date': '2016-05-03',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1516 弄',
          'zip': 200333
        }
      ]
    ''',
  );

  var tableMultiHeader = Demo(
    'tableMultiHeader',
    WTable(
      slots: WTableSlot([
        WTableColumnProp()
          ..fixed = true
          ..prop = ((row) => row['date'])
          ..label = '日期'
          ..width = '150',
        WTableColumn(
          props: WTableColumnProp(label: '配送信息'),
          slots: WTableColumnSlot([
            WTableColumnProp(
              prop: (row) => row['name'],
              label: '姓名',
              width: '120',
            ),
            WTableColumn(
              props: WTableColumnProp(label: '地址'),
              slots: WTableColumnSlot(
                [
                  WTableColumnProp(
                    prop: (row) => row['province'],
                    label: '省份',
                    width: '120',
                  ),
                  WTableColumnProp(
                    prop: (row) => row['city'],
                    label: '市区',
                    width: '120',
                  ),
                  WTableColumnProp(
                    prop: (row) => row['address'],
                    label: '地址',
                    width: '300',
                  ),
                  WTableColumnProp(
                    prop: (row) => row['zip'],
                    label: '邮编',
                    width: '120',
                  ),
                ],
              ),
            )
          ]),
        ),
        // TODO FIXME 修复多级后再追加列无法渲染的问题
        // WTableColumn(
        //   props: WTableColumnProp(label: '配送状态', width: '180'),
        //   slots: WTableColumnSlot((row) {
        //     return WButton(
        //       props: WButtonProp(type: 'primary', round: true),
        //       on: WButtonOn(click: () {
        //         print(row);
        //       }),
        //       slots: WButtonSlot('送达'),
        //     );
        //   }),
        // ),
      ]),
      props: WTableProp(data: [
        {
          'date': '2016-05-02',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1518 弄',
          'zip': 200333
        },
        {
          'date': '2016-05-04',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1517 弄',
          'zip': 200333
        },
        {
          'date': '2016-05-01',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1519 弄',
          'zip': 200333
        },
        {
          'date': '2016-05-03',
          'name': '王小虎',
          'province': '上海',
          'city': '普陀区',
          'address': '上海市普陀区金沙江路 1516 弄',
          'zip': 200333
        }
      ], border: true),
    ),
    r'''
  WTable(
      slots: WTableSlot([
        WTableColumnProp(
          fixed: true,
          prop: (row) => row['date'],
          label: '日期',
          width: '150',
        ),
        WTableColumn(
          props: WTableColumnProp(label: '配送信息'),
          slots: WTableColumnSlot([
            WTableColumnProp(
              prop: (row) => row['name'],
              label: '姓名',
              width: '120',
            ),
            WTableColumn(
              props: WTableColumnProp(label: '地址'),
              slots: WTableColumnSlot(
                [
                  WTableColumnProp(
                    prop: (row) => row['province'],
                    label: '省份',
                    width: '120',
                  ),
                  WTableColumnProp(
                    prop: (row) => row['city'],
                    label: '市区',
                    width: '120',
                  ),
                  WTableColumnProp(
                    prop: (row) => row['address'],
                    label: '地址',
                    width: '300',
                  ),
                  WTableColumnProp(
                    prop: (row) => row['zip'],
                    label: '邮编',
                    width: '120',
                  ),
                ],
              ),
            )
          ]),
        ),
        // TODO FIXME 修复多级后再追加列无法渲染的问题
        // WTableColumn(
        //   props: WTableColumnProp(label: '配送状态', width: '180'),
        //   slots: WTableColumnSlot((row) {
        //     return WButton(
        //       props: WButtonProp(type: 'primary', round: true),
        //       on: WButtonOn(click: () {
        //         print(row);
        //       }),
        //       slots: WButtonSlot('送达'),
        //     );
        //   }),
        // ),
      ]),
      props: WTableProp(data: testData2, border: true),
    )
    ''',
  );
}
