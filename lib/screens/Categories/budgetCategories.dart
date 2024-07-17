import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/Home/home_page.dart';
import 'package:myapp/screens/components/category_square.dart';
import 'package:myapp/screens/components/periodCategory.dart';
import 'package:myapp/controllers/budget_controller.dart'; // Importar BudgetController
// Importa la página ViewCategoriesPage

class BudgetCategories extends StatefulWidget {
  @override
  _BudgetCategoriesState createState() => _BudgetCategoriesState();
}

class _BudgetCategoriesState extends State<BudgetCategories> {
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;

  final BudgetController budgetController = Get.put(BudgetController());
  final ValueNotifier<int> monthNotifier =
      ValueNotifier<int>(DateTime.now().month); // Inicializar ValueNotifier

  @override
  void initState() {
    super.initState();
    monthNotifier.addListener(() {
      budgetController.fetchGroupedBudgets(
          month_id: monthNotifier
              .value); // Actualiza los presupuestos cuando cambie el mes
    });
    budgetController.fetchGroupedBudgets(
        month_id:
            monthNotifier.value); // Llama al controlador con el mes inicial
  }

  @override
  void dispose() {
    monthNotifier.dispose();
    super.dispose();
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
                    MaterialPageRoute(builder: (context) => HomePage()),
                  ).then((_) {
                    // Esto se ejecuta cuando volvemos de la página de edición
                    budgetController.fetchGroupedBudgets(
                        month_id: monthNotifier.value); // Refrescar datos
                  });
                },
              ),
            ],
          ),
          PeriodCategory(
              monthNotifier:
                  monthNotifier), // Pasar el ValueNotifier al PeriodCategory
          const SizedBox(height: 16),
          Flexible(
            child: Obx(() {
              if (budgetController.groupedBudgets.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: budgetController.groupedBudgets.length,
                  itemBuilder: (context, index) {
                    var entry = budgetController.groupedBudgets.entries
                        .elementAt(index);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CategorySquare(
                        tipo: entry.key,
                        categorias: entry.value,
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
