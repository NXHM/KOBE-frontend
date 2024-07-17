import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/budget_controller.dart';
import 'package:myapp/controllers/category_controller.dart';
import 'package:myapp/controllers/type_controller.dart';
import 'package:myapp/controllers/month_controller.dart';
import 'package:myapp/screens/components/periodCategory.dart';
import 'package:myapp/screens/components/budgetForm.dart'; // Importa el nuevo componente
import '../../entities/Category.dart';

class CreateCategoryPage extends StatefulWidget {
  @override
  _CreateCategoryPageState createState() => _CreateCategoryPageState();
}

class _CreateCategoryPageState extends State<CreateCategoryPage> {
  final ValueNotifier<int> monthNotifier =
      ValueNotifier<int>(DateTime.now().month); // Inicializar ValueNotifier
  final ValueNotifier<int> yearNotifier =
      ValueNotifier<int>(DateTime.now().year);
  final ValueNotifier<int> typeNotifier = ValueNotifier<int>(1);
  final BudgetController budgetController = Get.put(BudgetController());
  final CategoryController categoryController = Get.put(CategoryController());
  final TypeController typeController = Get.put(TypeController());
  final MonthController monthController = Get.put(MonthController());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    monthNotifier.addListener(() {
      budgetController
          .fetchGroupedBudgets(); // Actualiza los presupuestos cuando cambie el mes
    });
    yearNotifier.addListener(() {
      budgetController
          .fetchGroupedBudgets(); // Actualiza los presupuestos cuando cambie el mes
    });
    typeNotifier.addListener(() {
      typeController.fetchTypes();
    });
    budgetController
        .fetchGroupedBudgets(); // Llama al controlador con el mes inicial
  }

  @override
  void dispose() {
    monthNotifier.dispose();
    typeNotifier.dispose();
    yearNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nueva Categoría',
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
                  child: BudgetForm(
                    typeNotifier: typeNotifier,
                    formKey: _formKey,
                  ), // Usa el nuevo componente
                ),
              ),
              const SizedBox(
                  height: 20), // Añadir espacio entre el formulario y el botón
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Crear la nueva categoría y agregarla a la lista
                      budgetController
                          .createBudget(
                              amount: budgetController.presupuesto.value,
                              year: monthController.year_selected.value,
                              month_id: monthController.id_selected.value,
                              category_name:
                                  categoryController.name_category.value,
                              type_id: typeController.id_selected.value)
                          .then((_) {
                        Navigator.pop(context,
                            true); // Indicar que se ha creado una nueva categoría
                      }).catchError((error) {
                        print("Error creating budget: $error");
                        Get.snackbar('Error', 'Failed to create budget');
                      });
                    }
                  },
                  child: Text('Listo', style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(
                        255, 0, 20, 60), // Cambiado a backgroundColor
                    foregroundColor: Colors.white, // Cambiado a foregroundColor
                    padding: EdgeInsets.symmetric(
                        horizontal: 64,
                        vertical: 16), // Aumentar tamaño del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
