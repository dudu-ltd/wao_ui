import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

var direction = ValueNotifier('ltr');
var drawer = ValueNotifier(false);
var drawerBasic = Demo(
  'drawerBasic',
  Row(
    children: [
      StatefulBuilder(builder: (context, setState) {
        direction.addListener(() => setState(() {}));
        return WRadioGroup(
          props: WRadioGroupProp(value: direction),
          slots: WRadioGroupSlot([
            WRadio(
              props: WRadioProp(label: 'ltr'),
              slots: WRadioSlot('从左往右开'),
            ),
            WRadio(
              props: WRadioProp(label: 'rtl'),
              slots: WRadioSlot('从右往左开'),
            ),
            WRadio(
              props: WRadioProp(label: 'ttb'),
              slots: WRadioSlot('从上往下开'),
            ),
            WRadio(
              props: WRadioProp(label: 'btt'),
              slots: WRadioSlot('从下往上开'),
            ),
          ]),
        );
      }),
      WButton(
        props: WButtonProp(type: 'primary'),
        slots: WButtonSlot('点我打开'),
        on: WButtonOn(click: () => drawer.value = true),
      ),
      WDrawer(
        props: WDrawerProp(
          title: '我是标题',
          direction: direction.value,
          beforeClose: (done) {
            done?.call();
          },
          visible: drawer,
        ),
        slots: WDrawerSlot(Text('我来啦！')),
      ),
    ],
  ),
  r'''
StatefulBuilder(
      builder: (context, setState) {
        var direction = ValueNotifier('ltr');
        var drawer = ValueNotifier(false);
        direction.addListener(() => setState(() {}));
        return Row(
          children: [
            WRadioGroup(
              props: WRadioGroupProp(value: direction),
              slots: WRadioGroupSlot([
                WRadio(
                  props: WRadioProp(label: 'ltr'),
                  slots: WRadioSlot('从左往右开'),
                ),
                WRadio(
                  props: WRadioProp(label: 'rtl'),
                  slots: WRadioSlot('从右往左开'),
                ),
                WRadio(
                  props: WRadioProp(label: 'ttb'),
                  slots: WRadioSlot('从上往下开'),
                ),
                WRadio(
                  props: WRadioProp(label: 'btt'),
                  slots: WRadioSlot('从下往上开'),
                ),
              ]),
            ),
            WButton(
              props: WButtonProp(type: 'primary'),
              slots: WButtonSlot('点我打开'),
              on: WButtonOn(click: () => drawer.value = true),
            ),
            WDrawer(
              props: WDrawerProp(
                title: '我是标题',
                direction: direction.value,
                beforeClose: (done) {
                  done?.call();
                },
                visible: drawer,
              ),
              slots: WDrawerSlot(Text('我来啦！')),
            ),
          ],
        );
      },
    )
  ''',
);
