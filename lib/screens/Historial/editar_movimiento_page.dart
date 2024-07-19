import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/entities/Category.dart';
import 'package:myapp/screens/Home/home_page.dart';
import 'editar_movimiento_controller.dart';

class EditarMovimientoPage extends StatefulWidget {
  final int id;

  EditarMovimientoPage({required this.id});

  @override
  _EditarMovimientoPageState createState() => _EditarMovimientoPageState();
}

class _EditarMovimientoPageState extends State<EditarMovimientoPage> {
  final _formKey = GlobalKey<FormState>();
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Category? _selectedCategory;
  double? _amount;
  String? _comment;

  EditarMovimientoController _controller =
      Get.put(EditarMovimientoController());

  @override
  void initState() {
    super.initState();
    _controller.getMovimiento(widget.id).then((_) {
      selectedDate.value = DateTime.parse(_controller.fecha.text);
    });
  }

  String formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Editar Movimiento',
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
      body: FutureBuilder<void>(
        future: _controller.getMovimiento(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading data"));
          } else {
            return _buildPage();
          }
        },
      ),
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
                  Obx(() {
                    return TextFormField(
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
                              initialDate: selectedDate.value ?? DateTime.now(),
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
                              selectedDate.value = pickedDate;
                              _controller.fecha.text = formatDate(pickedDate);
                            }
                          },
                        ),
                      ),
                      readOnly: true,
                      controller: TextEditingController(
                          text: selectedDate.value != null
                              ? formatDate(selectedDate.value!)
                              : formatDate(
                                  DateTime.parse(_controller.fecha.text))),
                      validator: (value) {
                        if (selectedDate.value == null) {
                          return 'Por favor seleccione una fecha';
                        }
                        return null;
                      },
                    );
                  }),
                  SizedBox(height: 10),
                  Text('Tipo'),
                  SizedBox(height: 5),
                  Obx(() {
                    return TextFormField(
                      initialValue: _controller.tipo.value,
                      enabled: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 10),
                  Text('Categoría'),
                  SizedBox(height: 5),
                  Obx(() {
                    return TextFormField(
                      initialValue: _controller.categoria.value,
                      enabled: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 10),
                  Text('Monto'),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: _controller.monto,
                    decoration: InputDecoration(
                      hintText: 'Ingrese la cantidad',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      _controller.monto.text =
                          double.tryParse(value ?? '').toString();
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
                    controller: _controller.descripcion,
                    decoration: InputDecoration(
                      hintText: 'Ingrese la descripción',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.name,
                    onSaved: (value) {
                      _comment = value;
                    },
                  )
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
                    _controller.editMovement(
                      widget.id,
                      selectedDate.value!,
                      _amount!,
                      _comment!,
                    );
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/home',
                      (Route<dynamic> route) => false,
                    );
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
