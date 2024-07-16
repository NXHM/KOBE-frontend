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
  OverviewController controller = Get.put(OverviewController());
  int currentDay = DateTime.now().day;
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  List<List<Map<String, dynamic>>> budgetData = [[], [], []];

  @override
  void initState() {
    super.initState();
    controller.fetchMovimientosYPresupuestos(selectedYear, selectedMonth);
    print(controller.data);
  }

  void changeMonth(int newMonth) {
    setState(() {
      selectedMonth = newMonth;
      controller.fetchMovimientosYPresupuestos(selectedYear, selectedMonth);
      print(controller.data);
    });
  }

  void changeYear(int newYear) {
    setState(() {
      selectedYear = newYear;
      controller.fetchMovimientosYPresupuestos(selectedYear, selectedMonth);
      print(controller.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    List<List<Map<String, dynamic>>> data = controller.data;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(child: 
        Column(
          children: [
            PeriodSelector(day: currentDay, month: selectedMonth, year: selectedYear, showPercentages: widget.showPercentages, changeMonth: changeMonth, changeYear: changeYear),
            const SizedBox(height: 16),
            widget.showPercentages == true ? 
              OverviewPercentagesPage(data: data,) 
              : 
              OverviewValuesPage(data: data,)
          ],
        ),
      )
    );
  }
}
