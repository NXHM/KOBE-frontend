import 'package:flutter/material.dart';
import 'package:myapp/screens/Overview/overview_percentages_page.dart';
import 'package:myapp/screens/Overview/overview_values_page.dart';
import 'package:myapp/screens/Overview/period_selector.dart';

class overviewPage extends StatefulWidget {
  final bool? showPercentages;

  overviewPage({this.showPercentages});

  @override
  _overviewPageState createState() => _overviewPageState();
}

class _overviewPageState extends State<overviewPage> {
  final List<List<Map<String, dynamic>>> data = [
    [
      {"col1": "Sueldo", "col2": 736, "col3": 1400,},
      {"col1": "Dividendos", "col2": 37, "col3": 40,},
    ],
    [
      {"col1": "Comida", "col2": 130, "col3": 240,},
      {"col1": "Entretenimento", "col2": 37, "col3": 199,},
      {"col1": "Ropa", "col2": 51, "col3": 300,},
    ],
    [
      {"col1": "Departamento", "col2": 325, "col3": 800,},
    ],
  ];

  int day = 23;
  int month = 5;
  int year = 2024;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          PeriodSelector(day: day, month: month, year: year),
          const SizedBox(height: 16),
          widget.showPercentages == true ? 
            OverviewPercentagesPage(data: data) 
            : 
            OverviewValuesPage(month: month, year: year, data: data,)
        ],
      )
    );
  }

  
}
