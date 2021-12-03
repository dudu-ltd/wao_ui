import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_carousel.dart';

class ApiCarousel extends StatelessWidget {
  const ApiCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WCarousel'),
      WCarousel(),
    ]);
  }
}
