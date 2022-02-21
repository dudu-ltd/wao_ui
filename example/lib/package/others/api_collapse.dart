import 'package:flutter/material.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/src/others/w_collapse.dart';
import 'package:wao_ui/wao_ui.dart';

class ApiCollapse extends StatelessWidget {
  const ApiCollapse({Key? key}) : super(key: key);

/*
<el-collapse v-model="activeNames" @change="handleChange">
  <el-collapse-item title="一致性 Consistency" name="1">
    <div>与现实生活一致：与现实生活的流程、逻辑保持一致，遵循用户习惯的语言和概念；</div>
    <div>在界面中一致：所有的元素和结构需保持一致，比如：设计样式、图标和文本、元素的位置等。</div>
  </el-collapse-item>
  <el-collapse-item title="反馈 Feedback" name="2">
    <div>控制反馈：通过界面样式和交互动效让用户可以清晰的感知自己的操作；</div>
    <div>页面反馈：操作后，通过页面元素的变化清晰地展现当前状态。</div>
  </el-collapse-item>
  <el-collapse-item title="效率 Efficiency" name="3">
    <div>简化流程：设计简洁直观的操作流程；</div>
    <div>清晰明确：语言表达清晰且表意明确，让用户快速理解进而作出决策；</div>
    <div>帮助用户识别：界面简单直白，让用户快速识别而非回忆，减少用户记忆负担。</div>
  </el-collapse-item>
  <el-collapse-item title="可控 Controllability" name="4">
    <div>用户决策：根据场景可给予用户操作建议或安全提示，但不能代替用户进行决策；</div>
    <div>结果可控：用户可以自由的进行操作，包括撤销、回退和终止当前操作等。</div>
  </el-collapse-item>
</el-collapse>
 */

  List<Widget> get inner {
    return [
      WCollapseItem(
        props: WCollapseItemProp(
          title: '一致性 Consistency',
          name: 1,
        ),
        slots: WCollapseItemSlot([
          const Text('现实生活一致：与现实生活的流程、逻辑保持一致，遵循用户习惯的语言和概念；'),
          const Text('在界面中一致：所有的元素和结构需保持一致，比如：设计样式、图标和文本、元素的位置等。'),
        ]),
      ),
      WCollapseItem(
        props: WCollapseItemProp(
          title: '反馈 Feedback',
          name: 2,
        ),
        slots: WCollapseItemSlot([
          const Text('控制反馈：通过界面样式和交互动效让用户可以清晰的感知自己的操作；'),
          const Text('页面反馈：操作后，通过页面元素的变化清晰地展现当前状态。'),
        ]),
      ),
      WCollapseItem(
        props: WCollapseItemProp(
          title: '效率 Efficiency',
          name: 3,
        ),
        slots: WCollapseItemSlot([
          const Text('简化流程：设计简洁直观的操作流程；'),
          const Text('清晰明确：语言表达清晰且表意明确，让用户快速理解进而作出决策；'),
          const Text('帮助用户识别：界面简单直白，让用户快速识别而非回忆，减少用户记忆负担。'),
        ]),
      ),
      WCollapseItem(
        props: WCollapseItemProp(
          title: '可控 Controllability',
          name: 4,
        ),
        slots: WCollapseItemSlot([
          const Text('用户决策：根据场景可给予用户操作建议或安全提示，但不能代替用户进行决策；'),
          const Text('结果可控：用户可以自由的进行操作，包括撤销、回退和终止当前操作等。'),
        ]),
      ),
    ];
  }

  Widget get basic {
    var activeNames = [1];
    return WCollapse(
      on: WCollapseOn(change: (e) {
        print(e);
      }),
      props: WCollapseProp(
        value: activeNames,
      ),
      slots: WCollapseSlot(inner),
    );
  }

  Widget get accordion {
    var activeNames = 1;
    return WCollapse(
      on: WCollapseOn(change: (e) {
        print(e);
      }),
      props: WCollapseProp(
        value: activeNames,
        accordion: true,
      ),
      slots: WCollapseSlot(inner),
    );
  }

  Widget get custom {
    var activeNames = 1;
    return WCollapse(
      on: WCollapseOn(change: (e) {
        print(e);
      }),
      props: WCollapseProp(
        value: activeNames,
        accordion: true,
      ),
      slots: WCollapseSlot([
        WCollapseItem(
          props: WCollapseItemProp(
            title: '一致性 Consistency',
            name: 1,
          ),
          slots: WCollapseItemSlot([
            const Text('现实生活一致：与现实生活的流程、逻辑保持一致，遵循用户习惯的语言和概念；'),
            const Text('在界面中一致：所有的元素和结构需保持一致，比如：设计样式、图标和文本、元素的位置等。'),
          ], title: (data) {
            return Row(
              children: const [
                Text('一致性 Consistency'),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.info, size: 13),
                ),
              ],
            );
          }),
        ),
        ...(inner.sublist(1))
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('WCollapse'),
          ____________________________________,
          const Text('基本用法'),
          ____________________________________,
          borderWrapper(
            basic,
            Border.all(color: Colors.grey.shade200),
            true,
            margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),
          const Text('手风琴效果'),
          ____________________________________,
          borderWrapper(
            accordion,
            Border.all(color: Colors.grey.shade200),
            true,
            margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),
          ____________________________________,
          const Text('自定义'),
          ____________________________________,
          borderWrapper(
            custom,
            Border.all(color: Colors.grey.shade200),
            true,
            margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),
        ],
      ),
    );
  }

  final Widget ____________________________________ = const SizedBox(
    height: 10,
    width: 1,
  );
}
