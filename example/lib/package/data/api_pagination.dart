import 'package:flutter/material.dart';
import 'package:wao_ui/src/data/w_pagination.dart';

class ApiPagination extends StatelessWidget {
  const ApiPagination({Key? key}) : super(key: key);

  WPagination get few {
    return WPagination(
      props: WPaginationProp(
        layout: 'prev, pager, next',
        total: 50,
      ),
    );
  }

  WPagination get lot {
    return WPagination(
      props: WPaginationProp(
        layout: 'prev, pager, next',
        total: 1000,
      ),
    );
  }

  WPagination get lotPageCount {
    return WPagination(
      props: WPaginationProp(
        pageSize: 20,
        pagerCount: 11,
        layout: 'prev, pager, next',
        total: 1000,
      ),
    );
  }

  WPagination get background {
    return WPagination(
      props: WPaginationProp(
        background: true,
        layout: 'prev, pager, next',
        total: 1000,
      ),
    );
  }

  WPagination get small {
    return WPagination(
      props: WPaginationProp(
        small: true,
        layout: 'prev, pager, next',
        total: 50,
      ),
    );
  }

  WPagination get showTotal {
    return WPagination(
      on: WPaginationOn(
        sizeChange: (e) => print(e),
        currentChange: (e) => print(e),
      ),
      props: WPaginationProp(
        currentPage: 6,
        pageSize: 100,
        layout: 'total, prev, pager, next',
        total: 1000,
      ),
    );
  }

  WPagination get changeSize {
    return WPagination(
      on: WPaginationOn(
        sizeChange: (e) => print(e),
        currentChange: (e) => print(e),
      ),
      props: WPaginationProp(
        currentPage: 6,
        pageSizes: [100, 200, 300, 400],
        pageSize: 100,
        layout: 'sizes, prev, pager, next',
        total: 1000,
      ),
    );
  }

  WPagination get jumper {
    return WPagination(
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
    );
  }

  WPagination get full {
    return WPagination(
      on: WPaginationOn(
        sizeChange: (e) => print(e),
        currentChange: (e) => print(e),
      ),
      props: WPaginationProp(
        currentPage: 6,
        pageSizes: [100, 200, 300, 400],
        pageSize: 100,
        layout: 'total, sizes, prev, pager, next, jumper',
        total: 400,
      ),
    );
  }

  WPagination get hideOnSinglePage {
    return WPagination(
      on: WPaginationOn(
        sizeChange: (e) => print(e),
        currentChange: (e) => print(e),
      ),
      props: WPaginationProp(
        currentPage: 6,
        pageSize: 100,
        layout: 'prev, pager, next, jumper',
        total: 1000,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WPagination'),
      few,
      lot,
      lotPageCount,
      background,
      small,
      showTotal,
      changeSize,
      jumper,
      full,
      hideOnSinglePage,
    ]);
  }
}
