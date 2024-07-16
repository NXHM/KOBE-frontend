import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/controllers/authController.dart';

class HistorialController extends GetxController {
  List<Map<String, dynamic>> historialMovimientos = [];
  AuthController authController = Get.put(AuthController());
  RxBool loaded = false.obs;

  Future<void> getHistorial() async {
    var token = await authController.getToken();
    try {
      final response = await http.post(
        Uri.parse("http://localhost:3000/api/movimientos2"),
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
      historialMovimientos =
          body.map((json) => json as Map<String, dynamic>).toList();

      print(historialMovimientos); // Para verificar los datos deserializados
      loaded.value = true;
    } catch (e) {
      loaded.value = true;
      print("Error obteniendo movimientos: $e");
    }
  }
}
