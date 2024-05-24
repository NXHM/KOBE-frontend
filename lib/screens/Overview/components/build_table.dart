import 'package:flutter/material.dart';

class buildTable extends StatelessWidget {
  final List <Map<String, dynamic>> data;

  const buildTable({ 
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle boldStyle = const TextStyle(fontWeight: FontWeight.bold,);

    return DataTable(
      columns: [
        const DataColumn(label: Text("")),
        DataColumn(label: Center(
          child: Text("Real", style: boldStyle,)
        )),
        DataColumn(label: Center(
          child: Text("Planeado", style: boldStyle,)
        )),
      ],
      rows: data.map((item) {
        return DataRow(
          cells: [
            DataCell(Text(item["col1"].toString().substring(0, item["col1"].toString().length > 8 ? 10 : null)), ),
            DataCell(Center( child: Text(item["real"].toString(), style: boldStyle, textAlign: TextAlign.center,))),
            DataCell(Center( child: Text(item["planeado"].toString(), style: boldStyle, textAlign: TextAlign.center,))),
          ]
        );
      }).toList(),
      showBottomBorder: false,
      showCheckboxColumn: false,
    );
  }
}