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
    $slots = slots ?? $\{name\}Slot(null);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class $\{name\}On extends BaseOn {}

class $\{name\}Prop extends BaseProp {}

class $\{name\}Slot extends BaseSlot {
  
  $\{name\}Slot(defaultSlotBefore) : super(defaultSlotBefore);
}
\``

var apiTpl = `\`
import 'package:flutter/material.dart';
import 'package:wao_ui/src/$\{k\}/$\{toLine(name).substr(1)\}.dart';

class Api$\{name.substr(1)\} extends StatelessWidget {
  const Api$\{name.substr(1)\}({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('$\{name\}'),
      $\{name\}(),
    ]);
  }
}
\``

var cns = [];
var tree = {
  basic: [
    'WButton', 
    'WContainerLayout',
    'WFrame',
  ],
  data: [
    'WAvatar', 
    'WBadge', 
    'WDescriptions', 
    'WDescriptionsItem', 
    'WEmpty', 
    'WPagination', 
    'WProgress', 
    'WResult', 
    'WSkeleton', 
    'WTable', 
    'WTableColumn', 
    'WTag', 
    'WTree'
  ],
  form: [
    'WCascader', 
    'WCheckbox', 
    'WColorPicker',
    'WDatePicker', 
    'WDateTimePicker', 
    'WInputNumber', 
    'WInput', 
    'WRadio',
    'WRadioGroup',
    'WRadioButton',
    'WRate',
    'WSelect', 
    'WSlider', 
    'WSwitch', 
    'WTimePicker',
    'WTransfer', 
    'WUpload'
  ],
  navigation: [
    'WBreadcrumb', 
    'WBreadcrumbItem', 
    'WDropdown', 
    'WDropdownMenu', 
    'WDropdownItem', 
    'WNavMenu',
    'WPageHeader', 
    'WSteps', 
    'WTabs'
  ],
  notice: [
    'WAlert', 
    'WLoading',
    'WMessage', 
    'WMessageBox', 
    'WNotification', 
  ],
  others: [
    'WBacktop', 
    'WCalendar', 
    'WCard', 
    'WCarousel', 
    'WCollapse', 
    'WDialog', 
    'WDivider', 
    'WDrawer',
    'WImage', 
    'WInfiniteScroll',
    'WPopconfirm',
    'WPopover', 
    'WTimeline', 
    'WTooltip', 
  ],
}
function toLine(name) {
  return name.replace(/([A-Z])/g,"_$1").toLowerCase();
}

function createBaseClass() {
  Object.keys(tree).map(k => {
    let cns = tree[k]
    cns.forEach(name => {
      console.info(`${toLine(name).substr(1)}.dart`)
      console.info(eval(tpl));
    })
  })
}


function createNavTree() {
  let t = []
  Object.keys(tree).map(k => {
    let cns = tree[k]
    let c = {
      id: k,
      text: k,
      children: []
    }
    t.push(c)
    cns.forEach(name => {
      c.children.push({
        id: name,
        text: name,
      })
    })
  })
  console.info( JSON.stringify(t) )
}

function createApiFile() {
  Object.keys(tree).map(k => {
    let cns = tree[k]
    cns.forEach(name => {
      console.info(`api${toLine(name).substr(2)}.dart`)
      console.info(eval(apiTpl));
    })
  })
}

function createApiImport() {
  let imp = []
  Object.keys(tree).map(k => {
    let cns = tree[k]
    cns.forEach(name => {
      imp.push(`import 'package:example/package/${k}/api${toLine(name).substr(2)}.dart';`)
    })
  })
  console.info(imp.join('\n'))
}

function createRoute() {
  let route = []
  Object.keys(tree).map(k => {
    let cns = tree[k]
    cns.forEach(name => {
      route.push(`'${name}': Api${name.substr(1)}(),`)
    })
  })
  console.info(route.join('\n'))
}


function createExport() {
  let exp = []
  Object.keys(tree).map(k => {
    let cns = tree[k]
    cns.forEach(name => {
      exp.push(`export \'src/${k}/${toLine(name).substr(1)}.dart\';`)
    })
  })
  console.info(exp.join('\n'))
}

createBaseClass();
// createRoute()
// createExport()
