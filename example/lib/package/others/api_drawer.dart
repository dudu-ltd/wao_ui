import 'package:flutter/material.dart';
import 'package:wao_ui/src/others/w_drawer.dart';
import 'package:wao_ui/wao_ui.dart';

class ApiDrawer extends StatelessWidget {
  const ApiDrawer({Key? key}) : super(key: key);

  final Widget ____________________________________ = const SizedBox(
    height: 10,
    width: 1,
  );

  Widget get basic {
    return StatefulBuilder(
      builder: (context, setState) {
        var direction = ValueNotifier('ltr');
        var drawer = ValueNotifier(false);
        direction.addListener(() => setState(() {}));
        return Row(
          children: [
            WRadioGroup(
              props: WRadioGroupProp($model: direction),
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
    );
  }

  Widget get noTitle {
    var drawer = ValueNotifier(false);
    return Row(
      children: [
        WButton(
          props: WButtonProp(type: 'primary'),
          slots: WButtonSlot('点我打开'),
          on: WButtonOn(click: () => drawer.value = true),
        ),
        WDrawer(
          props: WDrawerProp(
            title: '我是标题',
            visible: drawer,
            withHeader: false,
          ),
          slots: WDrawerSlot(Text('我来啦！')),
        ),
      ],
    );
  }

  Widget get customContent {
    var table = false;
    var dialog = false;
    return Row(
      children: [
        WButton(
          props: WButtonProp(type: 'text'),
          slots: WButtonSlot('打开嵌套表格的 Drawer'),
          on: WButtonOn(click: () => table = true),
        ),
        WButton(
          props: WButtonProp(type: 'text'),
          slots: WButtonSlot('打开嵌套表格的 Drawer'),
          on: WButtonOn(click: () => dialog = true),
        ),
      ],
    );
  }

  Widget get nestedDrawer {
    var drawer = ValueNotifier(false);
    var innerDrawer = ValueNotifier(false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        WButton(
          props: WButtonProp(type: 'primary'),
          slots: WButtonSlot('点我打开'),
          on: WButtonOn(click: () => drawer.value = true),
        ),
        Expanded(
          child: WDrawer(
            props: WDrawerProp(
              title: '我是标题',
              visible: drawer,
              // withHeader: false,
              modalAppendToBody: true,
              size: "50%",
            ),
            slots: WDrawerSlot([
              WButton(
                props: WButtonProp(),
                slots: WButtonSlot('打开里面的!'),
                on: WButtonOn(
                  click: () {
                    innerDrawer.value = true;
                  },
                ),
              ),
              WDrawer(
                props: WDrawerProp(
                  title: '我是标题',
                  visible: innerDrawer,
                  // withHeader: false,
                  modalAppendToBody: false,
                  beforeClose: (done) {
                    done?.call();
                  },
                ),
                slots: WDrawerSlot(Text('_(:зゝ∠)_')),
              ),
            ]),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ____________________________________,
            const Text('基本使用'),
            ____________________________________,
            basic,
            ____________________________________,
            const Text('不添加 Title'),
            ____________________________________,
            noTitle,
            ____________________________________,
            const Text('自定义内容'),
            ____________________________________,
            customContent,
            ____________________________________,
            const Text('多层嵌套'),
            ____________________________________,
            nestedDrawer,
            ____________________________________,
          ],
        ),
      ],
    );
  }
}
