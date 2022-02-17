import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_carousel.dart';

class ApiCarousel extends StatelessWidget {
  const ApiCarousel({Key? key}) : super(key: key);

  Widget get basic {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text('默认 Hover 指示器触发'),
              WCarousel(
                props: WCarouselProp(height: '150px'),
                slots: WCarouselSlot(
                  List.generate(
                    4,
                    (index) {
                      WCarouselItem(
                        slots: WCarouselItemSlot(Text('$index')),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text('Click 指示器触发'),
              WCarousel(
                props: WCarouselProp(height: '150px', trigger: 'click'),
                slots: WCarouselSlot(
                  List.generate(
                    4,
                    (index) {
                      WCarouselItem(
                        slots: WCarouselItemSlot(Text('$index')),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget get guide {
    return WCarousel(
      props: WCarouselProp(indicatorPosition: 'outside'),
      slots: WCarouselSlot(
        List.generate(
          4,
          (index) {
            WCarouselItem(
              slots: WCarouselItemSlot(Text('$index')),
            );
          },
        ),
      ),
    );
  }

  Widget get arrow {
    return WCarousel(
      props: WCarouselProp(arrow: 'always', interval: 5000),
      slots: WCarouselSlot(
        List.generate(
          4,
          (index) {
            WCarouselItem(
              slots: WCarouselItemSlot(Text('$index')),
            );
          },
        ),
      ),
    );
  }

  Widget get card {
    return WCarousel(
      props: WCarouselProp(height: '200px', type: 'card', interval: 4000),
      slots: WCarouselSlot(
        List.generate(
          6,
          (index) {
            WCarouselItem(
              slots: WCarouselItemSlot(Text('$index')),
            );
          },
        ),
      ),
    );
  }

  Widget get direction {
    return WCarousel(
      props: WCarouselProp(
          height: '200px', direction: Axis.vertical, autoplay: false),
      slots: WCarouselSlot(
        List.generate(
          3,
          (index) {
            WCarouselItem(
              slots: WCarouselItemSlot(Text('$index')),
            );
          },
        ),
      ),
    );
  }

  final Widget ____________________________________ = const SizedBox(
    height: 10,
    width: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WCarousel'),
      ____________________________________,
      const Text('基本用法'),
      ____________________________________,
      basic,
      ____________________________________,
      const Text('指示器'),
      ____________________________________,
      guide,
      ____________________________________,
      const Text('切换箭头'),
      ____________________________________,
      arrow,
      ____________________________________,
      const Text('卡片化'),
      ____________________________________,
      card,
      ____________________________________,
      const Text('方向'),
      ____________________________________,
      direction,
    ]);
  }
}
