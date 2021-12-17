import 'package:flutter/material.dart';
import 'package:wao_ui/src/basic/w_button.dart';
import 'package:wao_ui/src/data/w_progress.dart';

class ApiProgress extends StatefulWidget {
  num percentage = 20;

  ApiProgress({Key? key}) : super(key: key);

  @override
  _ApiProgressState createState() => _ApiProgressState();

  Widget get line1 {
    return WProgress(props: WProgressProp(percentage: 50));
  }

  Widget get line2 {
    return WProgress(
      props: WProgressProp(
        percentage: 100,
        format: (p) => p == 100 ? '满' : '$p%',
      ),
    );
  }

  Widget get line3 {
    return WProgress(props: WProgressProp(percentage: 100, status: 'success'));
  }

  Widget get line4 {
    return WProgress(props: WProgressProp(percentage: 100, status: 'warning'));
  }

  Widget get line5 {
    return WProgress(props: WProgressProp(percentage: 50, status: 'exception'));
  }

  Widget get inner1 {
    return WProgress(
      props: WProgressProp(
        textInside: true,
        strokeWidth: 26,
        percentage: 70,
      ),
    );
  }

  Widget get inner2 {
    return WProgress(
      props: WProgressProp(
        textInside: true,
        strokeWidth: 24,
        percentage: 100,
        status: 'success',
      ),
    );
  }

  Widget get inner3 {
    return WProgress(
      props: WProgressProp(
        textInside: true,
        strokeWidth: 22,
        percentage: 80,
        status: 'warning',
      ),
    );
  }

  Widget get inner4 {
    return WProgress(
      props: WProgressProp(
        textInside: true,
        strokeWidth: 20,
        percentage: 50,
        status: 'exception',
      ),
    );
  }

  Widget get color1 {
    return WProgress(
      props: WProgressProp(
        color: Colors.red,
        percentage: percentage,
      ),
    );
  }

  Widget get color2 {
    return WProgress(
      props: WProgressProp(
        color: [
          {
            'color': const Color.fromRGBO(0xf5, 0x6c, 0x6c, 1),
            'percentage': 20
          },
          {
            'color': const Color.fromRGBO(0xe6, 0xa2, 0x3c, 1),
            'percentage': 40
          },
          {
            'color': const Color.fromRGBO(0x5c, 0xb8, 0x7a, 1),
            'percentage': 60
          },
          {
            'color': const Color.fromRGBO(0x19, 0x89, 0xfa, 1),
            'percentage': 80
          },
          {
            'color': const Color.fromRGBO(0x6f, 0x7a, 0xd3, 1),
            'percentage': 100
          },
        ],
        percentage: percentage,
      ),
    );
  }

  Widget get color3 {
    return WProgress(
      props: WProgressProp(
        color: (p) {
          return Color.fromARGB(0, 27, 46, p / 100.0);
        },
        percentage: percentage,
      ),
    );
  }

  Widget get circle1 {
    return WProgress(props: WProgressProp(type: 'circle', percentage: 0));
  }

  Widget get circle2 {
    return WProgress(
      props: WProgressProp(type: 'circle', percentage: 25),
    );
  }

  Widget get circle3 {
    return WProgress(
        props:
            WProgressProp(type: 'circle', percentage: 100, status: 'success'));
  }

  Widget get circle4 {
    return WProgress(
        props:
            WProgressProp(type: 'circle', percentage: 70, status: 'warning'));
  }

  Widget get circle5 {
    return WProgress(
        props:
            WProgressProp(type: 'circle', percentage: 50, status: 'exception'));
  }

  Widget get dashboard {
    return WProgress(
      props: WProgressProp(
        type: 'dashboard',
        percentage: percentage,
        color: (p) {
          return Color.fromARGB(0, 27, 46, p / 100.0);
        },
      ),
    );
  }
}

class _ApiProgressState extends State<ApiProgress> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WProgress'),
      ...[
        widget.line1,
        widget.line2,
        widget.line3,
        widget.line4,
        widget.line5,
        widget.inner1,
        widget.inner2,
        widget.inner3,
        widget.inner4,
        widget.color1,
        widget.color2,
        widget.color3,
        widget.circle1,
        widget.circle2,
        widget.circle3,
        widget.circle4,
        widget.circle5,
        widget.dashboard,
        button,
      ]
    ]);
  }

  Widget get button {
    return Row(
      children: [
        WButton('-', on: WButtonOn(
          click: () {
            setState(() {
              widget.percentage--;
            });
          },
        )),
        WButton('+', on: WButtonOn(
          click: () {
            setState(() {
              widget.percentage++;
            });
          },
        )),
      ],
    );
  }
}
