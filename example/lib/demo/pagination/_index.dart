import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  paginationBasicFew;
  paginationBasicLot;
  paginationSimple;
  paginationButtons;
  paginationBacgroudColor;
  paginationSmall;
  paginationFull;
  paginationShowTotal;
  paginationChangeSize;
  paginationJumper;
}

var paginationBasicFew = Demo(
  'paginationBasicFew',
  WPagination()
    ..$props.layout = 'prev, pager, next'
    ..$props.total = 50,
  r'''
  WPagination()
    ..$props.layout = 'prev, pager, next'
    ..$props.total = 50,
  ''',
);

var paginationBasicLot = Demo(
  'paginationBasicLot',
  WPagination()
    ..$props.layout = 'prev, pager, next'
    ..$props.total = 500,
  r'''
  WPagination()
    ..$props.layout = 'prev, pager, next'
    ..$props.total = 500,
  ''',
);

var paginationSimple = Demo(
  'paginationSimple',
  WPagination()
    ..$props.layout = 'prev, simplePager, next'
    ..$props.total = 500,
  r'''
  WPagination()
    ..$props.layout = 'prev, pager, next'
    ..$props.total = 500
    ..$props.mode = 'simple',
  ''',
);

var paginationButtons = Demo(
  'paginationButtons',
  WPagination()
    ..$props.pageSize = 20
    // 关键属性在这
    ..$props.pagerCount = 11
    ..$props.layout = 'prev, pager, next'
    ..$props.total = 1000,
  r'''
  WPagination()
    ..$props.pageSize = 20
    // 关键属性在这
    ..$props.pagerCount = 11
    ..$props.layout = 'prev, pager, next'
    ..$props.total = 1000,
  ''',
);

var paginationBacgroudColor = Demo(
  'paginationBacgroudColor',
  WPagination()
    ..$props.background = true
    ..$props.layout = 'prev, pager, next'
    ..$props.total = 1000,
  r'''
  WPagination()
    ..$props.background = true
    ..$props.layout = 'prev, pager, next'
    ..$props.total = 1000,
  ''',
);

var paginationSmall = Demo(
  'paginationSmall',
  WPagination()
    ..$props.small = true
    ..$props.layout = 'prev, pager, next'
    ..$props.total = 50,
  r'''
  WPagination()
    ..$props.small = true
    ..$props.layout = 'prev, pager, next'
    ..$props.total = 50,
  ''',
);

var paginationShowTotal = Demo(
  'paginationShowTotal',
  WPagination()
    ..$props.currentPage = 6
    ..$props.pageSize = 100
    ..$props.layout = 'total, prev, pager, next'
    ..$props.total = 1000
    ..$on.sizeChange = ((e) => print(e))
    ..$on.currentChange = ((e) => print(e)),
  r'''
  WPagination()
    ..$props.currentPage = 6
    ..$props.pageSize = 100
    ..$props.layout = 'total, prev, pager, next'
    ..$props.total = 1000
    ..$on.sizeChange = ((e) => print(e))
    ..$on.currentChange = ((e) => print(e)),
  ''',
);

var paginationJumper = Demo(
  'paginationJumper',
  WPagination()
    ..$props.currentPage = 6
    ..$props.pageSizes = [100, 200, 300, 400]
    ..$props.pageSize = 100
    ..$props.layout = 'prev, pager, next, jumper'
    ..$props.total = 1000
    ..$on.sizeChange = ((e) => print(e))
    ..$on.currentChange = ((e) => print(e)),
  r'''
WPagination(
      on: WPaginationOn(
        sizeChange: (e) => print(e),
        currentChange: (e) => print(e),
      ),
      props: WPaginationProp(
        currentPage: 6,
        pageSizes: [100, 200, 300, 400],
        pageSize: 100,
        layout: 'prev, pager, next, jumper',
        total: 1000,
      ),
    )
  ''',
);

var paginationChangeSize = Demo(
  'paginationChangeSize',
  WPagination()
    ..$props.currentPage = 6
    ..$props.pageSizes = [100, 200, 300, 400]
    ..$props.pageSize = 100
    ..$props.layout = 'sizes, prev, pager, next'
    ..$props.total = 1000
    ..$on.sizeChange = ((e) => print(e))
    ..$on.currentChange = ((e) => print(e)),
  r'''
  WPagination()
    ..$props.currentPage = 6
    ..$props.pageSizes = [100, 200, 300, 400]
    ..$props.pageSize = 100
    ..$props.layout = 'sizes, prev, pager, next'
    ..$props.total = 1000
    ..$on.sizeChange = ((e) => print(e))
    ..$on.currentChange = ((e) => print(e)),
  ''',
);

var paginationFull = Demo(
  'paginationFull',
  WPagination()
    ..$props.currentPage = 6
    ..$props.pageSizes = [100, 200, 300, 400]
    ..$props.pageSize = 100
    ..$props.layout = 'total, sizes, prev, pager, next, jumper'
    ..$props.total = 400
    ..$on.sizeChange = ((e) => print(e))
    ..$on.currentChange = ((e) => print(e)),
  r'''
  WPagination()
    ..$props.currentPage = 6
    ..$props.pageSizes = [100, 200, 300, 400]
    ..$props.pageSize = 100
    ..$props.layout = 'total, sizes, prev, pager, next, jumper'
    ..$props.total = 400
    ..$on.sizeChange = ((e) => print(e))
    ..$on.currentChange = ((e) => print(e)),
  ''',
);
