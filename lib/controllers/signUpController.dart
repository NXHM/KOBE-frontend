// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpController extends GetxController {
  var statusMessage =
      ''.obs; // Usamos status message para que vea pantallas de estado

  // Metodo para crear usuario
  Future<void> createUser(String name, String username, String email,
      String password, String confirmPassword) async {
    if (username.isNotEmpty &&
        password.isNotEmpty &&
        name.isNotEmpty &&
        email.isNotEmpty) {
      const url =
          'http://localhost:3000/api/createUser'; // Reemplaza <ngrok_url> con la URL generada por ngrok
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
          'confirmPassword': confirmPassword,
          'name': name,
          'email': email,
        }),
      );
      if (response.statusCode == 200) {
        statusMessage.value = 'Sign-up successful';
      } else {
        statusMessage.value = 'Invalid username or password';
      }
    } else {
      statusMessage.value = 'Please enter all the required information';
    }
  }
}
