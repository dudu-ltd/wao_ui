// Copyright 2021 All wao_ui authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:wao_ui/wao_ui.dart';

class _WTreeState extends WState<WTree> {
  WNodeData? currentNode;

  @override
  void initState() {
    super.initState();
    var wp = widget.$props;
    if (wp.data.isNotEmpty && wp.treeData.isEmpty) {
      wp.treeData = WNodeData.listFromJson(wp.data, wp.props);
    }
  }

  @override
  Widget wbuild(BuildContext context) {
    var cols = <Widget>[];
    for (var node in widget.$props.treeData) {
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
                        padding: EdgeInsets.fromLTRB(
                            (widget.$props.level + 1) * 10.0, 0, 0, 0),
                        child: Icon(
                            node.children.isEmpty
                                ? node.icon
                                : node.isExpand
                                    ? Icons.keyboard_arrow_down
                                    : Icons.keyboard_arrow_right,
                            color: _getSelectedNodeColor(node, context)),
                      ),
                      Text(
                        node.label,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: _getSelectedNodeColor(node, context)),
                      )
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

  void changeExpand(node) {
    setState(() {
      currentNode = node;
      node.isExpand = !node.isExpand;
    });
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
  Function(dynamic, dynamic)? load;
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
  Function(dynamic, dynamic, dynamic)? nodeClick;
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
  late String id;
  late String label;
  late String pid;
  late String isExpand;
  late String children;
  WNodeProps({
    this.id = 'id',
    this.label = 'label',
    this.pid = 'pid',
    this.isExpand = 'isExpand',
    this.children = 'children',
  });
}

class WNodeData {
  dynamic id = '';
  String label = '';
  dynamic pid;
  String content = '';
  bool isExpand = true;
  IconData? icon;
  dynamic data;
  WNodeData? current;
  WNodeData? parent;
  List<WNodeData> children = [];

  WNodeData(
      {required this.id, required this.label, children, isExpand, this.icon})
      : children = children ?? [],
        isExpand = isExpand ?? true;

  Map<String, dynamic> toJson([WNodeProps? prop]) {
    Map<String, dynamic> json = {};
    json[prop?.id ?? 'id'] = int.parse(id);
    json[prop?.label ?? 'label'] = label;
    json[prop?.pid ?? 'pid'] = pid;
    json[prop?.isExpand ?? 'isExpand'] = isExpand;
    json[prop?.children ?? 'children'] = children;
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
    icon = json['icon'];
    content = json['content'] ?? '';
    data = null;
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
}
