import 'package:flutter/material.dart';
import 'package:wao_ui/core/utils/color_util.dart';
import 'package:wao_ui/src/navigation/w_menu.dart';
import 'package:wao_ui/wao_ui.dart';

class ApiMenu extends StatelessWidget {
  const ApiMenu({Key? key}) : super(key: key);

  Widget get top {
    var activeIndex = '1';
    var activeIndex2 = '2';

    var handleSelect = (key, keyPath) {
      print('$key $keyPath');
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WMenu(
          props: WMenuProp(
            defaultActive: activeIndex,
            mode: 'horizontal',
            menuTrigger: 'click',
          ),
          on: WMenuOn(select: handleSelect),
          slots: WMenuSlot(
            [
              WMenuItem(
                props: WMenuItemProp(index: '1'),
                slots: WMenuItemSlot('处理中心'),
              ),
              WSubmenu(
                props: WSubmenuProp(index: '2'),
                slots: WSubmenuSlot(
                  [
                    WMenuItem(
                      props: WMenuItemProp(index: '2-1'),
                      slots: WMenuItemSlot('选项1'),
                    ),
                    WMenuItem(
                      props: WMenuItemProp(index: '2-2'),
                      slots: WMenuItemSlot('选项2'),
                    ),
                    WMenuItem(
                      props: WMenuItemProp(index: '2-3'),
                      slots: WMenuItemSlot('选项3'),
                    ),
                    WSubmenu(
                      props: WSubmenuProp(index: '2-4'),
                      slots: WSubmenuSlot(
                        [
                          WMenuItem(
                            props: WMenuItemProp(index: '2-4-1'),
                            slots: WMenuItemSlot('选项1'),
                          ),
                          WMenuItem(
                            props: WMenuItemProp(index: '2-4-2'),
                            slots: WMenuItemSlot('选项2'),
                          ),
                          WMenuItem(
                            props: WMenuItemProp(index: '2-4-3'),
                            slots: WMenuItemSlot('选项3'),
                          ),
                        ],
                        title: WMenuItem(
                          slots: WMenuItemSlot('选项4'),
                        ),
                      ),
                    ),
                  ],
                  title: WMenuItem(
                    slots: WMenuItemSlot('我的工作台'),
                  ),
                ),
              ),
              WMenuItem(
                props: WMenuItemProp(index: '3', disabled: true),
                slots: WMenuItemSlot('消息中心'),
              ),
              WMenuItem(
                props: WMenuItemProp(index: '4'),
                slots: WMenuItemSlot(Text('订单管理')),
              ),
            ],
          ),
        ),
        ____________________________________,
        ____________________________________,
        WMenu(
          props: WMenuProp(
            defaultActive: activeIndex,
            mode: 'horizontal',
          ),
          style: WMenuStyle(
            backgroundColor: ColorUtil.hexToColor('#545c64'),
            color: ColorUtil.hexToColor('#FFFFFF'),
            activeColor: ColorUtil.hexToColor('#ffd04b'),
            hoverBackgroundColor: Color.fromRGBO(67, 74, 80, 1),
          ),
          on: WMenuOn(select: handleSelect),
          slots: WMenuSlot(
            [
              WMenuItem(
                props: WMenuItemProp(index: '1'),
                slots: WMenuItemSlot('处理中心'),
              ),
              WSubmenu(
                props: WSubmenuProp(index: '2'),
                slots: WSubmenuSlot(
                  [
                    WMenuItem(
                      props: WMenuItemProp(index: '2-1'),
                      slots: WMenuItemSlot('选项1'),
                    ),
                    WMenuItem(
                      props: WMenuItemProp(index: '2-2'),
                      slots: WMenuItemSlot('选项2'),
                    ),
                    WMenuItem(
                      props: WMenuItemProp(index: '2-3'),
                      slots: WMenuItemSlot('选项3'),
                    ),
                    WSubmenu(
                      props: WSubmenuProp(index: '2-4'),
                      slots: WSubmenuSlot(
                        [
                          WMenuItem(
                            props: WMenuItemProp(index: '2-4-1'),
                            slots: WMenuItemSlot('选项1'),
                          ),
                          WMenuItem(
                            props: WMenuItemProp(index: '2-4-2'),
                            slots: WMenuItemSlot('选项2'),
                          ),
                          WMenuItem(
                            props: WMenuItemProp(index: '2-4-3'),
                            slots: WMenuItemSlot('选项3'),
                          ),
                        ],
                        title: WMenuItem(
                          slots: WMenuItemSlot('选项4'),
                        ),
                      ),
                    ),
                  ],
                  title: WMenuItem(
                    slots: WMenuItemSlot('我的工作台'),
                  ),
                  // titleBuild: (sub) {
                  //   return Text(
                  //     '我的工作台',
                  //     style: TextStyle(color: sub.rootMenu?.$props.textColor),
                  //   );
                  // },
                ),
              ),
              WMenuItem(
                props: WMenuItemProp(index: '3', disabled: true),
                slots: WMenuItemSlot('消息中心'),
              ),
              WMenuItem(
                props: WMenuItemProp(index: '4'),
                slots: WMenuItemSlot('订单管理'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget get aside {
    var activeIndex = '1';
    var activeIndex2 = '2';

    var handleClose = (key, keyPath) {
      print('$key $keyPath');
    };
    var handleOpen = (key, keyPath) {
      print('$key $keyPath');
    };

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              const Text('默认颜色'),
              WMenu(
                props: WMenuProp(
                  defaultActive: activeIndex,
                ),
                on: WMenuOn(
                  close: handleClose,
                  open: handleOpen,
                ),
                slots: WMenuSlot(
                  [
                    WSubmenu(
                      props: WSubmenuProp(index: '1'),
                      slots: WSubmenuSlot(
                        [
                          WMenuItemGroup(
                            props: WMenuItemGroupProp(title: '分组一'),
                            slots: WMenuItemGroupSlot(
                              [
                                WMenuItem(
                                  props: WMenuItemProp(index: '1-1'),
                                  slots: WMenuItemSlot('选项1'),
                                ),
                                WMenuItem(
                                  props: WMenuItemProp(index: '1-2'),
                                  slots: WMenuItemSlot('选项2'),
                                ),
                              ],
                            ),
                          ),
                          WMenuItemGroup(
                            props: WMenuItemGroupProp(title: '分组2'),
                            slots: WMenuItemGroupSlot(
                              [
                                WMenuItem(
                                  props: WMenuItemProp(index: '1-3'),
                                  slots: WMenuItemSlot('选项3'),
                                ),
                              ],
                            ),
                          ),
                          WSubmenu(
                            props: WSubmenuProp(index: '1-4'),
                            slots: WSubmenuSlot(
                              [
                                WMenuItem(
                                  props: WMenuItemProp(index: '2-4-1'),
                                  slots: WMenuItemSlot(
                                    '选项1',
                                  ),
                                )
                              ],
                              title: WMenuItem(
                                slots: WMenuItemSlot('选项4'),
                              ),
                            ),
                          ),
                        ],
                        title: WMenuItem(
                          slots: WMenuItemSlot(
                            Icons.location_on,
                            title: '导航一',
                          ),
                        ),
                      ),
                    ),
                    WMenuItem(
                      props: WMenuItemProp(index: '2'),
                      slots: WMenuItemSlot(
                        Icons.menu,
                        title: '导航二',
                      ),
                    ),
                    WMenuItem(
                      props: WMenuItemProp(index: '3', disabled: true),
                      slots: WMenuItemSlot(
                        Icons.document_scanner,
                        title: '导航三',
                      ),
                    ),
                    WMenuItem(
                      props: WMenuItemProp(index: '4'),
                      slots: WMenuItemSlot(
                        Icons.settings,
                        title: '导航四',
                      ),
                    ),
                  ],
                ),
                style: WMenuStyle(
                  width: 200,
                  // stepPadding: 11.0,
                  minHeight: 400,
                  color: ColorUtil.hexToColor('#303133'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Text('自定义颜色'),
              WMenu(
                props: WMenuProp(
                  defaultActive: activeIndex2,
                ),
                on: WMenuOn(
                  close: handleClose,
                  open: handleOpen,
                ),
                slots: WMenuSlot(
                  [
                    WMenuItem(
                      props: WMenuItemProp(index: '4'),
                      slots: WMenuItemSlot(
                        Icons.settings,
                        title: '导航四',
                      ),
                    ),
                    WSubmenu(
                      props: WSubmenuProp(index: '1'),
                      slots: WSubmenuSlot(
                        [
                          WMenuItemGroup(
                            slots: WMenuItemGroupSlot(
                              [
                                WMenuItem(
                                  props: WMenuItemProp(index: '1-1'),
                                  slots: WMenuItemSlot('选项1'),
                                ),
                                WMenuItem(
                                  props: WMenuItemProp(index: '1-2'),
                                  slots: WMenuItemSlot('选项2'),
                                ),
                              ],
                              title: WMenuItem(
                                slots: WMenuItemSlot('分组一'),
                              ),
                            ),
                          ),
                          WMenuItemGroup(
                            props: WMenuItemGroupProp(title: '分组2'),
                            slots: WMenuItemGroupSlot(
                              [
                                WMenuItem(
                                  props: WMenuItemProp(index: '1-3'),
                                  slots: WMenuItemSlot('选项3'),
                                ),
                              ],
                            ),
                          ),
                          WSubmenu(
                            props: WSubmenuProp(index: '1-4'),
                            slots: WSubmenuSlot(
                              [
                                WMenuItem(
                                  props: WMenuItemProp(index: '2-4-1'),
                                  slots: WMenuItemSlot(
                                    '选项1',
                                  ),
                                )
                              ],
                              title: WMenuItem(
                                slots: WMenuItemSlot('选项4'),
                              ),
                            ),
                          ),
                        ],
                        title: WMenuItem(
                          slots: WMenuItemSlot(
                            Icons.location_on,
                            title: '导航一',
                          ),
                        ),
                      ),
                    ),
                    WMenuItem(
                      props: WMenuItemProp(index: '2'),
                      slots: WMenuItemSlot(
                        Icons.menu,
                        title: '导航二',
                      ),
                    ),
                    WMenuItem(
                      props: WMenuItemProp(index: '3', disabled: true),
                      slots: WMenuItemSlot(
                        Icons.document_scanner,
                        title: '导航三',
                      ),
                    ),
                    WMenuItem(
                      props: WMenuItemProp(index: '4'),
                      slots: WMenuItemSlot(
                        Icons.settings,
                        title: '导航四',
                      ),
                    ),
                  ],
                ),
                style: WMenuStyle(
                  width: 200,
                  minHeight: 400,
                  backgroundColor: ColorUtil.hexToColor('#545c64'),
                  hoverBackgroundColor: Color.fromRGBO(67, 74, 80, 1),
                  color: ColorUtil.hexToColor('#FFFFFF'),
                  activeColor: ColorUtil.hexToColor('#ffd04b'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget get collapse {
    var isCollapse = ValueNotifier(true);
    WMenu? menu = null;
    isCollapse.addListener((() {
      menu?.collapse.value = isCollapse.value;
    }));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WRadioGroup(
          props: WRadioGroupProp(value: isCollapse),
          slots: WRadioGroupSlot([
            WRadioButton(
                props: WRadioButtonProp(label: false),
                slots: WRadioButtonSlot('展开')),
            WRadioButton(
                props: WRadioButtonProp(label: true),
                slots: WRadioButtonSlot('收起')),
          ]),
        ),
        menu = WMenu(
          props: WMenuProp(
            defaultActive: '1-4-1',
            collapse: isCollapse.value,
          ),
          slots: WMenuSlot([
            WSubmenu(
              props: WSubmenuProp(
                index: '1',
              ),
              slots: WSubmenuSlot(
                null,
                title: WMenuItem(
                  slots: WMenuItemSlot(
                    Icons.location_on,
                    title: '导航一',
                  ),
                ),
              ),
            ),
            WMenuItem(
              props: WMenuItemProp(index: '2'),
              slots: WMenuItemSlot(
                Icons.menu,
                title: '导航二',
              ),
            ),
            WMenuItem(
              props: WMenuItemProp(index: '3', disabled: true),
              slots: WMenuItemSlot(
                Icons.document_scanner,
                title: '导航三',
              ),
            ),
            WMenuItem(
              props: WMenuItemProp(index: '4'),
              slots: WMenuItemSlot(
                Icons.settings,
                title: '导航四',
              ),
            ),
          ]),
          style: WMenuStyle(
            width: 200,
            minHeight: 400,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('WMenu'),
          ____________________________________,
          const Text('顶栏'),
          ____________________________________,
          top,
          ____________________________________,
          const Text('侧栏'),
          ____________________________________,
          aside,
          ____________________________________,
          const Text('折叠'),
          ____________________________________,
          collapse,
          ____________________________________,
        ],
      ),
    );
  }

  final Widget ____________________________________ = const SizedBox(
    height: 10,
    width: 1,
  );
}
