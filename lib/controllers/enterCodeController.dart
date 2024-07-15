import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EnterCodeController extends GetxController {
  var statusMessage = ''.obs;

  Future<void> validateCode(String email, String verificationCode) async {
    // Coloco por siaca el email empty
    if (email.isNotEmpty && verificationCode.isNotEmpty) {
      const url = 'https://bd1d-38-25-15-113.ngrok-free.app/api/validateCode';
      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              {'email': email, "verificationCode": verificationCode}),
        );
        if (response.statusCode == 200) {
          statusMessage.value = 'Code validated successfully';
        } else {
          statusMessage.value = 'Invalid code';
        }
      } catch (e) {
        statusMessage.value = 'Error: $e';
      }
    } else {
      statusMessage.value = 'Please enter the verification code';
    }
  }
}