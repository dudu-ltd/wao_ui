// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

class _WTreeState extends WState<WTree> {
  WNodeData? currentNode;

  Widget? expandedIcon(WNodeData node, selectdColor) {
    var icon = Icon(
      node.isExpand ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
      color: selectdColor,
    );
    return node.isLeaf ? null : icon;
  }

  @override
  void initState() {
    super.initState();
    if (wp.data.isNotEmpty && wp.treeData.isEmpty) {
      wp.treeData = WNodeData.listFromJson(wp.data, wp.props);
    }
  }

  @override
  WTreeProp get wp => widget.$props;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget wbuild(BuildContext context) {
    var cols = <Widget>[];
    for (var node in widget.$props.treeData) {
      var selectdColor = _getSelectedNodeColor(node, context);
      cols.add(
        MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Builder(
            builder: (ctx) {
              return GestureDetector(
                onTap: getNodeClickProxy(ctx, node),
                onSecondaryTapUp: widget.$on.nodeRightClick == null
                    ? (detail) {}
                    : (detail) {
                        currentNode = node;
                        widget.$on.nodeRightClick!
                            .call(ctx, node, widget)
                            .call(detail);
                      },
                child: AbsorbPointer(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: (widget.$props.level) * wp.indent,
                        ),
                        child: expandedIcon(node, selectdColor),
                      ),
                      if (node.icon is IconData)
                        Icon(node.icon, color: selectdColor),
                      Text(
                        node.label,
                        maxLines: 1,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: selectdColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
      if (node.children.isNotEmpty && node.isExpand) {
        WTree tree = WTree(
          on: widget.$on,
          props: WTreeProp()
            ..$model = widget.$props.$model
            ..lazy = wp.lazy
            ..load = wp.load
            ..treeData = node.children
            ..level = widget.$props.level + 1,
        );
        cols.add(tree);
      }
    }

    return Column(
      children: cols,
    );
  }

  void changeExpand(WNodeData node) {
    expandFn() {
      currentNode = node;
      node.isExpand = !node.isExpand;
    }

    if (wp.lazy && !node._loaded && wp.load != null) {
      wp.load!.call(node, (List<dynamic>? children) {
        if (children != null) {
          node.children = WNodeData.listFromJson(children);
        }
        node._loaded = true;
        updateView(expandFn);
      });
    } else {
      updateView(expandFn);
    }
  }

  GestureTapCallback getNodeClickProxy(ctx, WNodeData node) {
    return widget.$on.nodeClick == null
        ? () => changeExpand(node)
        : () {
            changeExpand(node);
            if (node.children.isEmpty) {
              widget.$on.nodeClick!.call(ctx, node, null)?.call();
            }
          };
  }

  Color _getSelectedNodeColor(node, context) {
    return node == currentNode ? Theme.of(context).primaryColor : Colors.black;
  }
}

class WTree extends WStatefulWidget<WTreeOn, WTreeProp, WTreeSlot, WTreeStyle> {
  WTree({
    Key? key,
    WTreeOn? on,
    WTreeProp? props,
    WTreeSlot? slots,
    WTreeStyle? style,
  }) : super(key: key) {
    $on = on ?? WTreeOn();
    $props = props ?? WTreeProp();
    $slots = slots ?? WTreeSlot(null);
    $style = style ?? WTreeStyle();
    init();
  }

  @override
  State<WTree> createState() => _WTreeState();
}

enum DropType { inner, prev, next }

class WTreeProp extends BaseProp with ModelDriveProp {
  Iterable<dynamic> data = [];
  List<WNodeData> treeData = [];
  String? emptyText;
  String? nodeKey;
  WNodeProps props = WNodeProps();
  bool renderAfterExpand = true;
  Function(WNodeData, dynamic)? load;
  Function(dynamic, dynamic, dynamic)? renderContent;
  bool highlightCurrent = false;
  bool defaultExpandAll = true;
  bool expandOnClickNode = true;
  bool checkOnClickNode = false;
  bool autoExpandParent = true;
  Iterable? defaultExpandedKeys;
  bool showCheckbox = false;
  bool checkStrictly = false;
  Iterable? defaultCheckedKeys;
  dynamic currentNodeKey;
  Function(dynamic, Iterable, dynamic)? filterNodeMethod;
  bool accordion = false;
  double indent = 18;
  IconData? icon;
  bool lazy = false;
  bool draggable = false;
  bool Function(dynamic)? allowDrag;
  int level = 0;
  Function(dynamic, dynamic, DropType)? allowDrop;
}

class WTreeOn extends BaseOn {
  Function(dynamic, WNodeData, dynamic)? nodeClick;
  Function(dynamic, dynamic, dynamic)? nodeRightClick;
  Function(dynamic, dynamic, dynamic, dynamic)? nodeContextmenu;
  Function(dynamic, dynamic, dynamic)? checkChange;
  Function(dynamic, dynamic)? check;
  Function(dynamic, dynamic)? currentChange;
  Function(dynamic, dynamic, dynamic)? nodeExpand;
  Function(dynamic, dynamic, dynamic)? nodeCollapse;
  Function(dynamic, dynamic)? nodeDragStart;
  Function(dynamic, dynamic, dynamic)? nodeDragEnter;
  Function(dynamic, dynamic, dynamic)? nodeDragLeave;
  Function(dynamic, dynamic, dynamic)? nodeDragOver;
  Function(dynamic, dynamic, dynamic, dynamic)? nodeDragEnd;
  Function(dynamic, dynamic, dynamic, dynamic)? nodeDrop;
}

class WTreeSlot extends BaseSlot {
  WTreeSlot(defaultSlotBefore) : super(defaultSlotBefore);
}

class WTreeStyle extends BaseStyle {
  @override
  WTreeStyle newInstance() {
    return WTreeStyle();
  }
}

class WNodeProps extends BaseProp with ModelDriveProp {
  String id;
  String label;
  String pid;
  String icon;
  String isExpand;
  String children;
  String data;
  String parent;
  String isLeaf;
  WNodeProps({
    this.id = 'id',
    this.label = 'label',
    this.pid = 'pid',
    this.icon = 'icon',
    this.isExpand = 'isExpand',
    this.children = 'children',
    this.data = 'data',
    this.parent = 'parent',
    this.isLeaf = 'isLeaf',
  });
}

class WNodeData {
  dynamic id = '';
  String label = '';
  dynamic pid;
  bool isExpand = true;
  bool isLeaf = false;
  dynamic data;
  List<WNodeData> children = [];
  IconData? icon;
  WNodeData? current;
  WNodeData? parent;

  bool _loaded = false;

  WNodeData({
    required this.id,
    required this.label,
    this.children = const [],
    this.isExpand = true,
    this.isLeaf = false,
    this.icon,
  });

  Map<String, dynamic> toJson([WNodeProps? prop]) {
    Map<String, dynamic> json = {};
    json[prop?.id ?? 'id'] = id;
    json[prop?.label ?? 'label'] = label;
    json[prop?.pid ?? 'pid'] = pid;
    json[prop?.isExpand ?? 'isExpand'] = isExpand;
    json[prop?.children ?? 'children'] = children;
    json[prop?.data ?? 'data'] = data;
    json[prop?.isLeaf ?? 'isLeaf'] = isLeaf;
    json[prop?.parent ?? 'parent'] = parent;
    return json;
  }

  setCurrent(WNodeData node) {
    current = node;
    if (parent != null) {
      parent!.setCurrent(node);
    }
  }

  static List<WNodeData> listFromJson(Iterable<dynamic> data,
      [WNodeProps? prop]) {
    prop = prop ?? WNodeProps();
    List<WNodeData> result = [];
    for (var element in data) {
      result.add(WNodeData.fromJson(element, prop));
    }
    return result;
  }

  WNodeData.fromJson(dynamic json, WNodeProps prop) {
    id = json[prop.id] ?? '';
    label = json[prop.label] ?? '';
    isExpand = json[prop.isExpand] ?? true;
    icon = json[prop.icon];
    data = json[prop.data];
    parent = json[prop.parent];
    isLeaf = json[prop.isLeaf] ?? false;
    var children = json[prop.children] ?? [];
    children.forEach((child) {
      WNodeData node = WNodeData.fromJson(child, prop);
      node.parent = this;
      this.children.add(node);
    });
  }

  static WNodeData? findById(List<WNodeData> treeData, String id) {
    for (var node in treeData) {
      if (node.id == id) return node;
      if (node.children.isNotEmpty) {
        return findById(node.children, id);
      }
    }
  }

  @override
  String toString() {
    return '${toJson()}';
  }
}
