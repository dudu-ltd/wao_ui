import 'package:flutter/material.dart';
import 'package:wao_ui/src/form/w_slider.dart';

class ApiSlider extends StatelessWidget {
  const ApiSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WSlider'),
      WSlider(),
    ]);
  }
}
