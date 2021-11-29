import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo'),
        ),
        body: Container(
          child: DataTable(
            columns: <DataColumn>[
              DataColumn(
                label: Text('Name'),
              ),
              DataColumn(
                label: Text('Value'),
              ),
            ],
            rows: elements.map(
                  (row) => DataRow(
                cells: [
                  DataCell(
                    Text(row.name),
                  ),
                  DataCell(
                    Text(row.value),
                    onTap: () {
                      print("${row.name} ${row.value}");
                    },
                  ),
                ],
              ),
            ).toList(),
          ),
        ),
      ),
    );
  }
}

class Element {
  String name;
  String value;

  Element({
    required this.name,
    required this.value,
  });
}

var elements = <Element>[
  Element(
    name: 'Row A',
    value: '250',
  ),
  Element(
    name: 'Row B',
    value: '100',
  ),
  Element(
    name: 'Row C',
    value: '150',
  ),
];