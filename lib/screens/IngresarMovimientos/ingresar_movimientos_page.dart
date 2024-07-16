import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ingresar_movimientos_controller.dart';
import '../../entities/Tipo.dart';
import '../../entities/Categoria.dart';
import '../../entities/Movimiento.dart';
import '../../entities/User.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Formulario Ejemplo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ingresar_movimientos_page(),
        ),
      ),
    );
  }
}

class ingresar_movimientos_page extends StatefulWidget {
  @override
  _ingresar_movimientos_pageState createState() => _ingresar_movimientos_pageState();
}

class _ingresar_movimientos_pageState extends State<ingresar_movimientos_page> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  Tipo? _selectedType;
  Categoria? _selectedCategory;
  double? _amount;
  String? _comment;

  final ingresar_movimientos_controller _controller = Get.put(ingresar_movimientos_controller());

@override
Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          color: Colors.white,
          elevation: 2,
          margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
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
                                    primary: Color.fromARGB(255, 0, 20, 60),
                                    onPrimary: Colors.white,
                                    surface: Colors.white,
                                    onSurface: Colors.black,
                                  ),
                                  dialogBackgroundColor: Colors.white,
                                ),
                                child: child!,
                              );
                            },
                          );
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
                      text: _selectedDate != null ? _selectedDate.toString() : '',
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
                          _selectedCategory = null; // Reiniciar categoría al cambiar el tipo
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
                          .where((categoria) => categoria.tipo.id == _controller.selectedTipo.value?.id)
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
                  ),
                  SizedBox(height: 10),
                  Text('Comentario'),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Ingrese comentario (opcional)',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    maxLines: 5,
                    onSaved: (value) {
                      _comment = value;
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Implementar aquí cualquier lógica adicional antes de enviar el movimiento
                    // No se realiza la llamada al servidor aquí, solo validación y guardado de datos
                  }
                },
                child: SizedBox(
                  width: 125,
                  height: 50,
                  child: Center(
                    child: Text('Siguiente', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Color.fromARGB(255, 0, 20, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print("Ingresa accion");
                    // Crear objeto Movimiento con los datos del formulario
                    Movimiento nuevoMovimiento = Movimiento(
                      id: 0, // Esto se asignará en el servidor
                      fecha: _selectedDate!,
                      tipo: _controller.selectedTipo.value!,
                      categoria: _selectedCategory!,
                      monto: _amount!,
                      comentario: _comment ?? '',
                      usuario: User(id: 1, name: 'Usuario de ejemplo'), // Aquí deberías obtener el usuario actual
                    );
                    print("Objeto creado");
                    print(nuevoMovimiento);
                    // Enviar el movimiento al servidor
                    await _controller.ingresarMovimiento(nuevoMovimiento);
                       // Mostrar un Snackbar indicando que se añadió el movimiento
                    Get.snackbar('Éxito', 'Movimiento ingresado correctamente');
                
                    // Reiniciar los campos del formulario
                    _formKey.currentState!.reset();
                    setState(() {
                      _selectedDate = null;
                      _selectedType = null;
                      _selectedCategory = null;
                      _amount = null;
                      _comment = null;
                    });
                    print("Movimiento enviado");
                  }
                },
                child: SizedBox(
                  width: 125,
                  height: 50,
                  child: Center(
                    child: Text('Listo', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
    ),
  );
}

}
