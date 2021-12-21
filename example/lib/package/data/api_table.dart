import 'package:flutter/material.dart';
import 'package:wao_ui/src/data/w_table.dart';
import 'package:wao_ui/src/basic/w_button.dart';

class ApiTable extends StatelessWidget {
  var testData = <Map<dynamic, dynamic>>[
    {'date': '2016-05-03', 'name': '王小虎', 'address': '上海市普陀区金沙江路 1516 弄'},
    {'date': '2016-05-01', 'name': '王小虎', 'address': '上海市普陀区金沙江路 1519 弄'},
    {'date': '2016-05-02', 'name': '王小虎', 'address': '上海市普陀区金沙江路 1518 弄'},
    {'date': '2016-05-04', 'name': '王小虎', 'address': '上海市普陀区金沙江路 1517 弄'},
  ];

  var testData2 = [
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
  ];

  var testColumns = [
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
  ];
  var testColumns2 = [
    WTableColumnProp(
      fixed: true,
      prop: (row) => row['date'],
      label: '日期',
      width: '150',
    ),
    WTableColumnProp(
      prop: (row) => row['name'],
      label: '姓名',
      width: '120',
    ),
    WTableColumnProp(
      prop: (row) => row['province'],
      label: '省份',
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
      width: '100',
    ),
    WTableColumn(
      props: WTableColumnProp(
        fixed: 'right',
        label: '操作',
      ),
      slots: WTableColumnSlot(
        (dynamic row) {
          return Row(
            children: [
              WButton(
                on: WButtonOn(click: () {
                  print('查看$row');
                }),
                props: WButtonProp(type: 'text'),
                slots: WButtonSlot('查看'),
              ),
              WButton(
                on: WButtonOn(click: () {
                  print('编辑$row');
                }),
                props: WButtonProp(type: 'text'),
                slots: WButtonSlot('编辑'),
              )
            ],
          );
        },
      ),
    ),
  ];

  ApiTable({Key? key}) : super(key: key) {
    var prop = WTableProp(data: testData);
    baseTable = WTable(testColumns, props: prop);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const Text('WTable'),
      baseTable,
      stripeTable,
      borderTable,
      fixHeightTable,
      fixColumnTable,
      button
    ]);
  }

  Widget get button {
    return WButton(
      slots: WButtonSlot('改变数据'),
      on: WButtonOn(
        click: () {},
      ),
    );
  }

  late WTable baseTable;

  Widget get stripeTable {
    return WTable(
      testColumns,
      props: WTableProp(stripe: true, data: testData),
    );
  }

  Widget get borderTable {
    return WTable(
      testColumns,
      props: WTableProp(border: true, data: testData),
    );
  }

  Widget get fixHeightTable {
    return WTable(
      testColumns,
      props: WTableProp(height: 250, border: true, data: testData),
    );
  }

  Widget get fixColumnTable {
    return WTable(
      testColumns2,
      props: WTableProp(height: 250, border: true, data: testData2),
    );
  }
}
