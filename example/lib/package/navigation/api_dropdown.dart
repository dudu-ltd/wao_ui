import 'package:flutter/material.dart';
import 'package:wao_ui/src/navigation/w_dropdown.dart';
import 'package:wao_ui/wao_ui.dart';

class ApiDropdown extends StatelessWidget {
  const ApiDropdown({Key? key}) : super(key: key);

  Row get basicGroup {
    return Row(
      children: [
        WDropdown(
          slots: WDropdownSlot(
            const Text('下拉菜单'),
            dropdown: WDropdownMenu(
              slots: WDropdownMenuSlot([
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('黄金糕')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('狮子头')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('螺蛳粉')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('双皮奶')),
                  props: WDropdownItemProp(disabled: true),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('蚵仔煎')),
                  props: WDropdownItemProp(disabled: true),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }

  Row get splitGroup {
    return Row(
      children: [
        WDropdown(
          slots: WDropdownSlot(
            WButton(
              props: WButtonProp(
                  type: 'primary',
                  iconRight: Icons.keyboard_arrow_down_rounded),
              slots: WButtonSlot('下拉菜单'),
            ),
            dropdown: WDropdownMenu(
              slots: WDropdownMenuSlot([
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('黄金糕')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('狮子头')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('螺蛳粉')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('双皮奶')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('蚵仔煎')),
                ),
              ]),
            ),
          ),
        ),
        WDropdown(
          props: WDropdownProp(splitButton: true),
          slots: WDropdownSlot(
            '下拉菜单2',
            dropdown: WDropdownMenu(
              slots: WDropdownMenuSlot([
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('黄金糕')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('狮子头')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('螺蛳粉')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('双皮奶')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('蚵仔煎')),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }

  Row get triggerGroup {
    return Row(
      children: [
        WDropdown(
          slots: WDropdownSlot(
            WButton(
              props: WButtonProp(type: 'primary'),
              slots: WButtonSlot('Hover'),
            ),
            dropdown: WDropdownMenu(
              slots: WDropdownMenuSlot([
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('黄金糕')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('狮子头')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('螺蛳粉')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('双皮奶')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('蚵仔煎')),
                ),
              ]),
            ),
          ),
        ),
        WDropdown(
          props: WDropdownProp(trigger: 'click'),
          slots: WDropdownSlot(
            WButton(
              props: WButtonProp(type: 'primary'),
              slots: WButtonSlot('Click'),
            ),
            dropdown: WDropdownMenu(
              slots: WDropdownMenuSlot([
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('黄金糕')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('狮子头')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('螺蛳粉')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('双皮奶')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('蚵仔煎')),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }

  Row get disableGroup {
    return Row(
      children: [
        WDropdown(
          props: WDropdownProp(hideOnClick: false),
          slots: WDropdownSlot(
            WButton(
              props: WButtonProp(type: 'primary'),
              slots: WButtonSlot('下拉菜单'),
            ),
            dropdown: WDropdownMenu(
              slots: WDropdownMenuSlot([
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('黄金糕')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('狮子头')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('螺蛳粉')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('双皮奶')),
                  props: WDropdownItemProp(disabled: true),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('蚵仔煎')),
                  props: WDropdownItemProp(divided: true),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }

  Row get commandGroup {
    return Row(
      children: [
        WDropdown(
          on: WDropdownOn(command: () {}),
          slots: WDropdownSlot(
            WButton(
              props: WButtonProp(type: 'primary'),
              slots: WButtonSlot('下拉菜单'),
            ),
            dropdown: WDropdownMenu(
              slots: WDropdownMenuSlot([
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('黄金糕')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('狮子头')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('螺蛳粉')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('双皮奶')),
                  props: WDropdownItemProp(disabled: true),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('蚵仔煎')),
                  props: WDropdownItemProp(divided: true),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }

  Row get sizeGroup {
    return Row(
      children: [
        WDropdown(
          slots: WDropdownSlot(
            const Text('下拉菜单'),
            dropdown: WDropdownMenu(
              slots: WDropdownMenuSlot([
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('黄金糕')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('狮子头')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('螺蛳粉')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('双皮奶')),
                  props: WDropdownItemProp(disabled: true),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('蚵仔煎')),
                  props: WDropdownItemProp(disabled: true),
                ),
              ]),
            ),
          ),
        ),
        WDropdown(
          props: WDropdownProp(size: 'medium'),
          slots: WDropdownSlot(
            const Text('下拉菜单'),
            dropdown: WDropdownMenu(
              slots: WDropdownMenuSlot([
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('黄金糕')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('狮子头')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('螺蛳粉')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('双皮奶')),
                  props: WDropdownItemProp(disabled: true),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('蚵仔煎')),
                  props: WDropdownItemProp(disabled: true),
                ),
              ]),
            ),
          ),
        ),
        WDropdown(
          props: WDropdownProp(size: 'small'),
          slots: WDropdownSlot(
            const Text('下拉菜单'),
            dropdown: WDropdownMenu(
              slots: WDropdownMenuSlot([
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('黄金糕')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('狮子头')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('螺蛳粉')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('双皮奶')),
                  props: WDropdownItemProp(disabled: true),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('蚵仔煎')),
                  props: WDropdownItemProp(disabled: true),
                ),
              ]),
            ),
          ),
        ),
        WDropdown(
          props: WDropdownProp(size: 'mini'),
          slots: WDropdownSlot(
            const Text('下拉菜单'),
            dropdown: WDropdownMenu(
              slots: WDropdownMenuSlot([
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('黄金糕')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('狮子头')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('螺蛳粉')),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('双皮奶')),
                  props: WDropdownItemProp(disabled: true),
                ),
                WDropdownItem(
                  slots: WDropdownItemSlot(const Text('蚵仔煎')),
                  props: WDropdownItemProp(disabled: true),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('原生Dropdown'),
      DropdownButton<String>(
        onChanged: (e) {},
        items: const [
          DropdownMenuItem(
            child: Text('测试'),
          ),
        ],
      ),
      const Text('WDropdown'),
      basicGroup,
      splitGroup,
      triggerGroup,
      disableGroup,
      commandGroup,
      sizeGroup,
    ]);
  }
}
