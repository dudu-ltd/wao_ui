import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  var progressLine = Demo(
    'progressLine',
    WProgress()..$props.percentage = 50,
    r'''
    WProgress()..$props.percentage = 50''',
  );

  var progressLineFormat = Demo(
    'progressLineFormat',
    WProgress()
      ..$props.percentage = 100
      ..$props.format = (p) => p == 100 ? '满' : '$p%',
    r'''
    WProgress()
      ..$props.percentage = 100
      ..$props.format = (p) => p == 100 ? '满' : '$p%'
    ''',
  );

  var progressLineStatus1 = Demo(
    'progressLineStatus1',
    WProgress()
      ..$props.percentage = 100
      ..$props.status = 'success',
    r'''
    WProgress()
      ..$props.percentage = 100
      ..$props.status = 'success'
    ''',
  );
  var progressLineStatus2 = Demo(
    'progressLineStatus2',
    WProgress()
      ..$props.percentage = 100
      ..$props.status = 'warning',
    r'''
    WProgress()
      ..$props.percentage = 100
      ..$props.status = 'warning'
    ''',
  );
  var progressLineStatus3 = Demo(
    'progressLineStatus3',
    WProgress()
      ..$props.percentage = 50
      ..$props.status = 'exception',
    r'''
    WProgress()
      ..$props.percentage = 50
      ..$props.status = 'exception'
    ''',
  );

  var progressLineInner = Demo(
    'progressLineInner',
    WProgress()
      ..$props.textInside = true
      ..$props.strokeWidth = 26.0
      ..$props.percentage = 70,
    r'''
    WProgress()
      ..$props.textInside = true
      ..$props.strokeWidth = 26.0
      ..$props.percentage = 70
    ''',
  );
  var progressLineInnerStatus1 = Demo(
    'progressLineInnerStatus1',
    WProgress()
      ..$props.textInside = true
      ..$props.strokeWidth = 24.0
      ..$props.percentage = 100
      ..$props.status = 'success',
    r'''
    WProgress()
      ..$props.textInside = true
      ..$props.strokeWidth = 24.0
      ..$props.percentage = 100
      ..$props.status = 'success',
    ''',
  );
  var progressLineInnerStatus2 = Demo(
    'progressLineInnerStatus2',
    WProgress()
      ..$props.textInside = true
      ..$props.strokeWidth = 22.0
      ..$props.percentage = 80
      ..$props.status = 'warning',
    r'''
    WProgress()
      ..$props.textInside = true
      ..$props.strokeWidth = 22.0
      ..$props.percentage = 80
      ..$props.status = 'warning',
    ''',
  );
  var progressLineInnerStatus3 = Demo(
    'progressLineInnerStatus3',
    WProgress()
      ..$props.textInside = true
      ..$props.strokeWidth = 20.0
      ..$props.percentage = 50
      ..$props.status = 'exception',
    r'''
    WProgress()
      ..$props.textInside = true
      ..$props.strokeWidth = 20.0
      ..$props.percentage = 50
      ..$props.status = 'exception',
    ''',
  );

  var progressColor1 = Demo(
    'progressColor1',
    WProgress()
      ..$props.color = Colors.red
      ..$props.percentage = 20,
    r'''
    WProgress()
      ..$props.color = Colors.red
      ..$props.percentage = 20,
    ''',
  );

  var progressColor2 = Demo(
    'progressColor2',
    WProgress()
      ..$props.color = [
        {'color': const Color(0xf56c6cFF), 'percentage': 20},
        {'color': const Color(0xe6a23cFF), 'percentage': 40},
        {'color': const Color(0x5cb87aFF), 'percentage': 60},
        {'color': const Color(0x1989faFF), 'percentage': 80},
        {'color': const Color(0x6f7ad3FF), 'percentage': 100},
      ]
      ..$props.percentage = 20,
    r'''
    WProgress()
      ..$props.color = [
        {'color': const Color(0xf56c6cFF), 'percentage': 20},
        {'color': const Color(0xe6a23cFF), 'percentage': 40},
        {'color': const Color(0x5cb87aFF), 'percentage': 60},
        {'color': const Color(0x1989faFF), 'percentage': 80},
        {'color': const Color(0x6f7ad3FF), 'percentage': 100},
      ]
      ..$props.percentage = 20
    ''',
  );

  var progressColor3 = Demo(
    'progressColor3',
    WProgress()
      ..$props.color = (p) {
        return Color.fromRGBO(
          255,
          (p / 100 * 199).toInt(),
          (p / 100 * 156).toInt(),
          p / 100.0,
        );
      }
      ..$props.percentage = 20,
    r'''
    WProgress()
      ..$props.color = (p) {
        return Color.fromRGBO(
          255,
          (p / 100 * 199).toInt(),
          (p / 100 * 156).toInt(),
          p / 100.0,
        );
      }
      ..$props.percentage = 20
    ''',
  );

  var progressCircle1 = Demo(
    'progressCircle1',
    WProgress()
      ..$props.type = 'circle'
      ..$props.percentage = 0,
    r'''
    WProgress()
      ..$props.type = 'circle'
      ..$props.percentage = 0
    ''',
  );
  var progressCircle2 = Demo(
    'progressCircle2',
    WProgress()
      ..$props.type = 'circle'
      ..$props.percentage = 75,
    r'''
    WProgress()
      ..$props.type = 'circle'
      ..$props.percentage = 0
    ''',
  );
  var progressCircleStatus1 = Demo(
    'progressCircleStatus1',
    WProgress()
      ..$props.type = 'circle'
      ..$props.percentage = 100
      ..$props.status = 'success',
    r'''
    WProgress()
      ..$props.type = 'circle'
      ..$props.percentage = 100
      ..$props.status = 'success'
    ''',
  );
  var progressCircleStatus2 = Demo(
    'progressCircleStatus2',
    WProgress()
      ..$props.type = 'circle'
      ..$props.percentage = 70
      ..$props.status = 'warning'
      ..$props.strokeLinecap = 'butt',
    r'''
    WProgress()
      ..$props.type = 'circle'
      ..$props.percentage = 70
      ..$props.status = 'success'
      ..$props.strokeLinecap = 'butt'
    ''',
  );
  var progressCircleStatus3 = Demo(
    'progressCircleStatus3',
    WProgress()
      ..$props.type = 'circle'
      ..$props.percentage = 50
      ..$props.status = 'exception'
      ..$props.strokeLinecap = 'square',
    r'''
    WProgress()
      ..$props.type = 'circle'
      ..$props.percentage = 50
      ..$props.status = 'exception'
      ..$props.strokeLinecap = 'square'
    ''',
  );

  var progressDashboard = Demo(
    'progressDashboard',
    WProgress()
      ..$props.type = 'dashboard'
      ..$props.percentage = 20
      ..$props.strokeWidth = 30.0
      ..$props.color = (p) {
        return const Color.fromARGB(0, 27, 46, 1);
      },
    r'''
    WProgress()
      ..$props.type = 'dashboard'
      ..$props.percentage = 20
      ..$props.strokeWidth = 30.0
      ..$props.color = (p) {
        return const Color.fromARGB(0, 27, 46, 1);
      }
    ''',
  );
}
