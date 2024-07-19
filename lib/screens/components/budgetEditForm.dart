import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/budget_controller.dart';

class BudgetEditForm extends StatefulWidget {
  final Map<String, dynamic> category;
  final GlobalKey<FormState> formKey;
  final BudgetController budgetController;

  BudgetEditForm({
    required this.category,
    required this.formKey,
    required this.budgetController,
  });

  @override
  _BudgetEditFormState createState() => _BudgetEditFormState();
}

class _BudgetEditFormState extends State<BudgetEditForm> {
  late TextEditingController _budgetController;

  @override
  void initState() {
    super.initState();
    _budgetController = TextEditingController(
      text: widget.budgetController.presupuesto.value.toString(),
    );

    widget.budgetController.presupuesto.listen((value) {
      if (_budgetController.text != value.toString()) {
        _budgetController.value = TextEditingValue(
          text: value.toString(),
          selection: TextSelection.fromPosition(
            TextPosition(offset: value.toString().length),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _budgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tipo de Movimiento'),
          const SizedBox(height: 5),
          TextFormField(
            initialValue: widget.category['type_name'],
            enabled: false,
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
            initialValue: widget.category['name'],
            enabled: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text('Presupuesto (mensual)'),
          const SizedBox(height: 5),
          TextFormField(
            controller: _budgetController,
            decoration: InputDecoration(
              hintText: 'Ej. 100',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              widget.budgetController.presupuesto.value =
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
          ),
        ],
      ),
    );
  }
}
