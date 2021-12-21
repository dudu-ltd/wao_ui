import 'package:flutter/material.dart';
import 'package:wao_ui/src/data/w_result.dart';
import 'package:wao_ui/src/basic/w_button.dart';

class ApiResult extends StatelessWidget {
  const ApiResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('WResult'),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: success),
          Expanded(child: warning),
          Expanded(child: error),
          Expanded(child: info),
        ],
      ),
    ]);
  }

  Widget get success {
    return WResult(
      props: WResultProp(icon: 'success', title: '提示', subTitle: '请根据提示进行操作'),
      slots: WResultSlot(
        null,
        extra: SizedBox(
          width: 80,
          child: WButton(
            slots: WButtonSlot('返回'),
            props: WButtonProp(type: 'primary'),
          ),
        ),
      ),
    );
  }

  Widget get warning {
    return WResult(
      props: WResultProp(icon: 'warning', title: '提示', subTitle: '请根据提示进行操作'),
      slots: WResultSlot(
        null,
        extra: SizedBox(
          width: 80,
          child: WButton(
            slots: WButtonSlot('返回'),
            props: WButtonProp(type: 'primary'),
          ),
        ),
      ),
    );
  }

  Widget get error {
    return WResult(
      props: WResultProp(
          icon: 'error',
          title: '提示',
          subTitle:
              '请根据提示进行操作请根据提示进行操作请根据提示进行操作请根据提示进行操作请根据提示进行操作请根据提示进行操作请根据提示进行操作请根据提示进行操作请根据提示进行操作'),
      slots: WResultSlot(
        null,
        extra: SizedBox(
          width: 80,
          child: WButton(
            slots: WButtonSlot('返回'),
            props: WButtonProp(type: 'primary'),
          ),
        ),
      ),
    );
  }

  Widget get info {
    return WResult(
      props: WResultProp(icon: 'info', title: '提示', subTitle: '请根据提'),
      slots: WResultSlot(
        null,
        extra: SizedBox(
          width: 80,
          child: WButton(
            slots: WButtonSlot('返回'),
            props: WButtonProp(type: 'primary'),
          ),
        ),
      ),
    );
  }
}
