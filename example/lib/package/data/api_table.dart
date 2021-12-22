import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/src/data/w_descriptions.dart';
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

  var testData3 = [
    {
      "id": "12987122",
      "name": "好滋好味鸡蛋仔",
      "category": "江浙小吃、小吃零食",
      "desc": "荷兰优质淡奶，奶香浓而不腻",
      "address": "上海市普陀区真北路",
      "shop": "王小虎夫妻店",
      "shopId": "10333"
    },
    {
      "id": "12987123",
      "name": "好滋好味鸡蛋仔",
      "category": "江浙小吃、小吃零食",
      "desc": "荷兰优质淡奶，奶香浓而不腻",
      "address": "上海市普陀区真北路",
      "shop": "王小虎夫妻店",
      "shopId": "10333"
    },
    {
      "id": "12987125",
      "name": "好滋好味鸡蛋仔",
      "category": "江浙小吃、小吃零食",
      "desc": "荷兰优质淡奶，奶香浓而不腻",
      "address": "上海市普陀区真北路",
      "shop": "王小虎夫妻店",
      "shopId": "10333"
    },
    {
      "id": "12987126",
      "name": "好滋好味鸡蛋仔",
      "category": "江浙小吃、小吃零食",
      "desc": "荷兰优质淡奶，奶香浓而不腻",
      "address": "上海市普陀区真北路",
      "shop": "王小虎夫妻店",
      "shopId": "10333"
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
    baseTable = WTable(slots: WTableSlot(testColumns), props: prop);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const Text('WTable'),
      const Text('基础表格'),
      marginWrapper(baseTable, const EdgeInsets.all(8.0)),
      const Text('带斑马纹表格'),
      marginWrapper(stripeTable, const EdgeInsets.all(8.0)),
      const Text('带边框表格'),
      marginWrapper(borderTable, const EdgeInsets.all(8.0)),
      const Text('带状态表格'),
      marginWrapper(statusTable, const EdgeInsets.all(8.0)),
      const Text('固定表头'),
      marginWrapper(fixHeightTable, const EdgeInsets.all(8.0)),
      const Text('固定列'),
      marginWrapper(fixColumnTable, const EdgeInsets.all(8.0)),
      const Text('固定列和表头'),
      marginWrapper(fixColumnAndHeightTable, const EdgeInsets.all(8.0)),
      const Text('流体高度'),
      marginWrapper(maxHeightTable, const EdgeInsets.all(8.0)),
      const Text('多级表头'),
      marginWrapper(multiHeaderTable, const EdgeInsets.all(8.0)),
      const Text('单选'),
      marginWrapper(highlightCurrentRowTable, const EdgeInsets.all(8.0)),
      const Text('多选'),
      marginWrapper(selectionTable, const EdgeInsets.all(8.0)),
      const Text('排序'),
      marginWrapper(sortableTable, const EdgeInsets.all(8.0)),
      const Text('筛选'),
      marginWrapper(filtersTable, const EdgeInsets.all(8.0)),
      const Text('自定义列模板'),
      marginWrapper(columnSlotTable, const EdgeInsets.all(8.0)),
      const Text('展开行'),
      marginWrapper(expandTable, const EdgeInsets.all(8.0)),
      const Text('树形数据与懒加载'),
      marginWrapper(treeTable, const EdgeInsets.all(8.0)),
      marginWrapper(lazyTreeTable, const EdgeInsets.all(8.0)),
      const Text('自定义表头'),
      marginWrapper(headerSlotTable, const EdgeInsets.all(8.0)),
      const Text('表尾合计行'),
      marginWrapper(showSummaryTable1, const EdgeInsets.all(8.0)),
      marginWrapper(showSummaryTable2, const EdgeInsets.all(8.0)),
      const Text('合并行或列'),
      marginWrapper(spanMethodTable1, const EdgeInsets.all(8.0)),
      marginWrapper(spanMethodTable2, const EdgeInsets.all(8.0)),
      const Text('自定义索引'),
      marginWrapper(cutomIndexTable, const EdgeInsets.all(8.0)),
      marginWrapper(button, const EdgeInsets.all(8.0)),
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
      slots: WTableSlot(testColumns),
      props: WTableProp(stripe: true, data: testData),
    );
  }

  Widget get borderTable {
    return WTable(
      slots: WTableSlot(testColumns),
      props: WTableProp(border: true, data: testData),
    );
  }

  Widget get statusTable {
    return WTable(
      slots: WTableSlot(testColumns),
      props: WTableProp(border: true, data: testData),
    );
  }

  Widget get fixHeightTable {
    return WTable(
      slots: WTableSlot(testColumns),
      props: WTableProp(height: 80, border: true, data: testData),
    );
  }

  Widget get fixColumnTable {
    return WTable(
      slots: WTableSlot(testColumns2),
      props: WTableProp(border: true, data: testData2),
    );
  }

  Widget get fixColumnAndHeightTable {
    return WTable(
      slots: WTableSlot(testColumns2),
      props: WTableProp(height: 250, border: true, data: testData2),
    );
  }

  Widget get maxHeightTable {
    return WTable(
      slots: WTableSlot(testColumns2),
      props: WTableProp(maxHeight: 100, data: testData2),
    );
  }

  Widget get multiHeaderTable {
    return WTable(
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
      ]),
      props: WTableProp(data: testData2),
    );
  }

  Widget get highlightCurrentRowTable {
    return WTable(
      slots: WTableSlot(testColumns2),
      props: WTableProp(
        maxHeight: 250,
        data: testData2,
        highlightCurrentRow: true,
      ),
    );
  }

  Widget get selectionTable {
    return WTable(
      props: WTableProp(
        tooltipEffect: 'dart',
        data: testData2,
      ),
      on: WTableOn(selectionChange: (selection) {
        print(selection);
      }),
      slots: WTableSlot(
        [
          WTableColumnProp(
            type: 'selection',
            width: '55',
          ),
          ...testColumns2
        ],
      ),
    );
  }

  Widget get sortableTable {
    return WTable(
      props: WTableProp(
        defaultSort: {'prop': (row) => row['date'], 'order': 'descending'},
        data: testData2,
      ),
    );
  }

  Widget get filtersTable {
    return WTable(
      props: WTableProp(data: testData2),
      slots: WTableSlot([
        WTableColumnProp(
          prop: (row) => row['date'],
          label: '日期',
          sortable: true,
          width: '180',
          columnKey: (row) => row['date'],
          filters: [
            {'text': '2016-05-01', 'value': '2016-05-01'}
          ],
          filterMethod: (value, row, column) {
            // TODO 重新确认 filterMethod 的调用方式
            // var property = column.$props.prop;
            // return row[property] == value;
          },
        ),
        ...testColumns2.sublist(1)
      ]),
    );
  }

  Widget get columnSlotTable {
    return WTable(
      props: WTableProp(data: testData2),
      slots: WTableSlot(
        [
          WTableColumn(
            props: WTableColumnProp(label: '日期', width: '180'),
            slots: WTableColumnSlot(
              (value) {
                return Row(
                  children: [
                    Icon(Icons.lock_clock_rounded),
                    Text(value['date']),
                  ],
                );
              },
            ),
          ),
          WTableColumn(
            props: WTableColumnProp(label: '姓名', width: '180'),
            slots: WTableColumnSlot(
              (value) {
                return Row(
                  children: [
                    // TODO 当写完 popover 之后，回来补充
                    Text(value['name']),
                  ],
                );
              },
            ),
          ),
          testColumns2.last
        ],
      ),
    );
  }

  Widget get expandTable {
    return WTable(
      props: WTableProp(data: testData3),
      slots: WTableSlot(
        [
          WTableColumn(
            props: WTableColumnProp(type: 'expand'),
            slots: WTableColumnSlot(
              (row) {
                return SizedBox(
                  width: 300,
                  child: WDescriptions(
                    props: WDescriptionsProp(
                      fields: [
                        {'field': 'name', 'label': '商品名称'}
                      ],
                      column: 1,
                    ),
                    slots: WDescriptionsSlot(row),
                  ),
                );
              },
            ),
          ),
          WTableColumnProp(
            label: '商品ID',
            prop: (row) => row['id'],
          ),
          WTableColumnProp(
            label: '商品名称',
            prop: (row) => row['name'],
          ),
          WTableColumnProp(
            label: '商品描述',
            prop: (row) => row['desc'],
          ),
        ],
      ),
    );
  }

  var treeData = [
    {
      "id": 1,
      "date": "2016-05-02",
      "name": "王小虎",
      "address": "上海市普陀区金沙江路 1518 弄"
    },
    {
      "id": 2,
      "date": "2016-05-04",
      "name": "王小虎",
      "address": "上海市普陀区金沙江路 1517 弄"
    },
    {
      "id": 3,
      "date": "2016-05-01",
      "name": "王小虎",
      "address": "上海市普陀区金沙江路 1519 弄",
      "children": [
        {
          "id": 31,
          "date": "2016-05-01",
          "name": "王小虎",
          "address": "上海市普陀区金沙江路 1519 弄"
        },
        {
          "id": 32,
          "date": "2016-05-01",
          "name": "王小虎",
          "address": "上海市普陀区金沙江路 1519 弄"
        }
      ]
    },
    {
      "id": 4,
      "date": "2016-05-03",
      "name": "王小虎",
      "address": "上海市普陀区金沙江路 1516 弄"
    }
  ];
  Widget get treeTable {
    return WTable(
      props: WTableProp(
        data: treeData,
        rowKey: (row) => row['id'],
        border: true,
        defaultExpandAll: true,
        treeProps: {
          'children': (row) => row['children'],
          'hasChildren': (row) => row['hasChildren']
        },
      ),
      slots: WTableSlot(
        [
          WTableColumnProp(
            prop: (row) => row['date'],
            label: '日期',
            sortable: true,
            width: '180',
          ),
          WTableColumnProp(
            prop: (row) => row['name'],
            label: '姓名',
            sortable: true,
            width: '180',
          ),
          WTableColumnProp(
            prop: (row) => row['address'],
            label: '地址',
          ),
        ],
      ),
    );
  }

  var lacyTreeData = [
    {
      "id": 1,
      "date": "2016-05-02",
      "name": "王小虎",
      "address": "上海市普陀区金沙江路 1518 弄"
    },
    {
      "id": 2,
      "date": "2016-05-04",
      "name": "王小虎",
      "address": "上海市普陀区金沙江路 1517 弄"
    },
    {
      "id": 3,
      "date": "2016-05-01",
      "name": "王小虎",
      "address": "上海市普陀区金沙江路 1519 弄",
      "hasChildren": true
    },
    {
      "id": 4,
      "date": "2016-05-03",
      "name": "王小虎",
      "address": "上海市普陀区金沙江路 1516 弄"
    }
  ];

  Widget get lazyTreeTable {
    return WTable(
      props: WTableProp(
        data: lacyTreeData,
        rowKey: (row) => row['id'],
        border: true,
        lazy: true,
        load: (row, treeNode, resolve) => {},
        treeProps: {
          'children': (row) => row['children'],
          'hasChildren': (row) => row['hasChildren']
        },
      ),
      slots: WTableSlot([
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
      ]),
    );
  }

  Widget get headerSlotTable {
    var search;
    return WTable(
      props: WTableProp(
        data: () {
          var d = [];
          var filted = testData.where(
            (data) {
              return search == null ||
                  search.length == 0 ||
                  (data['name'].toLowerCase() as String)
                      .contains(search.toLowerCase() as String);
            },
          );
          d.addAll(filted);
          return d;
        }(),
      ),
      slots: WTableSlot(
        [
          WTableColumnProp(label: 'Date', prop: (row) => row['date']),
          WTableColumnProp(label: 'Name', prop: (row) => row['name']),
          WTableColumn(
            props: WTableColumnProp(align: 'right'),
            slots: WTableColumnSlot(testColumns2.last, header: (row) {
              return FormField(builder: (context) {
                return Text('');
              });
            }),
          )
        ],
      ),
    );
  }

  var summaryData = [
    {
      "id": "12987122",
      "name": "王小虎",
      "amount1": "234",
      "amount2": "3.2",
      "amount3": 10
    },
    {
      "id": "12987123",
      "name": "王小虎",
      "amount1": "165",
      "amount2": "4.43",
      "amount3": 12
    },
    {
      "id": "12987124",
      "name": "王小虎",
      "amount1": "324",
      "amount2": "1.9",
      "amount3": 9
    },
    {
      "id": "12987125",
      "name": "王小虎",
      "amount1": "621",
      "amount2": "2.2",
      "amount3": 17
    },
    {
      "id": "12987126",
      "name": "王小虎",
      "amount1": "539",
      "amount2": "4.1",
      "amount3": 15
    }
  ];

  Widget get showSummaryTable1 {
    return WTable(
      props: WTableProp(
        data: summaryData,
        border: true,
        showSummary: true,
      ),
      slots: WTableSlot([
        WTableColumnProp(prop: (row) => row['id'], label: 'ID', width: '180'),
        WTableColumnProp(prop: (row) => row['name'], label: '姓名', width: '180'),
        WTableColumnProp(
            prop: (row) => row['amount1'],
            sortable: true,
            label: '姓名',
            width: '180'),
        WTableColumnProp(
            prop: (row) => row['amount2'],
            sortable: true,
            label: '姓名',
            width: '180'),
        WTableColumnProp(
            prop: (row) => row['amount3'],
            sortable: true,
            label: '姓名',
            width: '180'),
      ]),
    );
  }

  Widget get showSummaryTable2 {
    return WTable(
      props: WTableProp(
        data: summaryData,
        border: true,
        height: 200,
        summaryMethod: (columns, data) {
          return 'TEST';
        },
        showSummary: true,
      ),
      slots: WTableSlot(
        [
          WTableColumnProp(prop: (row) => row['id'], label: 'ID', width: '180'),
          WTableColumnProp(
            prop: (row) => row['name'],
            label: '姓名',
            width: '180',
          ),
          WTableColumnProp(
            prop: (row) => row['amount1'],
            sortable: true,
            label: '数值 1',
            width: '180',
          ),
          WTableColumnProp(
            prop: (row) => row['amount2'],
            sortable: true,
            label: '数值 2',
            width: '180',
          ),
          WTableColumnProp(
            prop: (row) => row['amount3'],
            sortable: true,
            label: '数值 3',
            width: '180',
          ),
        ],
      ),
    );
  }

  Widget get spanMethodTable1 {
    return WTable(
      props: WTableProp(
        data: summaryData,
        spanMethod: (row, column, rowIndex, columnIndex) {
          if (rowIndex % 2 == 0) {
            if (columnIndex == 0) {
              return [1, 2];
            } else if (columnIndex == 1) {
              return [0, 0];
            }
          }
        },
      ),
      slots: WTableSlot(
        [
          WTableColumnProp(prop: (row) => row['id'], label: 'ID', width: '180'),
          WTableColumnProp(
            prop: (row) => row['name'],
            label: '姓名',
            width: '180',
          ),
          WTableColumnProp(
            prop: (row) => row['amount1'],
            sortable: true,
            label: '数值 1',
            width: '180',
          ),
          WTableColumnProp(
            prop: (row) => row['amount2'],
            sortable: true,
            label: '数值 2',
            width: '180',
          ),
          WTableColumnProp(
            prop: (row) => row['amount3'],
            sortable: true,
            label: '数值 3',
            width: '180',
          ),
        ],
      ),
    );
  }

  Widget get spanMethodTable2 {
    return WTable(
      props: WTableProp(
        data: summaryData,
        spanMethod: (row, column, rowIndex, columnIndex) {
          if (columnIndex == 0) {
            if (rowIndex % 2 == 0) {
              return {
                'rowspan': 2,
                'colspan': 1,
              };
            } else {
              return {
                'rowspan': 0,
                'colspan': 0,
              };
            }
          }
        },
      ),
      slots: WTableSlot(
        [
          WTableColumnProp(prop: (row) => row['id'], label: 'ID', width: '180'),
          WTableColumnProp(
            prop: (row) => row['name'],
            label: '姓名',
            width: '180',
          ),
          WTableColumnProp(
            prop: (row) => row['amount1'],
            sortable: true,
            label: '数值 1',
            width: '180',
          ),
          WTableColumnProp(
            prop: (row) => row['amount2'],
            sortable: true,
            label: '数值 2',
            width: '180',
          ),
          WTableColumnProp(
            prop: (row) => row['amount3'],
            sortable: true,
            label: '数值 3',
            width: '180',
          ),
        ],
      ),
    );
  }

  Widget get cutomIndexTable {
    return WTable(
      props: WTableProp(data: testData),
      slots: WTableSlot([
        WTableColumnProp(
          type: 'index',
          width: '60',
          index: (index) {
            return index * 2;
          },
        ),
        ...testColumns
      ]),
    );
  }
}
