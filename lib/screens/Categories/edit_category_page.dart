import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/budget_controller.dart';
import 'package:myapp/screens/components/periodCategory.dart';
import 'package:myapp/screens/components/budgetEditForm.dart';

class EditCategoryPage extends StatefulWidget {
  final Map<String, dynamic> categoria;

  EditCategoryPage({required this.categoria});

  @override
  _EditCategoryPageState createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
  final ValueNotifier<int> monthNotifier =
      ValueNotifier<int>(DateTime.now().month);
  final ValueNotifier<int> yearNotifier =
      ValueNotifier<int>(DateTime.now().year);
  final BudgetController budgetController = Get.put(BudgetController());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _fetchBudget();
    monthNotifier.addListener(_fetchBudget);
    yearNotifier.addListener(_fetchBudget);
  }

  void _fetchBudget() {
    budgetController.fetchBudget(
      categoryId: widget.categoria['id'],
      monthId: monthNotifier.value,
      year: yearNotifier.value,
    );
  }

  @override
  void dispose() {
    monthNotifier.removeListener(_fetchBudget);
    yearNotifier.removeListener(_fetchBudget);
    monthNotifier.dispose();
    yearNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Editar Categoría',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PeriodCategory(
                monthNotifier: monthNotifier,
                yearNotifier: yearNotifier,
              ),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BudgetEditForm(
                    category: widget.categoria,
                    formKey: _formKey,
                    budgetController: budgetController,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    budgetController
                        .updateBudget(
                            id: budgetController.idBudget.value,
                            amount: budgetController.presupuesto.value)
                        .then((_) {
                      Navigator.pop(context, true);
                    }).catchError((error) {
                      print("Error updating budget: $error");
                      Get.snackbar('Error', 'Failed to update budget');
                    });
                  }
                },
                child: Text('Guardar Cambios', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 20, 60),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
