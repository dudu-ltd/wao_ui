import 'package:example/demo/demos.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

registMaterialWidgetBasic(context) {
  const FlutterLogo logo = FlutterLogo();
  var aboutListTile = Demo(
    'aboutListTile',
    AboutListTile(
      applicationVersion: '0.1.2',
      applicationIcon: logo,
      applicationLegalese: 'I am the very model of a modern major general.',
      aboutBoxChildren: <Widget>[
        Text('About box'),
      ],
    ),
    r'''
    const FlutterLogo logo = FlutterLogo();

    AboutListTile(
      applicationVersion: '0.1.2',
      applicationIcon: logo,
      applicationLegalese: 'I am the very model of a modern major general.',
      aboutBoxChildren: <Widget>[
        Text('About box'),
      ],
    ),
    ''',
    'AboutListTile',
  );

  var animatedIcon = Demo(
    'animatedIcon',
    AnimatedIcon(
      progress: AlwaysStoppedAnimation<double>(0.0),
      icon: AnimatedIcons.menu_arrow,
    ),
    r'''
    AnimatedIcon(
      progress: AlwaysStoppedAnimation<double>(0.0),
      icon: AnimatedIcons.menu_arrow,
    ),
    ''',
    'AnimatedIcon',
  );

  var appBar = Demo(
    'appBar',
    AppBar(
      title: const Text('应用名'),
    ),
    r'''
    AppBar(
      title: const Text('应用名'),
    )
    ''',
    'AppBar（应用的头部位置）',
  );

  var materialApp = Demo(
    'materialApp',
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Container(
        height: 50,
        child: Text('body'),
      ),
      builder: (BuildContext context, Widget? child) {
        return AppBar();
      },
    ),
    r'''
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Placeholder(),
      builder: (BuildContext context, Widget? child) {
        return const Placeholder();
      },
    )
    ''',
  );

  var autocomplete = Demo(
    'autocomplete',
    Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return [
          'aardvark',
          'bobcat',
          'chameleon',
        ].where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
    ),
    r'''
    Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return [
          'aardvark',
          'bobcat',
          'chameleon',
        ].where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
    ),
    ''',
  );

  var materialBanner = Demo(
    'materialBanner',
    MaterialBanner(
      content: const Text('内容'),
      actions: <Widget>[
        TextButton(
          child: const Text('Action'),
          onPressed: () {},
        ),
      ],
    ),
    r'''
    MaterialBanner(
      content: const Text('内容'),
      actions: <Widget>[
        TextButton(
          child: const Text('Action'),
          onPressed: () {},
        ),
      ],
    ),
    ''',
    'MaterialBanner',
  );

  var bottomAppBar = Demo(
    'bottomAppBar',
    BottomAppBar(
      child: Row(children: [
        Expanded(
          child: Icon(Icons.message),
        ),
        Expanded(
          child: Icon(Icons.message),
        ),
        Expanded(
          child: Icon(Icons.message),
        ),
      ]),
    ),
    r'''
    BottomAppBar()
    ''',
  );

  var bottomNavigationBar = Demo(
    'bottomNavigationBar',
    BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit),
          label: 'AC',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_alarm),
          label: 'Alarm',
        ),
      ],
    ),
    r'''
    BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit),
          label: 'AC',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_alarm),
          label: 'Alarm',
        ),
      ],
    ),
    ''',
  );

  var bottomSheet = Demo(
    'bottomSheet',
    BottomSheet(
      onClosing: () {},
      builder: (_) => Container(
        height: 200,
        color: Colors.red,
        child: const Text('BottomSheet'),
      ),
    ),
    r'''
    BottomSheet(
      onClosing: () {},
      builder: (_) => Container(
        height: 200,
        color: Colors.red,
        child: const Text('BottomSheet'),
      ),
    ),
    ''',
  );

  var buttonBar = Demo(
    'buttonBar',
    ButtonBar(
      // buttonPadding set to zero to simplify test calculations.
      buttonPadding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(width: 100.0, height: 100.0),
        SizedBox(width: 100.0, height: 100.0),
        SizedBox(width: 100.0, height: 100.0),
      ],
    ),
    r'''
    ButtonBar(
      // buttonPadding set to zero to simplify test calculations.
      buttonPadding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(width: 100.0, height: 100.0),
        SizedBox(width: 100.0, height: 100.0),
        SizedBox(width: 100.0, height: 100.0),
      ],
    ),
    ''',
  );

  var calendarDatePicker = Demo(
    'calendarDatePicker',
    CalendarDatePicker(
      initialDate: DateTime(2016, DateTime.january, 15),
      firstDate: DateTime(2001),
      lastDate: DateTime(2031, DateTime.december, 31),
      onDateChanged: (DateTime date) {},
    ),
    r'''
    CalendarDatePicker(
      initialDate: DateTime(2016, DateTime.january, 15),
      firstDate: DateTime(2001),
      lastDate: DateTime(2031, DateTime.december, 31),
      onDateChanged: (DateTime date) {},
    ),
    ''',
  );

  var card = Demo(
    'card',
    Card(
      semanticContainer: false,
      child: Column(
        children: <Widget>[
          const Text('I am text!'),
          const Text('Moar text!!1'),
          MaterialButton(
            child: const Text('Button'),
            onPressed: () {},
          ),
        ],
      ),
    ),
    r'''
    Card(
      semanticContainer: false,
      child: Column(
        children: <Widget>[
          const Text('I am text!'),
          const Text('Moar text!!1'),
          MaterialButton(
            child: const Text('Button'),
            onPressed: () {},
          ),
        ],
      ),
    ),
    ''',
  );

  var checkboxListTile = Demo(
    'checkboxListTile',
    CheckboxListTile(
      value: true,
      onChanged: (bool? value) {},
      title: const Text('Hello'),
    ),
    r'''
    CheckboxListTile(
      value: true,
      onChanged: (bool? value) {},
      title: const Text('Hello'),
    ),
    ''',
  );

  var checkbox = Demo(
    'checkbox',
    Checkbox(
      value: true,
      onChanged: (bool? newValue) {},
    ),
    r'''
    Checkbox(
      value: true,
      onChanged: (bool? newValue) {},
    ),
    ''',
  );

  var actionChip = Demo(
    'actionChip',
    ActionChip(
      onPressed: () {},
      label: const Text('action chip'),
    ),
    r'''
    ActionChip(
      onPressed: () {},
      label: const Text('action chip'),
    ),
    ''',
  );

  var choiceChip = Demo(
    'choiceChip',
    ChoiceChip(
      label: Text('Chip A'),
      selected: true,
    ),
    r'''
    ChoiceChip(
      label: Text('Chip A'),
      selected: true,
    ),
    ''',
  );

  var filterChip = Demo(
    'filterChip',
    FilterChip(
      onSelected: (bool valueChanged) {},
      label: const Text('filter chip'),
    ),
    r'''
    FilterChip(
      onSelected: (bool valueChanged) {},
      label: const Text('filter chip'),
    ),
    ''',
  );

  var inputChip = Demo(
    'inputChip',
    InputChip(
      label: Text('input chip'),
    ),
    r'''
    InputChip(
      label: Text('input chip'),
    ),
    ''',
  );

  var chip = Demo(
    'chip',
    Chip(
      avatar: const CircleAvatar(child: Text('A')),
      label: const Text('Chip A'),
      onDeleted: () {},
    ),
    r'''
    Chip(
      avatar: const CircleAvatar(child: Text('A')),
      label: const Text('Chip A'),
      onDeleted: () {},
    ),
    ''',
  );

  var circleAvatar = Demo(
    'circleAvatar',
    CircleAvatar(
      radius: 50.0,
      child: const Text('Z'),
    ),
    r'''
    CircleAvatar(
      radius: 50.0,
      child: const Text('Z'),
    ),
    ''',
  );

  var dataTable = Demo(
    'dataTable',
    DataTable(
      onSelectAll: (bool? value) {},
      columns: <DataColumn>[
        const DataColumn(
          label: Text('Name'),
          tooltip: 'Name',
        ),
        DataColumn(
          label: const Text('Calories'),
          tooltip: 'Calories',
          numeric: true,
          onSort: (int columnIndex, bool ascending) {},
        ),
      ],
      rows: <DataRow>[],
    ),
    r'''
    DataTable(
      onSelectAll: (bool? value) {},
      columns: <DataColumn>[
        const DataColumn(
          label: Text('Name'),
          tooltip: 'Name',
        ),
        DataColumn(
          label: const Text('Calories'),
          tooltip: 'Calories',
          numeric: true,
          onSort: (int columnIndex, bool ascending) {},
        ),
      ],
      rows: <DataRow>[],
    ),
    ''',
  );

  var datePicker = Demo(
    'datePicker',
    ElevatedButton(
      onPressed: () {
        showDatePicker(
          context: Api.rootContext!,
          useRootNavigator: false,
          initialDate: DateTime.now(),
          firstDate: DateTime(2018),
          lastDate: DateTime(2030),
          builder: (BuildContext context, Widget? child) => const SizedBox(),
        );
      },
      child: const Text('Show Date Picker'),
    ),
    r'''
    ElevatedButton(
      onPressed: () {
        showDatePicker(
          context: Api.rootContext!,
          useRootNavigator: false,
          initialDate: DateTime.now(),
          firstDate: DateTime(2018),
          lastDate: DateTime(2030),
          builder: (BuildContext context, Widget? child) => const SizedBox(),
        );
      },
      child: const Text('Show Date Picker'),
    ),
    ''',
  );

  var dialog = Demo(
    'dialog',
    Dialog(
      child: Builder(
        builder: (BuildContext context) {
          return const Placeholder();
        },
      ),
    ),
    r'''
    Dialog(
      child: Builder(
        builder: (BuildContext context) {
          return const Placeholder();
        },
      ),
    ),
    ''',
  );
  var _showDialog = Demo(
    'showDialog',
    TextButton(
      child: Text('弹窗'),
      onPressed: () {
        showDialog<void>(
          context: Api.rootContext!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: Builder(
                builder: (BuildContext context) {
                  return const Placeholder();
                },
              ),
            );
          },
        );
      },
    ),
    r'''
    TextButton(
      child: Text('弹窗'),
      onPressed: () {
        showDialog<void>(
          context: Api.rootContext!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: Builder(
                builder: (BuildContext context) {
                  return const Placeholder();
                },
              ),
            );
          },
        );
      },
    ),
    ''',
  );

  var divide = Demo(
    'divide',
    Divider(
      thickness: 5.0,
    ),
    r'''
    Divider(
      thickness: 5.0,
    ),
    ''',
  );

  var drawer = Demo(
    'drawer',
    Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: const Text('header'),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.archive),
            title: Text('Archive'),
          ),
        ],
      ),
    ),
    r'''
    Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: const Text('header'),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.archive),
            title: Text('Archive'),
          ),
        ],
      ),
    ),
    ''',
  );
  int? value;
  var dropdownButtonFormField = Demo(
    'dropdownButtonFormField',
    DropdownButtonFormField<int?>(
      decoration: const InputDecoration(
        labelText: 'labelText',
      ),
      value: value,
      hint: const Text('Hint'),
      onChanged: (int? newValue) {
        value = newValue;
      },
      items: const <DropdownMenuItem<int?>>[
        DropdownMenuItem<int?>(
          value: 1,
          child: Text('One'),
        ),
        DropdownMenuItem<int?>(
          value: 2,
          child: Text('Two'),
        ),
        DropdownMenuItem<int?>(
          value: 3,
          child: Text('Three'),
        ),
      ],
    ),
    r'''
    DropdownButtonFormField<int?>(
      decoration: const InputDecoration(
        labelText: 'labelText',
      ),
      value: value,
      hint: const Text('Hint'),
      onChanged: (int? newValue) {
        value = newValue;
      },
      items: const <DropdownMenuItem<int?>>[
        DropdownMenuItem<int?>(
          value: 1,
          child: Text('One'),
        ),
        DropdownMenuItem<int?>(
          value: 2,
          child: Text('Two'),
        ),
        DropdownMenuItem<int?>(
          value: 3,
          child: Text('Three'),
        ),
      ],
    ),
    ''',
  );

  bool expanded = false;
  var expandIcon = Demo(
    'expandIcon',
    ExpandIcon(
      onPressed: (bool isExpanded) {
        expanded = !expanded;
      },
    ),
    r'''
    bool expanded = false;
    ExpandIcon(
      onPressed: (bool isExpanded) {
        expanded = !expanded;
      },
    ),
    ''',
  );

  late int capturedIndex;
  late bool capturedIsExpanded;
  var expansionPanelList = Demo(
    'expansionPanelList',
    ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        capturedIndex = index;
        capturedIsExpanded = isExpanded;
      },
      children: <ExpansionPanel>[
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Text(isExpanded ? 'B' : 'A');
          },
          body: const SizedBox(height: 100.0),
          isExpanded: true, // this is the addition
        ),
      ],
    ),
    r'''
    late int capturedIndex;
    late bool capturedIsExpanded;

    ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        capturedIndex = index;
        capturedIsExpanded = isExpanded;
      },
      children: <ExpansionPanel>[
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Text(isExpanded ? 'B' : 'A');
          },
          body: const SizedBox(height: 100.0),
          isExpanded: true, // this is the addition
        ),
      ],
    )
    ''',
  );

  var expansionTile = Demo(
    'expansionTile',
    const ExpansionTile(
      initiallyExpanded: true,
      title: Text('Expanded'),
      backgroundColor: Colors.red,
      children: <Widget>[
        ListTile(
          title: Text('0'),
        ),
      ],
    ),
    r'''
    const ExpansionTile(
      initiallyExpanded: true,
      title: Text('Expanded'),
      backgroundColor: Colors.red,
      children: <Widget>[
        ListTile(
          title: Text('0'),
        ),
      ],
    ),
    ''',
  );

  // var flexibleSpaceBar = Demo(
  //   'flexibleSpaceBar',
  //   FlexibleSpaceBar(
  //     title: Text('X'),
  //   ),
  //   r'''
  //   FlexibleSpaceBar(),
  //   ''',
  // );

  var flexibleSpaceBarCollapseModeNone = Demo(
    'flexibleSpaceBarCollapseModeNone',
    FlexibleSpaceBar(
      background: Container(),
      collapseMode: CollapseMode.none,
    ),
    r'''
    FlexibleSpaceBar(
      background: Container(),
      collapseMode: CollapseMode.none,
    ),
    ''',
  );

  var flexibleSpaceBarCollapseModePin = Demo(
    'flexibleSpaceBarCollapseModePin',
    FlexibleSpaceBar(
      background: Container(),
      collapseMode: CollapseMode.pin,
    ),
    r'''
    FlexibleSpaceBar(
      background: Container(),
      collapseMode: CollapseMode.pin,
    ),
    ''',
  );

  var flutterLogo = Demo(
    'flutterLogo',
    const FlutterLogo(),
    r'''
    const FlutterLogo(),
    ''',
  );

  var gridTile = Demo(
    'gridTile',
    SizedBox(
      height: 300,
      width: 400,
      child: GridTile(
        header: const GridTileBar(
          leading: Icon(Icons.thumb_up),
          title: Text('Header'),
          subtitle: Text('Subtitle'),
          trailing: Icon(Icons.thumb_up),
        ),
        footer: const GridTileBar(
          title: Text('Footer'),
          backgroundColor: Colors.black38,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.green[500],
          ),
        ),
      ),
    ),
    r'''
    GridTile(
      header: const GridTileBar(
        leading: Icon(Icons.thumb_up),
        title: Text('Header'),
        subtitle: Text('Subtitle'),
        trailing: Icon(Icons.thumb_up),
      ),
      footer: const GridTileBar(
        title: Text('Footer'),
        backgroundColor: Colors.black38,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.green[500],
        ),
      ),
    ),
    ''',
  );

  var ink = Demo(
    'ink',
    Center(
      child: Ink(
        height: 150.0,
        width: 200.0,
      ),
    ),
    r'''
    Center(
      child: Ink(
        height: 150.0,
        width: 200.0,
      ),
    ),
    ''',
  );

  var inkWell = Demo(
    'inkWell',
    InkWell(
      splashFactory: InkSparkle.splashFactory,
      child: const Text('Sparkle!'),
      onTap: () {},
    ),
    r'''
    InkWell(
      splashFactory: InkSparkle.splashFactory,
      child: const Text('Sparkle!'),
      onTap: () {},
    ),
    ''',
  );

  var inputDatePickerFormField = Demo(
    'inputDatePickerFormField',
    InputDatePickerFormField(
      initialDate: DateTime(2016, DateTime.january, 15),
      firstDate: DateTime(2001),
      lastDate: DateTime(2031, DateTime.december, 31),
    ),
    r'''
    InputDatePickerFormField(
      initialDate: DateTime(2016, DateTime.january, 15),
      firstDate: DateTime(2001),
      lastDate: DateTime(2031, DateTime.december, 31),
    ),
    ''',
  );

  var inputDecorator = Demo(
    'inputDecorator',
    Placeholder(),
    r'''
  InputDecorator(
                  expands: expands,
                  decoration: decoration,
                  isEmpty: isEmpty,
                  isFocused: isFocused,
                  isHovering: isHovering,
                  baseStyle: baseStyle,
                  textAlignVertical: textAlignVertical,
                  child: child,
                )
    ''',
  );

  var listTile = Demo(
    'listTile',
    ListTile(
      leading: SizedBox(width: 24.0, height: 24.0),
      title: const Text('title'),
      subtitle: Text('subtitle'),
      trailing: SizedBox(width: 24.0, height: 24.0),
    ),
    r'''
    ListTile(
      leading: SizedBox(width: 24.0, height: 24.0),
      title: const Text('title'),
      subtitle: Text('subtitle'),
      trailing: SizedBox(width: 24.0, height: 24.0),
    ),
    ''',
  );

  var mergeableMaterial = Demo(
    'mergeableMaterial',
    MergeableMaterial(),
    r'''
    MergeableMaterial(),
    ''',
  );

  const double elevation = 42.0;
  var navigationBar = Demo(
    'navigationBar',
    NavigationBar(
      elevation: elevation,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.ac_unit),
          label: 'AC',
        ),
        NavigationDestination(
          icon: Icon(Icons.access_alarm),
          label: 'Alarm',
        ),
      ],
      onDestinationSelected: (int i) {},
    ),
    r'''
    const double elevation = 42.0;

    NavigationBar(
      elevation: elevation,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.ac_unit),
          label: 'AC',
        ),
        NavigationDestination(
          icon: Icon(Icons.access_alarm),
          label: 'Alarm',
        ),
      ],
      onDestinationSelected: (int i) {},
    ),
    ''',
  );

  bool extended = false;
  var navigationRail = Demo(
    'navigationRail',
    SizedBox(
      height: 300,
      width: 400,
      child: NavigationRail(
        selectedIndex: 0,
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: Text('Abc'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.bookmark_border),
            selectedIcon: Icon(Icons.bookmark),
            label: Text('Def'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.star_border),
            selectedIcon: Icon(Icons.star),
            label: Text('Ghi'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.hotel),
            selectedIcon: Icon(Icons.home),
            label: Text('Jkl'),
          ),
        ],
        extended: extended,
      ),
    ),
    r'''
    bool extended = false;

    NavigationRail(
      selectedIndex: 0,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.favorite_border),
          selectedIcon: Icon(Icons.favorite),
          label: Text('Abc'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.bookmark_border),
          selectedIcon: Icon(Icons.bookmark),
          label: Text('Def'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.star_border),
          selectedIcon: Icon(Icons.star),
          label: Text('Ghi'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.hotel),
          selectedIcon: Icon(Icons.home),
          label: Text('Jkl'),
        ),
      ],
      extended: extended,
    ),
    ''',
  );

  // var tabPageSelector = Demo(
  //   'tabPageSelector',
  //   TabPageSelector(),
  //   r'''
  //   TabPageSelector(),
  //   ''',
  // );

  final TestDataSource source = TestDataSource();
  var paginatedDataTable = Demo(
    'paginatedDataTable',
    PaginatedDataTable(
      header: const Text('Test table'),
      source: source,
      rowsPerPage: 2,
      showFirstLastButtons: true,
      availableRowsPerPage: const <int>[
        2,
        4,
        8,
        16,
      ],
      onRowsPerPageChanged: (int? rowsPerPage) {
        // log.add('rows-per-page-changed: $rowsPerPage');
      },
      onPageChanged: (int rowIndex) {
        // log.add('page-changed: $rowIndex');
      },
      columns: const <DataColumn>[
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Calories'), numeric: true),
        DataColumn(label: Text('Generation')),
      ],
    ),
    r'''
    final TestDataSource source = TestDataSource();

    PaginatedDataTable(
      header: const Text('Test table'),
      source: source,
      rowsPerPage: 2,
      showFirstLastButtons: true,
      availableRowsPerPage: const <int>[
        2,
        4,
        8,
        16,
      ],
      onRowsPerPageChanged: (int? rowsPerPage) {
        // log.add('rows-per-page-changed: $rowsPerPage');
      },
      onPageChanged: (int rowIndex) {
        // log.add('page-changed: $rowIndex');
      },
      columns: const <DataColumn>[
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Calories'), numeric: true),
        DataColumn(label: Text('Generation')),
      ],
    ),
    ''',
  );

  var popupMenu = Demo(
    'popupMenu',
    PopupMenuButton<int>(
      onSelected: (int value) {
        Navigator.pushNamed(context, '/next');
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuItem<int>>[
          const PopupMenuItem<int>(
            value: 1,
            child: Text('One'),
          ),
        ];
      },
    ),
    r'''
    PopupMenuButton<int>(
      onSelected: (int value) {
        Navigator.pushNamed(context, '/next');
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuItem<int>>[
          const PopupMenuItem<int>(
            value: 1,
            child: Text('One'),
          ),
        ];
      },
    ),
    ''',
  );

  var progressIndicator = Demo(
    'progressIndicator',
    LinearProgressIndicator(value: .3),
    r'''
    LinearProgressIndicator(value: .3)
    ''',
  );

  final List<int> values = <int>[0, 1, 2];
  int? selectedValue;
  var radioListTile = Demo(
    'radioListTile',
    StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Scaffold(
          body: ListView.builder(
            itemCount: values.length,
            itemBuilder: (BuildContext context, int index) =>
                RadioListTile<int>(
              onChanged: (int? value) {
                setState(() {
                  selectedValue = value;
                });
              },
              value: values[index],
              groupValue: selectedValue,
              title: Text(values[index].toString()),
            ),
          ),
        );
      },
    ),
    r'''
    final List<int> values = <int>[0, 1, 2];
    int? selectedValue;

    StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Scaffold(
          body: ListView.builder(
            itemCount: values.length,
            itemBuilder: (BuildContext context, int index) =>
                RadioListTile<int>(
              onChanged: (int? value) {
                setState(() {
                  selectedValue = value;
                });
              },
              value: values[index],
              groupValue: selectedValue,
              title: Text(values[index].toString()),
            ),
          ),
        );
      },
    ),
    ''',
  );

  var radio = Demo(
    'radio',
    Radio<int>(
      value: 1,
      groupValue: 2,
      onChanged: (v) {
        debugPrint('on changed');
      },
    ),
    r'''
   Radio<int>(
          key: key,
          value: 1,
          groupValue: 2,
          onChanged: log.add,
        )
    ''',
  );

  RangeValues values2 = const RangeValues(0.3, 0.7);
  var rangeSlider = Demo(
    'rangeSlider',
    StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Material(
          child: Center(
            child: RangeSlider(
              values: values2,
              onChanged: (RangeValues newValues) {
                setState(() {
                  values2 = newValues;
                });
              },
            ),
          ),
        );
      },
    ),
    r'''
    RangeValues values2 = const RangeValues(0.3, 0.7);
    
    StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Material(
          child: Center(
            child: RangeSlider(
              values: values2,
              onChanged: (RangeValues newValues) {
                setState(() {
                  values2 = newValues;
                });
              },
            ),
          ),
        );
      },
    ),
    ''',
  );

  bool refreshCalled = false;

  var refreshIndicator = Demo(
    'refreshIndicator',
    RefreshIndicator(
      notificationPredicate: (ScrollNotification notification) =>
          notification.depth == 1,
      onRefresh: () {
        refreshCalled = true;
        return Future<void>.value();
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 600.0,
          height: 200.0,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: <String>['A', 'B', 'C', 'D', 'E', 'F']
                .map<Widget>((String item) {
              return SizedBox(
                height: 50.0,
                child: Text(item),
              );
            }).toList(),
          ),
        ),
      ),
    ),
    r'''
    bool refreshCalled = false;

    RefreshIndicator(
      notificationPredicate: (ScrollNotification notification) =>
          notification.depth == 1,
      onRefresh: () {
        refreshCalled = true;
        return Future<void>.value();
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 600.0,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: <String>['A', 'B', 'C', 'D', 'E', 'F']
                .map<Widget>((String item) {
              return SizedBox(
                height: 200.0,
                child: Text(item),
              );
            }).toList(),
          ),
        ),
      ),
    ),
    ''',
  );

  const List<String> originalListItems = <String>[
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4'
  ];
  const double itemHeight = 48.0;
  late List<String> listItems;
  listItems = originalListItems.toList();
  var reorderableList = Demo(
    'reorderableList',
    SizedBox(
      height: 280,
      child: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final String element = listItems.removeAt(oldIndex);
          listItems.insert(newIndex, element);
        },
        children: listItems.map<Widget>((String listItem) {
          return SizedBox(
            key: Key(listItem),
            height: itemHeight,
            width: itemHeight,
            child: Text(listItem),
          );
        }).toList(),
      ),
    ),
    r'''
    const List<String> originalListItems = <String>[
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4'
    ];
    const double itemHeight = 48.0;
    late List<String> listItems;
    listItems = originalListItems.toList();
    
    ReorderableListView(
      onReorder: (int oldIndex, int newIndex) {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final String element = listItems.removeAt(oldIndex);
        listItems.insert(newIndex, element);
      },
      children: listItems.map<Widget>((String listItem) {
        return SizedBox(
          key: Key(listItem),
          height: itemHeight,
          width: itemHeight,
          child: Text(listItem),
        );
      }).toList(),
    ),
    ''',
  );

  var scrollbar = Demo(
    'scrollbar',
    SizedBox(
      height: 200,
      width: 400,
      child: Scrollbar(
        child: ListView(
          children: const <Widget>[SizedBox(width: 40, height: 240)],
        ),
      ),
    ),
    r'''
    Scrollbar(
      child: ListView(
        children: const <Widget>[SizedBox(width: 40, height: 40)],
      ),
    ),
    ''',
  );

  var _showSearch = Demo(
    'showSearch',
    TextButton(
      child: Text('搜索'),
      onPressed: () {
        showSearch(context: context, delegate: _TestSearchDelegate());
      },
    ),
    r'''
  TextButton(child: Text('搜索'), onPressed: () {
    showSearch(context: context, delegate: )
  },)
    ''',
  );

  final Key sliderKey = UniqueKey();
  double sliderValue = 0.0;
  double? startValue;
  double? endValue;
  var slider = Demo(
    'slider',
    StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Material(
          child: Center(
            child: Slider(
              key: sliderKey,
              value: sliderValue,
              onChanged: (double sliderNewValue) {
                setState(() {
                  sliderValue = sliderNewValue;
                });
              },
              onChangeStart: (double value) {
                startValue = value;
              },
              onChangeEnd: (double value) {
                endValue = value;
              },
            ),
          ),
        );
      },
    ),
    r'''
    StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Material(
          child: Center(
            child: Slider(
              key: sliderKey,
              value: value,
              onChanged: (double newValue) {
                setState(() {
                  value = newValue;
                });
              },
              onChangeStart: (double value) {
                startValue = value;
              },
              onChangeEnd: (double value) {
                endValue = value;
              },
            ),
          ),
        );
      },
    ),
    ''',
  );

  var snackBarCount = 0;
  var snackBar = Demo(
    'snackBar',
    TextButton(
      child: Text('展示SnapBar'),
      onPressed: () {
        snackBarCount += 1;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('bar$snackBarCount'),
          duration: const Duration(seconds: 2),
        ));
      },
    ),
    r'''
    var snackBarCount = 0;

    TextButton(
      child: Text('展示SnapBar'),
      onPressed: () {
        snackBarCount += 1;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('bar$snackBarCount'),
          duration: const Duration(seconds: 2),
        ));
      },
    ),
    ''',
  );

  int stepperIndex = 0;
  var stepper = Demo(
    'stepper',
    Material(
      child: Stepper(
        onStepTapped: (int i) {
          stepperIndex = i;
        },
        steps: const <Step>[
          Step(
            title: Text('Step 1'),
            content: SizedBox(
              width: 100.0,
              height: 100.0,
            ),
          ),
          Step(
            title: Text('Step 2'),
            content: SizedBox(
              width: 100.0,
              height: 100.0,
            ),
          ),
        ],
      ),
    ),
    r'''
    int stepperIndex = 0;

    Material(
      child: Stepper(
        onStepTapped: (int i) {
          stepperIndex = i;
        },
        steps: const <Step>[
          Step(
            title: Text('Step 1'),
            content: SizedBox(
              width: 100.0,
              height: 100.0,
            ),
          ),
          Step(
            title: Text('Step 2'),
            content: SizedBox(
              width: 100.0,
              height: 100.0,
            ),
          ),
        ],
      ),
    ),
    ''',
  );

  var switchListTile = Demo(
    'switchListTile',
    Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SwitchListTile(
          value: true,
          onChanged: (bool value) {},
          title: const Text('AAA'),
          secondary: const Text('aaa'),
        ),
        CheckboxListTile(
          value: true,
          onChanged: (bool? value) {},
          title: const Text('BBB'),
          secondary: const Text('bbb'),
        ),
        RadioListTile<bool>(
          value: true,
          groupValue: false,
          onChanged: (bool? value) {},
          title: const Text('CCC'),
          secondary: const Text('ccc'),
        ),
      ],
    ),
    r'''
    Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SwitchListTile(
          value: true,
          onChanged: (bool value) {},
          title: const Text('AAA'),
          secondary: const Text('aaa'),
        ),
        CheckboxListTile(
          value: true,
          onChanged: (bool? value) {},
          title: const Text('BBB'),
          secondary: const Text('bbb'),
        ),
        RadioListTile<bool>(
          value: true,
          groupValue: false,
          onChanged: (bool? value) {},
          title: const Text('CCC'),
          secondary: const Text('ccc'),
        ),
      ],
    ),
    ''',
  );

  final Key switchKey = UniqueKey();
  bool swatchValue = false;
  var swatch = Demo(
    'swatch',
    StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Material(
          child: Center(
            child: Switch(
              dragStartBehavior: DragStartBehavior.down,
              key: switchKey,
              value: swatchValue,
              onChanged: (bool newValue) {
                setState(() {
                  swatchValue = newValue;
                });
              },
            ),
          ),
        );
      },
    ),
    r'''
    final Key switchKey = UniqueKey();
    bool swatchValue = false;
    
    StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Material(
          child: Center(
            child: Switch(
              dragStartBehavior: DragStartBehavior.down,
              key: switchKey,
              value: swatchValue,
              onChanged: (bool newValue) {
                setState(() {
                  swatchValue = newValue;
                });
              },
            ),
          ),
        );
      },
    ),
    ''',
  );

  var tabbedScrollview = Demo(
    'tabbedScrollview',
    TabDemo(),
    r'''

class TabDemo extends StatefulWidget {
  TabDemo({Key? key}) : super(key: key);

  @override
  State<TabDemo> createState() => _TabDemoState();
}

class TabHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 50.0;

  @override
  double get maxExtent => 150.0;

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      const Placeholder(color: Colors.teal);

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class _TabDemoState extends State<TabDemo> with TickerProviderStateMixin {
  static const int tabCount = 3;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabCount, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.orange,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 400,
            width: 300,
            child: TabBarView(
              controller: tabController,
              children: List<Widget>.generate(tabCount, (int index) {
                return CustomScrollView(
                  // The bug only occurs when this key is included
                  key: ValueKey<String>('Page $index'),
                  slivers: <Widget>[
                    SliverPersistentHeader(
                      delegate: TabHeaderDelegate(),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          SizedBox(
            width: 300,
            height: 60,
            child: AppBar(
              bottom: TabBar(
                controller: tabController,
                tabs: List<Widget>.generate(
                    tabCount, (int index) => Tab(text: 'Tab $index')).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
    ''',
  );

  var textButton = Demo(
    'textButton',
    TextButton(
      child: const Text('按钮'),
      onPressed: () {},
    ),
    r'''
    TextButton(
      child: const Text('按钮'),
      onPressed: () {},
    ),
    ''',
    'TextButton',
  );

  var elevatedButton = Demo(
    'elevatedButton',
    ElevatedButton(
      child: const Text('按钮'),
      onPressed: () {},
    ),
    r'''
    ElevatedButton(
      child: const Text('按钮'),
      onPressed: () {},
    ),
    ''',
    'ElevatedButton',
  );

  var outlinedButton = Demo(
    'outlinedButton',
    OutlinedButton(
      child: const Text('按钮'),
      onPressed: () {},
    ),
    r'''
    OutlinedButton(
      child: const Text('按钮'),
      onPressed: () {},
    ),
    ''',
    'OutlinedButton',
  );

  var iconButton = Demo(
    'iconButton',
    IconButton(
      icon: const Icon(
        Icons.edit,
        color: Colors.blue,
      ),
      onPressed: () {},
    ),
    r'''
    IconButton(
      icon: const Icon(
        Icons.edit,
        color: Colors.blue,
      ),
      onPressed: () {},
    ),
    ''',
    'IconButton',
  );

  var floatingActionButton = Demo(
    'floatingActionButton',
    FloatingActionButton(
      mini: true,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
        size: 18,
      ),
      onPressed: () {},
    ),
    r'''
    FloatingActionButton(
      mini: true,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
        size: 18,
      ),
      onPressed: () {},
    ),
    ''',
    'FloatingActionButton',
  );

  var rawMaterialButton = Demo(
    'rawMaterialButton',
    RawMaterialButton(
      child: const Text('按钮'),
      onPressed: () {},
    ),
    r'''
    RawMaterialButton(
      child: const Text('按钮'),
      onPressed: () {},
    ),
    ''',
    'RawMaterialButton',
  );

  var textSelectionToolbarTextButton = Demo(
    'textSelectionToolbarTextButton',
    TextSelectionToolbarTextButton(
      padding: TextSelectionToolbarTextButton.getPadding(1, 3),
      child: const Text('button'),
    ),
    r'''
    TextSelectionToolbarTextButton(
      padding: 
        TextSelectionToolbarTextButton.getPadding(1, 3),
      child: const Text('button'),
    ),
    ''',
    'TextSelectionToolbarTextButton',
  );
  var materialButton = Demo(
    'materialButton',
    MaterialButton(
      child: const Text('按钮'),
      onPressed: () {},
    ),
    r'''
    MaterialButton(
      child: const Text('按钮'),
      onPressed: () { },
    )
    ''',
    'MaterialButton',
  );
}

class TestDataSource extends DataTableSource {
  TestDataSource({
    this.allowSelection = false,
  });

  final bool allowSelection;

  int get generation => _generation;
  int _generation = 0;
  set generation(int value) {
    if (_generation == value) return;
    _generation = value;
    notifyListeners();
  }

  final Set<int> _selectedRows = <int>{};

  void _handleSelected(int index, bool? selected) {
    if (selected ?? false) {
      _selectedRows.add(index);
    } else {
      _selectedRows.remove(index);
    }
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    final Dessert dessert = kDesserts[index % kDesserts.length];
    final int page = index ~/ kDesserts.length;
    return DataRow.byIndex(
      index: index,
      selected: _selectedRows.contains(index),
      cells: <DataCell>[
        DataCell(Text('${dessert.name} ($page)')),
        DataCell(Text('${dessert.calories}')),
        DataCell(Text('$generation')),
      ],
      onSelectChanged: allowSelection
          ? (bool? selected) => _handleSelected(index, selected)
          : null,
    );
  }

  @override
  int get rowCount => 50 * kDesserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedRows.length;
}

class Dessert {
  Dessert(this.name, this.calories, this.fat, this.carbs, this.protein,
      this.sodium, this.calcium, this.iron);

  final String name;
  final int calories;
  final double fat;
  final int carbs;
  final double protein;
  final int sodium;
  final int calcium;
  final int iron;
}

final List<Dessert> kDesserts = <Dessert>[
  Dessert('Frozen yogurt', 159, 6.0, 24, 4.0, 87, 14, 1),
  Dessert('Ice cream sandwich', 237, 9.0, 37, 4.3, 129, 8, 1),
  Dessert('Eclair', 262, 16.0, 24, 6.0, 337, 6, 7),
  Dessert('Cupcake', 305, 3.7, 67, 4.3, 413, 3, 8),
  Dessert('Gingerbread', 356, 16.0, 49, 3.9, 327, 7, 16),
  Dessert('Jelly bean', 375, 0.0, 94, 0.0, 50, 0, 0),
  Dessert('Lollipop', 392, 0.2, 98, 0.0, 38, 0, 2),
  Dessert('Honeycomb', 408, 3.2, 87, 6.5, 562, 0, 45),
  Dessert('Donut', 452, 25.0, 51, 4.9, 326, 2, 22),
  Dessert('KitKat', 518, 26.0, 65, 7.0, 54, 12, 6),
];

class _TestSearchDelegate extends SearchDelegate<String> {
  _TestSearchDelegate({
    this.suggestions = 'Suggestions',
    this.result = 'Result',
    this.actions = const <Widget>[],
    this.defaultAppBarTheme = false,
    super.searchFieldDecorationTheme,
    super.searchFieldStyle,
    String? searchHint,
    super.textInputAction,
  }) : super(
          searchFieldLabel: searchHint,
        );

  final bool defaultAppBarTheme;
  final String suggestions;
  final String result;
  final List<Widget> actions;
  static const Color hintTextColor = Colors.green;

  @override
  ThemeData appBarTheme(BuildContext context) {
    if (defaultAppBarTheme) {
      return super.appBarTheme(context);
    }
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: searchFieldStyle ??
                const TextStyle(
                  color: hintTextColor,
                ),
          ),
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, result);
      },
    );
  }

  final List<String> queriesForSuggestions = <String>[];
  final List<String> queriesForResults = <String>[];

  @override
  Widget buildSuggestions(BuildContext context) {
    queriesForSuggestions.add(query);
    return MaterialButton(
      onPressed: () {
        showResults(context);
      },
      child: Text(suggestions),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    queriesForResults.add(query);
    return const Text('Results');
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return actions;
  }

  @override
  PreferredSizeWidget buildBottom(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56.0),
      child: Text('Bottom'),
    );
  }
}

class TabDemo extends StatefulWidget {
  TabDemo({Key? key}) : super(key: key);

  @override
  State<TabDemo> createState() => _TabDemoState();
}

class TabHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 50.0;

  @override
  double get maxExtent => 150.0;

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      const Placeholder(color: Colors.teal);

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class _TabDemoState extends State<TabDemo> with TickerProviderStateMixin {
  static const int tabCount = 3;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabCount, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey.shade100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 300,
            height: 60,
            child: AppBar(
              bottom: TabBar(
                controller: tabController,
                tabs: List<Widget>.generate(
                    tabCount, (int index) => Tab(text: 'Tab $index')).toList(),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            width: 300,
            child: TabBarView(
              controller: tabController,
              children: List<Widget>.generate(tabCount, (int index) {
                return const CustomScrollView();
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
