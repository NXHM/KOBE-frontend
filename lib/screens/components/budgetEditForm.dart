import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/budget_controller.dart';

class BudgetEditForm extends StatelessWidget {
  final Map<String, dynamic> category;
  final GlobalKey<FormState> formKey;
  final BudgetController budgetController;

  BudgetEditForm({
    required this.category,
    required this.formKey,
    required this.budgetController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tipo de Movimiento'),
          const SizedBox(height: 5),
          TextFormField(
            initialValue: category['type_name'],
            enabled: false, // Campo deshabilitado
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text('Nombre de Categoría'),
          const SizedBox(height: 5),
          TextFormField(
            initialValue: category['name'],
            enabled: false, // Campo deshabilitado
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text('Presupuesto (mensual)'),
          const SizedBox(height: 5),
          Obx(() {
            return TextFormField(
              key: ValueKey(
                  budgetController.presupuesto.value), // Agrega esta línea
              initialValue: budgetController.presupuesto.value.toString(),
              decoration: InputDecoration(
                hintText: 'Ej. 100',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                budgetController.presupuesto.value =
                    double.tryParse(value) ?? 0;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el presupuesto';
                }
                if (double.tryParse(value) == null) {
                  return 'Por favor ingrese un número válido';
                }
                return null;
              },
            );
          }),
        ],
      ),
    );
  }
}
