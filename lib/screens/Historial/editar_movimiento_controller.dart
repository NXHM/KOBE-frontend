import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/controllers/authController.dart';
import 'package:myapp/screens/Historial/historial_controller.dart';
import '../../entities/Movement.dart';
import '../../entities/Type.dart';
import '../../entities/Category.dart';

class EditarMovimientoController extends GetxController {
  var types = <Type>[].obs;
  RxList<Category> categories = <Category>[].obs;
  RxBool loaded = false.obs;
  HistorialController historialController = Get.put(HistorialController());
  Rx<Movement> movement = Movement(amount: 0, date: DateTime.now()).obs;
  TextEditingController fecha = TextEditingController();
  RxString tipo = "".obs;
  RxString categoria = "".obs;
  TextEditingController monto = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  AuthController authController = Get.put(AuthController());

  Future<void> getCategoria() async {
    try {
      var token = await authController.getToken();
      final response = await http.get(
        Uri.parse("http://localhost:3000/api/categoriesType"),
        headers: {'Content-Type': 'application/json', 'Authorization': token!},
      );

      if (response.statusCode != 200) {
        print("Error obteniendo categorias");
        return;
      }

      List<dynamic> jsonResponse = json.decode(response.body);
      types.value = jsonResponse.map((item) => Type.fromJson(item)).toList();
      loaded.value = true;
    } catch (e) {
      print("Error obteniendo categorias: $e");
    }
  }

  Rx<Type?> selectedTipo = Rx<Type?>(null);

  Future<void> getMovimiento(int movimiento_id) async {
    try {
      var token = await authController.getToken();
      final response = await http.get(
        Uri.parse("http://localhost:3000/api/getMovement/$movimiento_id"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token!,
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        fecha.text = jsonResponse['date'];
        tipo.value = jsonResponse['type_name'];
        selectedTipo.value = Type(
          id: jsonResponse['type_id'],
          name: jsonResponse['type_name'],
        );
        categoria.value = jsonResponse['category_name'];
        monto.text = jsonResponse['amount'].toString();
        descripcion.text = jsonResponse['detail'] ?? "";

        await getCategoriasByTypeId(jsonResponse['type_id']);
      } else {
        print("Error obteniendo el movimiento");
      }
    } catch (e) {
      print("Error obteniendo movimientos: $e");
    }
  }

  Future<void> getCategoriasByTypeId(int typeId) async {
    try {
      var token = await authController.getToken();
      final response = await http.post(
        Uri.parse("http://localhost:3000/api/categoriesType"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token!,
        },
        body: jsonEncode({"type_id": typeId}),
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        categories.value =
            jsonResponse.map((item) => Category.fromJson(item)).toList();
      } else {
        print("Error obteniendo categorias");
      }
    } catch (e) {
      print("Error obteniendo categorias: $e");
    }
  }

  Future<void> editMovement(
      int movimiento_id, DateTime date, double amount, String detail) async {
    try {
      var token = await authController.getToken();
      final response = await http.put(
        Uri.parse("http://localhost:3000/api/editmovimiento/$movimiento_id"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token!,
        },
        body: jsonEncode({
          "date": date.toIso8601String(),
          "amount": amount,
          "detail": detail
        }),
      );

      if (response.statusCode == 200) {
        print("SE MODIFICO EL MOVIMIENTO: $movimiento_id");
      } else {
        print("Error modificando el movimiento");
      }
    } catch (e) {
      print(e);
    }
  }
}
