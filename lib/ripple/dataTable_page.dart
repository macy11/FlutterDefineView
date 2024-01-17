import 'package:flutter/material.dart';

class DataTablePage extends StatefulWidget {
  const DataTablePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DataTablePageState();
  }
}

class _DataTablePageState extends State {
  List<User> data = [
    User('老孟0', 18),
    User('老孟1', 19, selected: true),
    User('老孟2', 20),
    User('老孟3', 21),
    User('老孟4', 22),
  ];

  var _sortAscending = true;


  @override
  void initState() {
    data = data.map((user) => User(user.name, user.age + 10, selected: user.selected)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: DataTable(
        sortColumnIndex: 1,
        sortAscending: _sortAscending,
        columns: [
          const DataColumn(label: Text('姓名')),
          DataColumn(
              label: const Text('年龄'),
              onSort: (int columnIndex, bool ascending) {
                setState(() {
                  _sortAscending = ascending;
                  if (ascending) {
                    data.sort((a, b) => a.age.compareTo(b.age));
                  } else {
                    data.sort((a, b) => b.age.compareTo(a.age));
                  }
                });
              }),
        ],
        rows: data.map((user) {
          return DataRow(
              cells: [
                DataCell(Text(user.name)),
                DataCell(Text('${user.age}')),
              ],
              selected: user.selected ?? false,
              onSelectChanged: (select) {
                setState(() {
                  user.selected = select;
                });
              });
        }).toList(),
      ),
    );
  }
}

class User {
  User(this.name, this.age, {this.selected = false});

  String name;
  int age;
  bool? selected;
}
