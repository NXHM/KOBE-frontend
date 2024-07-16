import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/entities/Categoria.dart';
import 'package:myapp/entities/Tipo.dart';
import 'package:myapp/screens/Home/home_page.dart';
import 'historial_page.dart';
import 'editar_movimiento_controller.dart';
import '../../entities/Movimiento.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: EditarMovimientoPage(),
    );
  }
}

class EditarMovimientoPage extends StatefulWidget {
  @override
  _EditarMovimientoPageState createState() => _EditarMovimientoPageState();
}

class _EditarMovimientoPageState extends State<EditarMovimientoPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  Tipo? _selectedType;
  Categoria? _selectedCategory;
  double? _amount;
  String? _comment;

  EditarMovimientoController _controller =
      Get.put(EditarMovimientoController());

  @override
  void initState() {
    // TODO: implement initState
    _controller.getCategoria();
    super.initState();
  }

  @override
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
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          color: Colors.white,
          elevation: 2,
          margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Fecha'),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Ingrese la fecha',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: Color.fromARGB(255, 0, 20,
                                          60), // Color de los encabezados (barra superior)
                                      onPrimary: Colors
                                          .white, // Color del texto en los encabezados
                                      surface: Colors
                                          .white, // Color del fondo del calendario
                                      onSurface: Colors
                                          .black, // Color del texto en el calendario
                                    ),
                                    dialogBackgroundColor: Colors
                                        .white, // Color de fondo del cuadro de diálogo
                                  ),
                                  child: child!,
                                );
                              });
                          if (pickedDate != null) {
                            setState(() {
                              _selectedDate = pickedDate;
                            });
                          }
                        },
                      ),
                    ),
                    readOnly: true,
                    controller: TextEditingController(
                      text:
                          _selectedDate != null ? _selectedDate.toString() : '',
                    ),
                    validator: (value) {
                      if (_selectedDate == null) {
                        return 'Por favor seleccione una fecha';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Text('Tipo'),
                  SizedBox(height: 5),
                  Obx(() => DropdownButtonFormField<Tipo>(
                        decoration: InputDecoration(
                          hintText: 'Ingrese el tipo',
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        value: _controller.selectedTipo.value,
                        onChanged: (newValue) {
                          _controller.setSelectedTipo(newValue);
                          _selectedCategory =
                              null; // Reiniciar categoría al cambiar el tipo
                        },
                        items: _controller.tipos.map((Tipo tipo) {
                          return DropdownMenuItem<Tipo>(
                            value: tipo,
                            child: Text(tipo.name),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Por favor seleccione un tipo';
                          }
                          return null;
                        },
                      )),
                  SizedBox(height: 10),
                  Text('Categoría'),
                  SizedBox(height: 5),
                  Obx(() {
                    return DropdownButtonFormField<Categoria>(
                      decoration: InputDecoration(
                        hintText: 'Ingrese la categoría',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      value: _selectedCategory,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCategory = newValue;
                        });
                      },
                      items: _controller.categorias
                          .where((categoria) =>
                              categoria.tipo.id ==
                              _controller.selectedTipo.value?.id)
                          .map((Categoria categoria) {
                        return DropdownMenuItem<Categoria>(
                          value: categoria,
                          child: Text(categoria.name),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor seleccione una categoría';
                        }
                        return null;
                      },
                    );
                  }),
                  SizedBox(height: 10),
                  Text('Monto'),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Ingrese la cantidad',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      _amount = double.tryParse(value ?? '');
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese una cantidad';
                      }
                      return null;
                    },
                  ), // Añadir espacio adicional aquí
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              bottom: 20), // Añadir padding para los botones
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (context) => HomePage()));
                    ;
                    // Handle form submission
                  }
                },
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: Center(
                    child: Text('Listo',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 20, 60),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
