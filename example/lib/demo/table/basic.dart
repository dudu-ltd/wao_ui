import 'package:wao_ui/wao_ui.dart';

var tableBasicInner = WTable()
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
  ];
