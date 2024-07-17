/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'category_controller.dart';
import 'package:myapp/screens/Overview/components/period_selector.dart';
import '../../entities/Category.dart';

class EditCategoryPage extends StatefulWidget {
  final Category categoria;

  EditCategoryPage({required this.categoria});

  @override
  _EditCategoryPageState createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;

  final CategoryController _controller = Get.put(CategoryController());
  final _formKey = GlobalKey<FormState>();
  late String _selectedTipo;
  late String _nombreCategoria;
  late double _presupuesto;

  @override
  void initState() {
    super.initState();

    _nombreCategoria = widget.categoria.name;
  }

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
              PeriodSelector(
                day: day,
                month: month,
                year: year,
                showPercentages: true,
                changeMonth: changeMonth,
                changeYear: changeYear,
              ),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tipo de Movimiento'),
                        const SizedBox(height: 5),
                        DropdownButtonFormField<String>(
                          value: _selectedTipo,
                          onChanged: null, // Disable changes
                          items: ['Ingreso', 'Gasto', 'Ahorro']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
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
                          initialValue: _nombreCategoria,
                          decoration: InputDecoration(
                            hintText: 'Ej. Transporte',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (value) {
                            _nombreCategoria = value;
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
                          initialValue: _presupuesto.toString(),
                          decoration: InputDecoration(
                            hintText: 'Ej. 100',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            _presupuesto = double.tryParse(value) ?? 0;
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
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Editar la categoría existente
                    var tipo = _controller.types
                        .firstWhere((tipo) => tipo.name == _selectedTipo);
                    /*var editedCategory = Categoria(
                        id: widget.categoria.id, name: _nombreCategoria);
                    _controller.updateCategory(editedCategory);*/

                    Navigator.pop(context);
                  }
                },
                child: Text('Listo', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 20, 60),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                      horizontal: 64, vertical: 16), // Agrandar el botón
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
*/