import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgetPasswordController extends GetxController {
  var statusMessage = ''.obs;

  Future<void> sendEmail(String email) async {
    if (email.isNotEmpty) {
      const url =
          'https://906b-191-98-138-140.ngrok-free.app/api/requestVerification';
      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({'email': email}),
        );
        if (response.statusCode == 200) {
          statusMessage.value = 'Code sent successfully';
        } else {
          statusMessage.value = 'Not email associated';
        }
      } catch (e) {
        statusMessage.value = 'Error: $e';
      }
    } else {
      statusMessage.value = 'Please enter an email';
    }
  }
}
