import 'package:wao_ui/wao_ui.dart';

import '../demos.dart';

regist() {
  var processBasic = Demo(
    'processBasic',
    WProgress(props: WProgressProp(percentage: 50)),
    r'''
  WProgress(props: WProgressProp(percentage: 50))
    ''',
  );
}
