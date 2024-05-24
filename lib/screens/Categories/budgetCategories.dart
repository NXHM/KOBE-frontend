import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/Categories/category_controller.dart';
import 'package:myapp/screens/Overview/components/period_selector.dart';
import 'package:myapp/screens/components/category_square.dart';
import 'viewCategories.dart'; // Importa la página ViewCategoriesPage

class BudgetCategories extends StatefulWidget {
  @override
  _BudgetCategoriesState createState() => _BudgetCategoriesState();
}

class _BudgetCategoriesState extends State<BudgetCategories> {
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;

  final CategoryController controller = Get.put(CategoryController());

  void changeMonth(int m) {
    setState(() {
      month = m;
    });
  }

  void changeYear(int y) {
    setState(() {
      year = y;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categorías de Presupuesto',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewCategoriesPage()),
                  ).then((_) {
                    // Esto se ejecuta cuando volvemos de la página de edición
                    setState(() {});
                  });
                },
              ),
            ],
          ),
          PeriodSelector(
            day: day,
            month: month,
            year: year,
            showPercentages: true,
            changeMonth: changeMonth,
            changeYear: changeYear,
          ),
          const SizedBox(height: 16),
          Flexible(
            child: Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.types.length,
                itemBuilder: (context, index) {
                  var type = controller.types[index];
                  var categories = controller.categories
                      .where((categoria) => categoria.tipo.id == type.id)
                      .toList();
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CategorySquare(tipo: type, categorias: categories),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
