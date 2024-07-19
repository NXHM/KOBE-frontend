import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/overview_controller.dart';
import 'package:myapp/screens/Overview/overview_percentages_page.dart';
import 'package:myapp/screens/Overview/overview_values_page.dart';
import 'package:myapp/screens/Overview/components/period_selector.dart';

class overviewPage extends StatefulWidget {
  final bool showPercentages;
  final void Function(int) onPressed;

  overviewPage({required this.showPercentages, required this.onPressed});

  @override
  _overviewPageState createState() => _overviewPageState();
}

class _overviewPageState extends State<overviewPage> {
  OverviewController controller = Get.put(OverviewController());

  int currentDay = DateTime.now().day;
  final ValueNotifier<int> monthNotifier =
      ValueNotifier<int>(DateTime.now().month);
  final ValueNotifier<int> yearNotifier =
      ValueNotifier<int>(DateTime.now().year);

  List<List<Map<String, dynamic>>> budgetData = [[], [], []];

  @override
  void initState() {
    super.initState();
    yearNotifier.addListener(_fetchBudgetsMovements);
    monthNotifier.addListener(_fetchBudgetsMovements);
  }

  void _fetchBudgetsMovements() {
    controller.fetchMovimientosYPresupuestos(
        yearNotifier.value, monthNotifier.value);
    print(controller.data);
  }

  void dispose() {
    monthNotifier.removeListener(_fetchBudgetsMovements);
    yearNotifier.removeListener(_fetchBudgetsMovements);
    monthNotifier.dispose();
    yearNotifier.dispose();
    controller.fetchMovimientosYPresupuestos(
        DateTime.now().year, DateTime.now().month);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(controller.data);
    return Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PeriodSelector(
                  day: currentDay,
                  monthNotifier: monthNotifier,
                  yearNotifier: yearNotifier,
                  showPercentages: widget.showPercentages),
              const SizedBox(height: 16),
              Container(child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                      child: controller.data[0].isEmpty == true &&
                              controller.data[1].isEmpty == true &&
                              controller.data[2].isEmpty == true
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                Center(
                                  child: Text(
                                    "No tienes presupuestos. \nCrea uno",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      widget.onPressed(2);
                                    },
                                    child: Text('Crear Categoría'),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.black,
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )))
                              ],
                            )
                          : widget.showPercentages == true
                              ? OverviewPercentagesPage(
                                  data: controller.data,
                                )
                              : OverviewValuesPage(
                                  data: controller.data,
                                ));
                }
              }))
            ],
          ),
        ));
  }
}
