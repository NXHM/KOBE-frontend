import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/Categories/viewCategories.dart';
import 'package:myapp/screens/components/category_square.dart';
import 'package:myapp/screens/components/periodCategory.dart';
import 'package:myapp/controllers/budget_controller.dart'; // Importar BudgetController

class BudgetCategories extends StatefulWidget {
  @override
  _BudgetCategoriesState createState() => _BudgetCategoriesState();
}

class _BudgetCategoriesState extends State<BudgetCategories> {
  final BudgetController budgetController = Get.put(BudgetController());
  final ValueNotifier<int> monthNotifier =
      ValueNotifier<int>(DateTime.now().month); // Inicializar ValueNotifier
  final ValueNotifier<int> yearNotifier =
      ValueNotifier<int>(DateTime.now().year);

  @override
  void initState() {
    super.initState();
    monthNotifier.addListener(_fetchGroupedBudgets);
    yearNotifier.addListener(_fetchGroupedBudgets);
    _fetchGroupedBudgets(); // Llama al controlador con el mes inicial
  }

  void _fetchGroupedBudgets() {
    budgetController.fetchGroupedBudgets(
      monthId: monthNotifier.value,
      year: yearNotifier.value,
    );
  }

  @override
  void dispose() {
    monthNotifier.removeListener(_fetchGroupedBudgets);
    yearNotifier.removeListener(_fetchGroupedBudgets);
    monthNotifier.dispose();
    yearNotifier.dispose();
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
                    MaterialPageRoute(
                        builder: (context) => ViewCategoriesPage()),
                  ).then((_) {
                    // Esto se ejecuta cuando volvemos de la página de edición
                    _fetchGroupedBudgets(); // Refrescar datos
                  });
                },
              ),
            ],
          ),
          PeriodCategory(
            monthNotifier: monthNotifier,
            yearNotifier: yearNotifier,
          ), // Pasar el ValueNotifier al PeriodCategory
          const SizedBox(height: 16),
          Flexible(
            child: Obx(() {
              if (budgetController.groupedBudgets.isEmpty) {
                return Center(child: Text("Is Empty"));
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
