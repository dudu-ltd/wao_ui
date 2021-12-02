var tpl = `\`
import 'package:flutter/material.dart';
import 'package:wao_ui/core/base_on.dart';
import 'package:wao_ui/core/base_prop.dart';
import 'package:wao_ui/core/base_slot.dart';
import 'package:wao_ui/core/base_widget.dart';

class $\{name\} extends StatelessWidget
    implements BaseWidget<$\{name\}On, $\{name\}Prop, $\{name\}Slot> {
  @override
  late final $\{name\}On $on;

  @override
  late final $\{name\}Prop $props;

  @override
  late final $\{name\}Slot $slots;

  $\{name\}({Key? key, $\{name\}On? on, $\{name\}Prop? props, $\{name\}Slot? slots,})
      : super(key: key) {
    $on = on ?? $\{name\}On();
    $props = props ?? $\{name\}Prop();
    $slots = slots ?? $\{name\}Slot();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class $\{name\}On extends BaseOn {}

class $\{name\}Prop extends BaseProp {}

class $\{name\}Slot extends BaseSlot {}
\``

var cns = ['WAlert', 'WLoading', 'WMessage', 'WMessageBox', 'WNotification', 'WNavMenu', 'WTabs', 'WBreadcrumb', 'WPageHeader', 'WDropdown', 'WSteps', 'WDialog', 'WTooltip', 'WPopover', 'WPopconfirm', 'WCard', 'WCarousel', 'WCollapse', 'WTimeline', 'WDivider', 'WCalendar', 'WImage', 'WBacktop', 'WInfiniteScroll', 'WDrawer'];
var cns = ['WAvatar', 'WBadge', 'WDescriptions', 'WEmpty', 'WPagination', 'WProgress', 'WResult', 'WSkeleton', 'WTable', 'WTag', 'WTree' ,'WDatePicker', 'WDateTimePicker', 'WInputNumber', 'WInput', 'WRate', 'WSelect', 'WSlider', 'WSwitch', 'WTimePicker', 'WTransfer', 'WUpload' ];

var cns = ['WCascader', 'WCheckbox', 'WColorPicker', 'WRadio'];
cns.forEach(name => {
  console.info(eval(tpl));
})