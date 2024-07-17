/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'category_controller.dart';
import '../../entities/Categoria.dart';
import 'package:myapp/screens/Overview/components/period_selector.dart';

class CreateCategoryPage extends StatefulWidget {
  @override
  _CreateCategoryPageState createState() => _CreateCategoryPageState();
}

class _CreateCategoryPageState extends State<CreateCategoryPage> {
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;

  final CategoryController _controller = Get.put(CategoryController());
  final _formKey = GlobalKey<FormState>();
  String _selectedTipo = 'Ingreso';
  String _nombreCategoria = '';
  double _presupuesto = 0;

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
                          onChanged: (newValue) {
                            setState(() {
                              _selectedTipo = newValue!;
                            });
                          },
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
              const SizedBox(
                  height: 20), // Añadir espacio entre el formulario y el botón
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Crear la nueva categoría y agregarla a la lista
                      var tipo = _controller.types
                          .firstWhere((tipo) => tipo.name == _selectedTipo);
                      /*var newCategory = Categoria(
                        id: DateTime.now().millisecondsSinceEpoch,
                        name: _nombreCategoria,
                        tipo: tipo,
                        presupuesto: _presupuesto,
                      );
                      _controller.addCategory(newCategory);
*/
                      Navigator.pop(context);
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
*/