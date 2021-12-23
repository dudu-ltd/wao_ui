import 'package:flutter/material.dart';
import 'package:wao_ui/src/data/w_tag.dart';

class ApiTag extends StatelessWidget {
  const ApiTag({Key? key}) : super(key: key);

  Row get basicGroup {
    return Row(children: [
      WTag(slots: WTagSlot('标签一')),
      WTag(slots: WTagSlot('标签二'), props: WTagProp(type: 'success')),
      WTag(slots: WTagSlot('标签三'), props: WTagProp(type: 'info')),
      WTag(slots: WTagSlot('标签四'), props: WTagProp(type: 'warning')),
      WTag(slots: WTagSlot('标签五'), props: WTagProp(type: 'danger'))
    ]);
  }

  Row get removableGroup {
    return Row(children: [
      WTag(slots: WTagSlot('标签一'), props: WTagProp(closable: true)),
      WTag(
          slots: WTagSlot('标签二'),
          props: WTagProp(closable: true, type: 'success')),
      WTag(
          slots: WTagSlot('标签三'),
          props: WTagProp(closable: true, type: 'info')),
      WTag(
          slots: WTagSlot('标签四'),
          props: WTagProp(closable: true, type: 'warning')),
      WTag(
          slots: WTagSlot('标签五'),
          props: WTagProp(closable: true, type: 'danger'))
    ]);
  }

  Row get editableGroup {
    return Row(children: [
      WTag(
          on: WTagOn(click: () {}),
          slots: WTagSlot('标签一'),
          props: WTagProp(disableTransitions: false, closable: true)),
      WTag(
          on: WTagOn(click: () {
            print('');
          }, close: () {
            print('关闭');
          }),
          slots: WTagSlot('标签二'),
          props: WTagProp(
              disableTransitions: false, closable: true, type: 'success')),
      WTag(
          on: WTagOn(click: () {}),
          slots: WTagSlot('标签三'),
          props: WTagProp(
              disableTransitions: false, closable: true, type: 'info')),
      WTag(
          on: WTagOn(click: () {}),
          slots: WTagSlot('标签四'),
          props: WTagProp(
              disableTransitions: false, closable: true, type: 'warning')),
      WTag(
          on: WTagOn(click: () {}),
          slots: WTagSlot('标签五'),
          props: WTagProp(
              disableTransitions: false, closable: true, type: 'danger'))
    ]);
  }

  Row get diffSizeGroup {
    return Row(children: [
      WTag(slots: WTagSlot('默认标签')),
      WTag(slots: WTagSlot('中等标签'), props: WTagProp(size: 'medium')),
      WTag(slots: WTagSlot('小型标签'), props: WTagProp(size: 'small')),
      WTag(slots: WTagSlot('超小标签'), props: WTagProp(size: 'mini')),
    ]);
  }

  Row get diffThemeGroupDark {
    return Row(children: [
      const Text('Dart'),
      WTag(
        slots: WTagSlot('标签一'),
        props: WTagProp(effect: 'dark', closable: true),
      ),
      WTag(
        slots: WTagSlot('标签二'),
        props: WTagProp(effect: 'dark', type: 'success', closable: true),
      ),
      WTag(
        slots: WTagSlot('标签三'),
        props: WTagProp(effect: 'dark', type: 'info', closable: true),
      ),
      WTag(
        slots: WTagSlot('标签四'),
        props: WTagProp(effect: 'dark', type: 'warning', closable: true),
      ),
      WTag(
        slots: WTagSlot('标签五'),
        props: WTagProp(effect: 'dark', type: 'danger', closable: true),
      )
    ]);
  }

  Row get diffThemeGroupPlain {
    return Row(children: [
      const Text('Plain'),
      WTag(
        slots: WTagSlot('标签一'),
        props: WTagProp(effect: 'plain'),
      ),
      WTag(
        slots: WTagSlot('标签二'),
        props: WTagProp(effect: 'plain', type: 'success'),
      ),
      WTag(
        slots: WTagSlot('标签三'),
        props: WTagProp(effect: 'plain', type: 'info'),
      ),
      WTag(
        slots: WTagSlot('标签四'),
        props: WTagProp(effect: 'plain', type: 'warning'),
      ),
      WTag(
        slots: WTagSlot('标签五'),
        props: WTagProp(effect: 'plain', type: 'danger'),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      basicGroup,
      removableGroup,
      editableGroup,
      diffSizeGroup,
      diffThemeGroupDark,
      diffThemeGroupPlain,
    ]);
  }
}
