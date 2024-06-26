import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/Overview/overview_controller.dart';
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
    OverviewController controller = Get.put(OverviewController());
    List<List<Map<String, dynamic>>> data = controller.data[month-1];

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
