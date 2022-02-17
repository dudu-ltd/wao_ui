import 'package:flutter/material.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/src/others/w_calendar.dart';

class ApiCalendar extends StatelessWidget {
  const ApiCalendar({Key? key}) : super(key: key);

  Widget get basic {
    var value = DateTime.now();
    return WCalendar(
      props: WCalendarProp(value: value),
    );
  }

  Widget get custom {
    var value = DateTime.now();
    return WCalendar(
      props: WCalendarProp(value: value),
      slots: WCalendarSlot(
        null,
        dateCell: (time, data) {
          return Text(
            '${time.month}-${time.day} ${data.isSelected ? '' : ''}',
            style: TextStyle(
              color: data.isSelected ? ColorUtil.hexToColor('#1989FA') : null,
            ),
          );
        },
      ),
    );
  }

  Widget get range {
    var value = DateTime.now();
    return WCalendar(
      props: WCalendarProp(range: ['2019-03-04', '2019-03-24']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WCalendar'),
      const Text('基本用法'),
      basic,
      const Text('自定义内容'),
      custom,
      const Text('自定义范围'),
      range,
    ]);
  }
}
