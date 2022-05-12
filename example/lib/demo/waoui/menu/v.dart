import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

var v = WMenu(
  props: WMenuProp(
    defaultActive: '1-4-1',
    collapse: false,
  ),
  slots: WMenuSlot([
    WSubmenu(
      props: WSubmenuProp(
        index: '1',
      ),
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
  ]),
  style: WMenuStyle(
    width: 200,
    minHeight: 300,
  ),
);
