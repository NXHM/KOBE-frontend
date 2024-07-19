import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/authController.dart';
import 'package:myapp/screens/Historial/historial_controller.dart';
import '../../entities/Movement.dart';
import '../../entities/Type.dart';
import '../../entities/Category.dart';

import 'package:http/http.dart' as http;

class EditarMovimientoController extends GetxController {
  var types = <Type>[].obs;
  //cambio jueves
  RxList<Category> categories = <Category>[].obs;
  RxBool loaded = false.obs;
  HistorialController historialController = Get.put(HistorialController());
  Rx<Movement> movement = Movement(amount: 0, date: DateTime.now()).obs;
  TextEditingController fecha = TextEditingController();
  //CAMBIOS GONZALO SE AGREGA TIPO Y CATEGORIA
  RxList<Type> tipos2 = <Type>[].obs;
  List<Category> categoriass = <Category>[].obs;
  TextEditingController tipo = TextEditingController();
  TextEditingController categoria = TextEditingController();
  TextEditingController monto = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  AuthController authController = Get.put(AuthController());

  Future<void> getCategoria() async {
    try {
      var token = await authController.getToken();
      final response = await http
          .get(Uri.parse("http://localhost:3000/api/categoriesType"), headers: {
        'Content-Type': 'application/json',
        'Authorization': token!
      });

      if (response.statusCode != 200) {
        print("Error obteniendo categorias");
        return;
      }

      print(response.body);

      List<dynamic> jsonResponse = json.decode(response.body);
      types.value = jsonResponse.map((item) => Type.fromJson(item)).toList();

      print("estoy aqui 2");
      print(types.first.toJson());

      loaded.value = true;
    } catch (e) {
      print("Error obteniendo categorias: $e");
    }
  }

//CAMBIOS GONZALO
  Rx<Type?> selectedTipo = Rx<Type?>(null);

  Future<void> getMovimiento(int movimiento_id) async {
    try {
      movement.value = historialController.historialMovimientos
          .where((element) => element.id == movimiento_id)
          .first;
      fecha.text = movement.value.date.toString();

      //CAMBIOS GONZALO
      selectedTipo.value = Type(
        id: movement.value.category!.type!.id,
        name: movement.value.category!.type!.name,
      );

      tipo.text = movement.value.category!.type!.name.toString();

      try {
        var token = await authController.getToken();
        final response = await http.post(
            Uri.parse("http://localhost:3000/api/categoriesType"),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token!,
            },
            body: jsonEncode({"type_id": selectedTipo.value?.id}));

        // List<dynamic> responseData = jsonDecode(response.body);
        // categoriass =
        //     responseData.map((item) => Category.fromJson(item)).toList();

        print("hola jueves");
        print(response.body);

        // List<dynamic> jsonResponse = json.decode(response.body);
        // var categories;
        // categories.value =
        //     jsonResponse.map((item) => Category.fromJson(item)).toList();

        // print("print de categories");
        // print(categories);

        if (response.statusCode == 200) {
          List<dynamic> jsonResponse = json.decode(response.body);
          print(jsonResponse);
          categories.value =
              jsonResponse.map((item) => Category.fromJson(item)).toList();

          print("print de categories");
          print(categories);
          for (var category in categories) {
            print(category.toString());
          }
        } else {
          print("Error obteniendo categorias");
        }
      } catch (e) {
        print("Exception: $e");
      }

      categoria.text = movement.value.category.toString();
      monto.text = movement.value.amount.toString();
      descripcion.text = movement.value.detail.toString();

      print("ESTOY AQUI CHANANANANA");
      print(selectedTipo.value);
    } catch (e) {
      loaded.value = true;
      print("Error obteniendo movimientos: $e");
    }
  }

  Future<void> editMovement(int movimiento_id, DateTime date, int category_id,
      double amount, String detail) async {
    try {
      var token = await authController.getToken();
      final response = await http.put(
          Uri.parse("http://localhost:3000/api/editmovimiento/$movimiento_id"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': token!,
          },
          body: jsonEncode({
            "date": date,
            "category_id": category_id,
            "amount": amount,
            "detail": detail
          }));

      if (response.statusCode == 200) {
        print("SE MODIFICO EL MOVIMIENTO: $movimiento_id");
        return;
      }
    } catch (e) {
      print(e);
    }
  }

  // Rx<Type?> selectedTipo = Rx<Type?>(null);
  // RxList<Type> tipos = <Type>[
  //   Type(id: 1, name: 'Ingreso'),
  //   Type(id: 2, name: 'Gasto'),
  //   Type(id: 3, name: 'Ahorro'),
  // ].obs;

  void setSelectedTipo(Type? newValue) {
    selectedTipo.value = newValue;
    getCategoria();
  }
}
