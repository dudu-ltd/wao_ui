import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class PlainTreeOn extends BaseOn {
  Function? nodeClick;
  Function? nodeRightClick;
  PlainTreeOn({
    this.nodeClick,
    this.nodeRightClick,
  }) : super();
}

class PlainTreeProp extends BaseProp {
  late List<Map<String, dynamic>> data;
  late List<TreeData> treeData;
  late int level;
  late String id = '';
  late String text = '';
  late String pid;
  late String isExpand;
  late String children = '';
  PlainTreeProp({data, level, id, text, pid, isExpand, children, treeData}) {
    this.data = data ?? [];
    this.level = level ?? 0;
    this.id = id ?? 'id';
    this.text = text ?? 'text';
    this.pid = text ?? 'pid';
    this.isExpand = isExpand ?? 'isExpand';
    this.children = children ?? 'children';
    if (treeData != null) {
      this.treeData = treeData;
    } else {
      this.treeData = TreeData.listFromJson(this);
    }
  }
}

class PlainTree extends StatefulWidget
    implements BaseWidget<PlainTreeOn, PlainTreeProp, BaseSlot> {
  _TreeState? state;
  PlainTree({Key? key, on, props})
      : this.$on = on ?? PlainTreeOn(),
        this.$props = props ?? PlainTreeProp(data: []),
        this.$slots = BaseSlot(),
        super(key: key);

  @override
  _TreeState createState() => state = _TreeState();

  addNode(Map<String, dynamic> node) {
    state!.addNode(node);
  }

  addNodes(List<Map<String, dynamic>> nodes) {
    state!.addNodes(nodes);
  }

  removeNode() {
    return state!.removeNode();
  }

  @override
  late PlainTreeOn $on;

  @override
  late PlainTreeProp $props;

  @override
  late BaseSlot $slots;
}

class _TreeState extends State<PlainTree> {
  TreeData? currentNode;

  void addNode(Map<String, dynamic> child) {
    setState(() {
      addNodeBackGround(child);
    });
  }

  void addNodeBackGround(Map<String, dynamic> child) {
    if (currentNode == null) {
      widget.$props.treeData.add(TreeData.fromJson(child, widget.$props));
    } else {
      currentNode!.children.add(TreeData.fromJson(child, widget.$props));
      child[widget.$props.pid] = currentNode!.id;
    }
  }

  void addNodes(List<Map<String, dynamic>> nodes) {
    setState(() {
      nodes.forEach((element) {
        addNodeBackGround(element);
      });
    });
  }

  TreeData removeNode() {
    setState(() {
      widget.$props.treeData.remove(currentNode);
    });
    return currentNode!;
  }

  GestureTapCallback getNodeClickProxy(ctx, TreeData node) {
    return widget.$on.nodeClick == null
        ? () => changeExpand(node)
        : () {
            changeExpand(node);
            if (node.children.length == 0) {
              widget.$on.nodeClick!.call(ctx, node)?.call();
            }
          };
  }

  void changeExpand(node) {
    setState(() {
      currentNode = node;
      node.isExpand = !node.isExpand;
    });
  }

  Color _getSelectedNodeColor(node, context) {
    return node == currentNode ? Theme.of(context).primaryColor : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    var cols = <Widget>[];
    widget.$props.treeData.forEach((TreeData node) {
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
                            node.children.length == 0
                                ? node.icon
                                : node.isExpand
                                    ? Icons.keyboard_arrow_down
                                    : Icons.keyboard_arrow_right,
                            color: _getSelectedNodeColor(node, context)),
                      ),
                      Text(
                        node.text,
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
      if (node.children.length > 0 && node.isExpand) {
        PlainTree tree = PlainTree(
          on: widget.$on,
          props: PlainTreeProp(
            treeData: node.children,
            level: widget.$props.level + 1,
          ),
        );
        cols.add(tree);
      }
    });

    return Column(
      children: cols,
    );
  }
}

class TreeData {
  String id = '';
  String text = '';
  String? pid;
  String content = '';
  bool isExpand = true;
  IconData? icon;
  dynamic data;
  TreeData? current;
  TreeData? parent;
  List<TreeData> children = [];

  TreeData(
      {required this.id, required this.text, children, isExpand, this.icon})
      : this.children = children ?? [],
        this.isExpand = isExpand ?? true;

  TreeData.fromJson(Map<String, dynamic> json, PlainTreeProp prop) {
    this.id = json[prop.id] ?? '';
    this.text = json[prop.text] ?? '';
    this.isExpand = json[prop.isExpand] ?? true;
    this.icon = json['icon'];
    this.content = json['content'] ?? '';
    this.data = null;
    var children = json[prop.children] ?? [];
    children.forEach((child) {
      TreeData node = TreeData.fromJson(child, prop);
      node.parent = this;
      this.children.add(node);
    });
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = int.parse(id);
    json['name'] = text;
    json['content'] = data;
    return json;
  }

  setCurrent(TreeData node) {
    this.current = node;
    if (this.parent != null) {
      this.parent!.setCurrent(node);
    }
  }

  static List<TreeData> listFromJson(PlainTreeProp prop) {
    return List.generate(
        prop.data.length, (index) => TreeData.fromJson(prop.data[index], prop));
  }
}

class TreeNodeClickNotification extends Notification {
  final TreeData treeData;
  TreeNodeClickNotification(this.treeData);
}
