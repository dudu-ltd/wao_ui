import 'package:flutter/material.dart';
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
                        title: Text('选项4'),
                      ),
                    ),
                  ],
                  title: const Text('我的工作台'),
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
            backgroundColor: '#545c64',
            textColor: '#FFFFFF',
            activeTextColor: '#ffd04b',
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
                        title: Text('选项4'),
                      ),
                    ),
                  ],
                  title: const Text('我的工作台'),
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
                              title: const Text('分组一'),
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
                              title: Text('选项4'),
                            ),
                          ),
                        ],
                        title: Row(
                          children: const [
                            Icon(Icons.location_on),
                            Text('导航一'),
                          ],
                        ),
                      ),
                    ),
                    WMenuItem(
                      props: WMenuItemProp(index: '2'),
                      slots: WMenuItemSlot(
                        Icon(Icons.menu),
                        title: Text('导航二'),
                      ),
                    ),
                    WMenuItem(
                      props: WMenuItemProp(index: '3', disabled: true),
                      slots: WMenuItemSlot(
                        Icon(Icons.document_scanner),
                        title: Text('导航三'),
                      ),
                    ),
                    WMenuItem(
                      props: WMenuItemProp(index: '4'),
                      slots: WMenuItemSlot(
                        Icon(Icons.settings),
                        title: Text('导航四'),
                      ),
                    ),
                  ],
                ),
                style: WMenuStyle(
                  width: 200,
                  minHeight: 400,
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
                  backgroundColor: '#545c64',
                  textColor: '#FFFFFF',
                  activeTextColor: '#ffd04b',
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
                              title: const Text('分组一'),
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
                              title: Text('选项4'),
                            ),
                          ),
                        ],
                        title: Row(
                          children: const [
                            Icon(Icons.location_on),
                            Text('导航一'),
                          ],
                        ),
                      ),
                    ),
                    WMenuItem(
                      props: WMenuItemProp(index: '2'),
                      slots: WMenuItemSlot(
                        Icon(Icons.menu),
                        title: Text('导航二'),
                      ),
                    ),
                    WMenuItem(
                      props: WMenuItemProp(index: '3', disabled: true),
                      slots: WMenuItemSlot(
                        Icon(Icons.document_scanner),
                        title: Text('导航三'),
                      ),
                    ),
                    WMenuItem(
                      props: WMenuItemProp(index: '4'),
                      slots: WMenuItemSlot(
                        Icon(Icons.settings),
                        title: Text('导航四'),
                      ),
                    ),
                  ],
                ),
                style: WMenuStyle(
                  width: 200,
                  minHeight: 400,
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
        WMenu(
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
                title: Row(
                  children: [
                    Icon(Icons.location_on),
                  ],
                ),
              ),
            ),
            WMenuItem(
              props: WMenuItemProp(index: '2'),
              slots: WMenuItemSlot(
                Icon(Icons.menu),
                title: Text('导航二'),
              ),
            ),
            WMenuItem(
              props: WMenuItemProp(index: '3', disabled: true),
              slots: WMenuItemSlot(
                Icon(Icons.document_scanner),
                title: Text('导航三'),
              ),
            ),
            WMenuItem(
              props: WMenuItemProp(index: '4'),
              slots: WMenuItemSlot(
                Icon(Icons.settings),
                title: Text('导航四'),
              ),
            ),
          ]),
          style: WMenuStyle(
            width: 200,
            minHeight: 400,
          ),
        ),
        /*   
          <el-submenu index="1">
            <template slot="title">
              <i class="el-icon-location"></i>
              <span slot="title">导航一</span>
            </template>
            <el-menu-item-group>
              <span slot="title">分组一</span>
              <el-menu-item index="1-1">选项1</el-menu-item>
              <el-menu-item index="1-2">选项2</el-menu-item>
            </el-menu-item-group>
            <el-menu-item-group title="分组2">
              <el-menu-item index="1-3">选项3</el-menu-item>
            </el-menu-item-group>
            <el-submenu index="1-4">
              <span slot="title">选项4</span>
              <el-menu-item index="1-4-1">选项1</el-menu-item>
            </el-submenu>
          </el-submenu>
          <el-menu-item index="2">
            <i class="el-icon-menu"></i>
            <span slot="title">导航二</span>
          </el-menu-item>
          <el-menu-item index="3" disabled>
            <i class="el-icon-document"></i>
            <span slot="title">导航三</span>
          </el-menu-item>
          <el-menu-item index="4">
            <i class="el-icon-setting"></i>
            <span slot="title">导航四</span>
          </el-menu-item>
        */
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
