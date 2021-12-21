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
        strokeWidth: 26.0,
        percentage: 70,
      ),
    );
  }

  Widget get inner2 {
    return WProgress(
      props: WProgressProp(
        textInside: true,
        strokeWidth: 24.0,
        percentage: 100,
        status: 'success',
      ),
    );
  }

  Widget get inner3 {
    return WProgress(
      props: WProgressProp(
        textInside: true,
        strokeWidth: 22.0,
        percentage: 80,
        status: 'warning',
      ),
    );
  }

  Widget get inner4 {
    return WProgress(
      props: WProgressProp(
        textInside: true,
        strokeWidth: 20.0,
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
          return Color.fromRGBO(
              255, (p / 100 * 199).toInt(), (p / 100 * 156).toInt(), p / 100.0);
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
      props: WProgressProp(type: 'circle', percentage: 75),
    );
  }

  Widget get circle3 {
    return WProgress(
        props:
            WProgressProp(type: 'circle', percentage: 100, status: 'success'));
  }

  Widget get circle4 {
    return WProgress(
      props: WProgressProp(
        type: 'circle',
        percentage: 70.0,
        status: 'warning',
        strokeLinecap: 'butt',
      ),
    );
  }

  Widget get circle5 {
    return WProgress(
        props: WProgressProp(
      type: 'circle',
      percentage: 50,
      status: 'exception',
      strokeLinecap: 'square',
    ));
  }

  Widget get dashboard {
    return WProgress(
      props: WProgressProp(
        type: 'dashboard',
        percentage: percentage,
        strokeWidth: 30.0,
        color: (p) {
          return Color.fromARGB(0, 27, 46, 1);
        },
      ),
    );
  }
}

class _ApiProgressState extends State<ApiProgress> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.5,
      child: ListView(children: [
        const Text('WProgress'),
        ...[
          marginWrapper(widget.line1),
          marginWrapper(widget.line2),
          marginWrapper(widget.line3),
          marginWrapper(widget.line4),
          marginWrapper(widget.line5),
          marginWrapper(widget.inner1),
          marginWrapper(widget.inner2),
          marginWrapper(widget.inner3),
          marginWrapper(widget.inner4),
          marginWrapper(widget.color1),
          marginWrapper(widget.color2),
          marginWrapper(widget.color3),
          Row(
            children: [
              Expanded(child: widget.circle1),
              Expanded(child: widget.circle2),
              Expanded(child: widget.circle3),
              Expanded(child: widget.circle4),
              Expanded(child: widget.circle5),
            ],
          ),
          widget.dashboard,
          button,
        ]
      ]),
    );
  }

  Widget marginWrapper(Widget child) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: child,
    );
  }

  Widget get button {
    return Row(
      children: [
        WButton(
            slots: WButtonSlot('-'),
            on: WButtonOn(
              click: () {
                setState(() {
                  widget.percentage--;
                  if (widget.percentage < 0) widget.percentage = 0;
                });
              },
            )),
        WButton(
            slots: WButtonSlot('+'),
            on: WButtonOn(
              click: () {
                setState(() {
                  widget.percentage++;
                  if (widget.percentage >= 100) widget.percentage = 100;
                });
              },
            )),
      ],
    );
  }
}
