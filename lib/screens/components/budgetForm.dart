import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/budget_controller.dart';
import 'package:myapp/controllers/category_controller.dart';
import 'package:myapp/controllers/type_controller.dart';
import 'package:myapp/entities/Type.dart';

class BudgetForm extends StatefulWidget {
  final ValueNotifier<int> typeNotifier; // Añadir ValueNotifier
  final GlobalKey<FormState> formKey;
  BudgetForm({
    required this.typeNotifier,
    required this.formKey,
  });

  @override
  State<BudgetForm> createState() => _BudgetFormState();
}

class _BudgetFormState extends State<BudgetForm> {
  final BudgetController budgetController = Get.put(BudgetController());
  final TypeController typeController = Get.put(TypeController());
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tipo de Movimiento'),
          const SizedBox(height: 5),
          Obx(() {
            return DropdownButton<int>(
              value: typeController.id_selected.value,
              items: typeController.types.map((Type type) {
                return DropdownMenuItem<int>(
                  value: type.id,
                  child: Text(type.name),
                );
              }).toList(),
              onChanged: (int? newType) {
                typeController.id_selected.value = newType!;
                widget.typeNotifier.value = newType;
              },
            );
          }),
          const SizedBox(height: 10),
          Text('Nombre de Categoría'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Ej. Transporte',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (value) {
              categoryController.name_category.value = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese el nombre de la categoría';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Text('Presupuesto (mensual)'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Ej. 100',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              budgetController.presupuesto.value = double.tryParse(value) ?? 0;
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
          ),
        ],
      ),
    );
  }
}
