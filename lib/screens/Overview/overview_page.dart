import 'package:flutter/material.dart';
import 'package:myapp/screens/Overview/overview_percentages_page.dart';
import 'package:myapp/screens/Overview/overview_values_page.dart';
import 'package:myapp/screens/Overview/components/period_selector.dart';

class overviewPage extends StatefulWidget {
  final bool? showPercentages;

  overviewPage({this.showPercentages});

  @override
  _overviewPageState createState() => _overviewPageState();
}

class _overviewPageState extends State<overviewPage> {
  final List<List<Map<String, dynamic>>> data = [
    [
      {"col1": "Sueldo", "real": 736, "planeado": 1400,},
      {"col1": "Dividendos", "real": 37, "planeado": 40,},
    ],
    [
      {"col1": "Comida", "real": 130, "planeado": 240,},
      {"col1": "Entretenimento", "real": 37, "planeado": 199,},
      {"col1": "Ropa", "real": 51, "planeado": 300,},
    ],
    [
      {"col1": "Departamento", "real": 325, "planeado": 800,},
    ],
  ];
  

  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;

  void changeMonth(int m){ 
    setState(() {
      month = m;
    });
  }

  void changeYear(int y){ 
    setState(() {
      year = y;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          PeriodSelector(day: day, month: month, year: year, showPercentages: widget.showPercentages, changeMonth: changeMonth, changeYear: changeYear),
          const SizedBox(height: 16),
          widget.showPercentages == true ? 
            OverviewPercentagesPage(data: data,) 
            : 
            OverviewValuesPage(month: month, year: year, data: data,)
        ],
      )
    );
  }

  
}
