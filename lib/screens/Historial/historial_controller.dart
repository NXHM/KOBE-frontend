import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/controllers/authController.dart';

class HistorialController extends GetxController {
  var historialMovimientos = <Map<String, dynamic>>[].obs;
  AuthController authController = Get.put(AuthController());
  RxBool loaded = false.obs;

  Future<void> getHistorial() async {
    historialMovimientos.clear();
    loaded.value = false; // Asegúrate de que loaded sea falso antes de cargar
    var token = await authController.getToken();

    try {
      final response = await http.get(
        Uri.parse("http://localhost:3000/api/getMovementsHistorial"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token!,
        },
      );

      print("Código de estado de la respuesta: ${response.statusCode}");
      print("Cuerpo de la respuesta: ${response.body}");

      if (response.statusCode != 200) {
        print("Error obteniendo movimientos");
        return;
      }

      var body = json.decode(response.body) as List;
      for (var e in body) {
        historialMovimientos.add({
          'id': e['id'],
          'amount': e['amount'],
          'detail': e['detail'],
          'date': e['date'],
          'categoryId': e['categoryId'],
          'categoryName': e['category'],
          'typeId': e['typeId'],
          'typeName': e['type'],
        });
      }

      print(historialMovimientos); // Para verificar los datos deserializados
    } catch (e) {
      print("Error obteniendo movimientos: $e");
    } finally {
      loaded.value = true; // Establecer loaded a true después de cargar
    }
  }

  void setLoaded(bool value) {
    loaded.value = true;
  }
}
