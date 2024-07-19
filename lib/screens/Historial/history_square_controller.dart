import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/controllers/authController.dart';
import 'package:myapp/entities/models.dart';

class HistorySquareController extends GetxController {
  AuthController authController = Get.put(AuthController());

  Future<void> deleteMovement(int id) async {
    var token = await authController.getToken();
    try {
      final response = await http.delete(
        Uri.parse('http://localhost:3000/api/deletemovimiento/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token!,
        },
      );

      print("Cuerpo de la respuesta: ${response.body}");
    } catch (e) {
      print(e);
    }
  }
}
