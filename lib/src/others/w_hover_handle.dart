import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_mixins.dart';
import 'package:wao_ui/core/utils/layout_util.dart';
import 'package:wao_ui/src/basic/cfg_global.dart';
import 'package:wao_ui/src/basic/w_button.dart';

class WHoverHandle extends StatefulWidget
    with
        BaseMixins<WHoverHandleOn, WHoverHandleProp, WHoverHandleSlot,
            WHoverHandleStyle> {
  @override
  State<WHoverHandle> createState() => _WHoverHandleState();
  WHoverHandle({
    Key? key,
    WHoverHandleOn? on,
    WHoverHandleProp? props,
    WHoverHandleSlot? slots,
    WHoverHandleStyle? style,
  }) : super(key: key) {
    $on = on ?? WHoverHandleOn();
    $props = props ?? WHoverHandleProp();
    $slots = slots ?? WHoverHandleSlot(null);
    $style = style ?? WHoverHandleStyle();
    init();
  }

  bool isHover = false;
}

class _WHoverHandleState extends State<WHoverHandle> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        print('onEnter');
        widget.isHover = true;
        setState(() {});
      },
      onExit: (event) {
        print('exit');
        widget.isHover = false;
        setState(() {});
      },
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          widget.first,
          Offstage(
            offstage: !widget.isHover,
            child: InkWell(
              child: handlers,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget? get handlers {
    if (widget.$slots.defaultSlotBefore == null) return null;
    assert(widget.first.key != null,
        'WHoverHandle 子组件必须有 key。(Key is neccessary in inner widget.)');
    GlobalKey key = widget.first.key! as GlobalKey;
    print(key.currentContext);
    if (key.currentContext != null) {
      final RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
      var len = widget.$props.handles.length;
      return SizedBox(
        height: box.size.height,
        width: box.size.width,
        child: ColoredBox(
          color: Colors.black54.withAlpha(150),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.center,
              child: GridView.count(
                shrinkWrap: true,
                mainAxisSpacing: 7.5,
                crossAxisSpacing: 7.5,
                crossAxisCount: len == 1
                    ? 1
                    : [2, 4].contains(len)
                        ? 2
                        : 3,
                children: List.generate(
                  widget.$props.handles.length,
                  (index) {
                    return InkWell(
                      child: widget.$props.handles[index].icon,
                      onTap: widget.$props.handles[index].event,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}

class WHoverHandleOn extends BaseOn {}

class WHoverHandleProp extends BaseProp {
  late List<IconAndEvent> handles;
  WHoverHandleProp({
    handles,
  }) {
    this.handles = handles ?? <IconAndEvent>[];
  }
}

class WHoverHandleSlot extends BaseSlot {
  WHoverHandleSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class IconAndEvent {
  late Icon icon;
  late Function() event;
  IconAndEvent({required this.icon, required this.event});
}
