import 'package:flutter/material.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/src/others/w_carousel.dart';
import 'package:wao_ui/wao_ui.dart';

class ApiCarousel extends StatelessWidget {
  const ApiCarousel({Key? key}) : super(key: key);

  Widget get basic {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('默认 Hover 指示器触发'),
                WCarousel(
                  props: WCarouselProp(height: '150px'),
                  style: WCarouselStyle(height: 250),
                  slots: WCarouselSlot(
                    List.generate(
                      4,
                      (index) {
                        return WCarouselItem(
                          slots: WCarouselItemSlot(
                            ColoredBox(
                              color: ColorUtil.hexToColor('#99a9bf')
                                  .withAlpha(50 * index + 50),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '$index',
                                  style: TextStyle(
                                      fontSize: 80, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Click 指示器触发'),
                WCarousel(
                  style: WCarouselStyle(height: 250),
                  props: WCarouselProp(height: '150px', trigger: 'click'),
                  slots: WCarouselSlot(
                    List.generate(
                      4,
                      (index) {
                        return WCarouselItem(
                          slots: WCarouselItemSlot(
                            ColoredBox(
                              color:
                                  Colors.blueAccent.withAlpha(50 * index + 50),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '$index',
                                  style: TextStyle(
                                      fontSize: 80, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget get guide {
    return WCarousel(
      style: WCarouselStyle(height: 250),
      props: WCarouselProp(indicatorPosition: 'outside'),
      slots: WCarouselSlot(
        List.generate(
          4,
          (index) {
            return WCarouselItem(
              slots: WCarouselItemSlot(
                ColoredBox(
                  color: ColorUtil.hexToColor('#99a9bf')
                      .withAlpha(50 * index + 50),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      '$index',
                      style: TextStyle(fontSize: 80, color: Colors.white),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget get arrow {
    return WCarousel(
      style: WCarouselStyle(height: 250),
      props: WCarouselProp(arrow: 'always', interval: 5000),
      slots: WCarouselSlot(
        List.generate(
          4,
          (index) {
            return WCarouselItem(
              slots: WCarouselItemSlot(
                ColoredBox(
                  color: ColorUtil.hexToColor('#99a9bf')
                      .withAlpha(50 * index + 50),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      '$index',
                      style: TextStyle(fontSize: 80, color: Colors.white),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget get card {
    return WCarousel(
      style: WCarouselStyle(height: 600),
      props: WCarouselProp(height: '200px', type: 'card', interval: 4000),
      slots: WCarouselSlot(
        List.generate(
          6,
          (index) {
            var i = index + 1;
            return WCarouselItem(
              slots: WCarouselItemSlot(
                ColoredBox(
                  color: Color.fromARGB(255, 0x99 * i, 0xa9 * i, 0xbf * i),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      '$index',
                      style: TextStyle(fontSize: 80, color: Colors.white),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget get direction {
    return WCarousel(
      style: WCarouselStyle(height: 250),
      props: WCarouselProp(
          height: '200px', direction: Axis.vertical, autoplay: false),
      slots: WCarouselSlot(
        List.generate(
          3,
          (index) {
            return WCarouselItem(
              slots: WCarouselItemSlot(
                ColoredBox(
                  color: ColorUtil.hexToColor('#99a9bf')
                      .withAlpha(50 * index + 50),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      '$index',
                      style: TextStyle(fontSize: 80, color: Colors.white),
                    ),
                  ),
                ),
              ),
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
        ],
      ),
    );
  }
}
