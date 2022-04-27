import 'package:flutter/material.dart';
import 'package:wao_ui/core/utils/wrapper.dart';
import 'package:wao_ui/src/form/w_input.dart';
import 'package:wao_ui/wao_ui.dart';

class ApiInput extends StatelessWidget {
  const ApiInput({Key? key}) : super(key: key);

  Widget get basic {
    return WInput(
      props: WInputProp(placeholder: '请输入内容'),
    );
  }

  Widget get disable {
    return WInput(
      props: WInputProp(
        placeholder: '请输入内容',
        disabled: true,
      ),
    );
  }

  Widget get clearable {
    return WInput(
      props: WInputProp(
        placeholder: '请输入内容',
        clearable: true,
      ),
    );
  }

  Widget get password {
    return WInput(
      props: WInputProp(
        placeholder: '请输入内容',
        showPassword: true,
        clearable: true,
        suffixIcon: Icons.person_rounded,
      ),
    );
  }

  Widget get icon {
    return Column(
      children: [
        Row(
          children: [
            const Text('属性方式'),
            WInput(
              props: WInputProp(
                placeholder: '请输入内容',
                suffixIcon: Icons.calendar_today_rounded,
              ),
            ),
            WInput(
              props: WInputProp(
                placeholder: '请输入内容',
                prefixIcon: Icons.search_rounded,
              ),
            )
          ],
        ),
        Row(
          children: [
            const Text('slot方式'),
            WInput(
              props: WInputProp(
                placeholder: '请输入内容',
              ),
              slots: WInputSlot(null, suffix: Icons.calendar_today_rounded),
            ),
            WInput(
              props: WInputProp(
                placeholder: '请输入内容',
              ),
              slots: WInputSlot(
                null,
                prefix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.search_rounded),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget get textarea {
    return WInput(
      props: WInputProp(
        type: 'textarea',
        rows: 2,
        placeholder: '请输入内容',
      ),
    );
  }

  Widget get fitTextLength {
    return Column(
      children: [
        WInput(
          props: WInputProp(
            type: 'textarea',
            autosize: true,
            placeholder: '请输入内容',
          ),
        ),
        WInput(
          props: WInputProp(
            type: 'textarea',
            autosize: {'minRows': 2, 'maxRows': 4},
            placeholder: '请输入内容',
          ),
        ),
      ],
    );
  }

  Widget get slotInput {
    return Column(
      children: [
        WInput(
          props: WInputProp(
            placeholder: '请输入内容',
          ),
          slots: WInputSlot(
            null,
            prepend: const Text(
              '  http://  ',
            ),
          ),
        ),
        WInput(
          props: WInputProp(
            placeholder: '请输入内容',
          ),
          slots: WInputSlot(null, append: const Text(' .com  ')),
        ),
        WInput(
          props: WInputProp(
            placeholder: '请输入内容',
          ),
          /* 
            <el-select v-model="select" slot="prepend" placeholder="请选择">
              <el-option label="餐厅名" value="1"></el-option>
              <el-option label="订单号" value="2"></el-option>
              <el-option label="用户电话" value="3"></el-option>
            </el-select>
            <el-button slot="append" icon="el-icon-search"></el-button>
          */
          slots: WInputSlot(
            // WSelect(
            //   props: WSelectProp(placeholder: '请选择'),
            //   // TODO 待 WSelect 开发完时回来补充。
            //   slots: WSelectSlot([
            //     WOption(),
            //   ]),
            // ),
            null,
            append: const Icon(Icons.expand_more_rounded),
          ),
        ),
      ],
    );
  }

  Widget get size {
    return Row(
      children: [
        WInput(
          props: WInputProp(
            placeholder: '请输入内容',
            suffixIcon: Icons.calendar_today_rounded,
          ),
        ),
        WInput(
          props: WInputProp(
            placeholder: '请输入内容',
            suffixIcon: Icons.calendar_today_rounded,
            size: 'medium',
          ),
        ),
        WInput(
          props: WInputProp(
            placeholder: '请输入内容',
            suffixIcon: Icons.calendar_today_rounded,
            size: 'small',
          ),
        ),
        WInput(
          props: WInputProp(
            placeholder: '请输入内容',
            suffixIcon: Icons.calendar_today_rounded,
            size: 'mini',
          ),
        ),
      ],
    );
  }

  Widget get autocomplete {
    return Row(
      children: [
        Column(
          children: [
            const Text('激活即列出输入建议'),
            WAutocomplete(
              props: WAutocompleteProp(
                placeholder: '请输入内容',
                value: '',
                fetchSuggestions: (q, fn) {},
              ),
              on: WAutocompleteOn(
                select: () {},
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Text('输入后匹配输入建议'),
            WAutocomplete(
              props: WAutocompleteProp(
                placeholder: '请输入内容',
                value: '',
                fetchSuggestions: (q, fn) {},
                triggerOnFocus: false,
              ),
              on: WAutocompleteOn(
                select: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  // TODO
  Widget get customTpl {
    return WInput();
  }

  // TODO
  Widget get searchRemote {
    return WInput();
  }

  Widget get lengthLimit {
    return Column(
      children: [
        WInput(
          props: WInputProp(
            type: 'text',
            placeholder: '请输入内容',
            model: '',
            maxlength: 10,
            showWordLimit: true,
          ),
        ),
        WInput(
          props: WInputProp(
            type: 'textarea',
            placeholder: '请输入内容',
            model: '',
            maxlength: 30,
            showWordLimit: true,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('WInput'),
          paddingWrapper(const Text('基本用法'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          basic,
          paddingWrapper(const Text('禁用状态'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          disable,
          paddingWrapper(const Text('可清空'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          clearable,
          paddingWrapper(const Text('密码框'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          password,
          paddingWrapper(const Text('带 icon 的输入框'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          icon,
          paddingWrapper(const Text('文本域'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          textarea,
          paddingWrapper(const Text('可自适应文本高度的文本域'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          fitTextLength,
          paddingWrapper(const Text('复合型输入框'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          slotInput,
          paddingWrapper(const Text('尺寸'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          size,
          paddingWrapper(const Text('带输入建议 // TODO'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          autocomplete,
          paddingWrapper(const Text('自定义模板 // TODO'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          customTpl,
          paddingWrapper(const Text('远程搜索 // TODO'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          searchRemote,
          paddingWrapper(const Text('输入长度限制'),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
          lengthLimit,
        ]),
      ],
    );
  }
}
