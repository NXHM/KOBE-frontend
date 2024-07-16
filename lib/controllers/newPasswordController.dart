// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// definimos la clase signinController que extiende getx -> getx
class NewPasswordController extends GetxController {
  var statusMessage = ''.obs; //usamos status message para que vea pantallas de estado

  Future<void> changePassword(String email, String newPassword, String confirmPassword) async {
    if (email.isNotEmpty) {
      const url = 'https://906b-191-98-138-140.ngrok-free.app/api/changePassword';
      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({'email': email, 'newPassword':newPassword,'confirmPassword':confirmPassword}),
        );
        if (response.statusCode == 200) {
          statusMessage.value = 'Password Changed Successfully';
        } else {
          statusMessage.value = 'Password has not changed';
        }
      } catch (e) {
        statusMessage.value = 'Error: $e';
      }
    } else {
      statusMessage.value = 'Please enter an email';
    }
  }
}
